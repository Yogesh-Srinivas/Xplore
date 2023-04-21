import UIKit

class MyTripViewController: UITableViewController {
    
    let databaseController : PlaceDBController
    
    lazy var swapItem = {
        let barButtonItem = UIBarButtonItem()
        barButtonItem.image = UIImage(systemName: "rectangle.2.swap")
        barButtonItem.tintColor = .label
        barButtonItem.target = self
        barButtonItem.action = #selector(self.swapControlAction)
        barButtonItem.tag = 0
        return barButtonItem
    }()
    
    lazy var emptyPlaceListView = {
        let emptyDetailView = EmptyDetailView(
                    frame: .zero,
                    image: UIImage(named: "noPlace"),
                    message: "No trips booked yet!")
        return emptyDetailView
    }()
        
    var reservedList : [BookedTrip] = []
    var reservedListPlaceDetails : [TravelPlaceDetail] = []
    
    var visitedList : [BookedTrip] = []
    var visitedListPlaceDetails : [TravelPlaceDetail] = []
    
    lazy var primaryBookedTripDataSource = reservedList
    lazy var primaryPlaceDetailDataSource = reservedListPlaceDetails
    
    init(databaseController: PlaceDBController){
        self.databaseController = databaseController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getTripDetails(){
        let tripDetails = databaseController.getbookedTripDetail()
        
        let convertedTripDetails = convertBookedTripListToCurrentCurrency(bookedTripList: tripDetails)
        
        visitedList = []
        visitedListPlaceDetails = []
        reservedList = []
        reservedListPlaceDetails = []
        
        for tripDetail in convertedTripDetails {
            if let placeDetail = databaseController.getPlaceDetail(placeId: tripDetail.placeId){
                let convertedPlaceDetail = convertPlaceDetailToCurrenctCurrency(placeDetail: placeDetail)
                if tripDetail.isVisited{
                    visitedList.append(tripDetail)
                    visitedListPlaceDetails.append(convertedPlaceDetail)
                }else{
                    reservedList.append(tripDetail)
                    reservedListPlaceDetails.append(convertedPlaceDetail)
                }
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setCustomBackground()
                
        tableView.register(UITableViewCell.self,forCellReuseIdentifier: "MyTripTableCell")
        tableView.showsVerticalScrollIndicator = false
        
        view.addSubview(emptyPlaceListView)
        
        setupEmptyPlaceListView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.tabBar.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.rightBarButtonItem = swapItem
        self.navigationItem.title = swapItem.tag == 0 ? "Reserved" : "Visited"
        
        getTripDetails()
        updateprimaryDatasource()
        tableView.reloadData()
        
        if reservedList.isEmpty{
            emptyPlaceListView.isHidden = false
        }else{
            emptyPlaceListView.isHidden = true
        }
        
        if visitedList.isEmpty{
            swapItem.isHidden = true
        }
    }
    
    private func setupEmptyPlaceListView(){
        emptyPlaceListView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emptyPlaceListView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            emptyPlaceListView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            emptyPlaceListView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            emptyPlaceListView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    private func convertBookedTripListToCurrentCurrency(bookedTripList : [BookedTrip]) -> [BookedTrip]{
        var convertedBookedTripList : [BookedTrip] = []
        for placeDetail in bookedTripList {
            var placeDetail = placeDetail
            let currentCurrencyCode =  GeneralUtils.getCurrentCurrency()
            placeDetail.pricePerDay = GeneralUtils.convertCurrency(
                of: placeDetail.pricePerDay,
                from: placeDetail.currencyCode,
                to: currentCurrencyCode)
            placeDetail.serviceFee = GeneralUtils.convertCurrency(
                of: placeDetail.serviceFee,
                from: placeDetail.currencyCode,
                to: currentCurrencyCode)
            placeDetail.cleaningFee = GeneralUtils.convertCurrency(
                of: placeDetail.cleaningFee,
                from: placeDetail.currencyCode,
                to: currentCurrencyCode)
            placeDetail.currencyCode = currentCurrencyCode
            convertedBookedTripList.append(placeDetail)
        }
        return convertedBookedTripList
    }
    
    private func convertPlaceDetailToCurrenctCurrency(placeDetail : TravelPlaceDetail) -> TravelPlaceDetail{
        var placeDetail = placeDetail
        
        let currentCurrencyCode =  GeneralUtils.getCurrentCurrency()
        
        placeDetail.price.pricePerDay = GeneralUtils.convertCurrency(
            of: placeDetail.price.pricePerDay,
            from: placeDetail.price.currencyCode,
            to: currentCurrencyCode)
        
        placeDetail.price.currencyCode = currentCurrencyCode
        
        return placeDetail
    }
    
    @objc private func swapControlAction(){
        
        
        swapItem.tag = swapItem.tag == 0 ? 1 : 0
        self.navigationItem.title = swapItem.tag == 0 ? "Reserved" : "Visited"
        
        getTripDetails()
        updateprimaryDatasource()
        
        if primaryBookedTripDataSource.isEmpty{
            emptyPlaceListView.isHidden = false
        }else{
            emptyPlaceListView.isHidden = true
        }
        tableView.reloadData()
        
       
    }
    
    private func updateprimaryDatasource(){
        if swapItem.tag == 0 {
            primaryBookedTripDataSource = reservedList
            primaryPlaceDetailDataSource = reservedListPlaceDetails
        }else{
            primaryBookedTripDataSource = visitedList
            primaryPlaceDetailDataSource = visitedListPlaceDetails
        }
    }
    
    private func configTabelCell(cell : inout UITableViewCell,row : Int){
        
        
        var contentConfig = UIListContentConfiguration.valueCell()
        contentConfig.text = primaryPlaceDetailDataSource[row].placeName
        contentConfig.textProperties.configSemiPrimary()
        contentConfig.textProperties.numberOfLines = 4
        contentConfig.textToSecondaryTextVerticalPadding = 3
        
        let totalPrice = primaryBookedTripDataSource[row].totalPrice + ControlCenter.serviceFee + ControlCenter.cleaningFee
        
        contentConfig.secondaryText = "\(primaryPlaceDetailDataSource[row].price.currencyCode) \(totalPrice)  (\(primaryBookedTripDataSource[row].numberOfDays) Days)"

        contentConfig.secondaryTextProperties.configSecondaryFadedStyle()
        
        var placeImage = UIImage(named: "loadingImage")
        
        if let imageDate = databaseController.getImageData(for: primaryPlaceDetailDataSource[row].images[0]){
            placeImage = UIImage(data: imageDate)
        }
        
        contentConfig.image = placeImage
        contentConfig.imageProperties.reservedLayoutSize = CGSize(width: 100, height: 100)
        contentConfig.imageProperties.maximumSize = CGSize(width: 125, height: 100)
        contentConfig.imageToTextPadding = 20
        contentConfig.imageProperties.cornerRadius = 15
      
        cell.contentConfiguration = contentConfig
        
    }

}
extension MyTripViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        primaryPlaceDetailDataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyTripTableCell", for: indexPath)
        
        configTabelCell(cell: &cell, row: indexPath.row)
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if swapItem.tag == 0 {
            self.navigationController?.pushViewController(
                ReservedPlaceDetailViewController(
                    placeDetails: primaryPlaceDetailDataSource[indexPath.row],
                    databaseController: databaseController,
                    tripDetails: primaryBookedTripDataSource[indexPath.row]
                ),
                    animated: true)
        } else{
            
            self.navigationController?.pushViewController(
                
                VisitedPlaceDetailViewController(
                    placeDetails: primaryPlaceDetailDataSource[indexPath.row],
                    tripDetails: primaryBookedTripDataSource[indexPath.row],
                    databaseController: databaseController
            ),
                    animated: true)
        }
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

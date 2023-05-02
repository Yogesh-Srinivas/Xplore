import UIKit

class MyTripViewController: UIViewController {

    let databaseController : PlaceDBController

    lazy var segmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Reserved","Visited"])
        segmentedControl.selectedSegmentTintColor = .systemPink
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .systemBackground
        segmentedControl.addTarget(self, action: #selector(segmentedControlAction), for: .valueChanged)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .medium)], for: UIControl.State.normal)

        return segmentedControl
    }()
    
    lazy var emptyPlaceListView = {
        let emptyDetailView = EmptyDetailView(
                    frame: .zero,
                    image: UIImage(named: "notBooked"),
                    message: "No trips booked yet!")
        return emptyDetailView
    }()

    lazy var commonTableView = UITableView()

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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.setCustomBackground()
        
        
        view.addSubview(segmentedControl)
        view.addSubview(commonTableView)
        commonTableView.register(PlaceListCustomCell.self, forCellReuseIdentifier: "MyTripTableCell")
        commonTableView.separatorStyle = .none
        view.addSubview(emptyPlaceListView)

        setupSegmentedControl()
        setupCommonTableView()
        setupEmptyPlaceListView()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.backgroundColor = .systemBackground
        self.navigationItem.title = "My Trip"
        
        getTripDetails()
        segmentedControlAction()
        
    }

    @objc private func segmentedControlAction(){
        if segmentedControl.selectedSegmentIndex == 1{
            primaryBookedTripDataSource = visitedList
            primaryPlaceDetailDataSource = visitedListPlaceDetails
        }else{
            primaryBookedTripDataSource = reservedList
            primaryPlaceDetailDataSource = reservedListPlaceDetails
        }
        
        if primaryBookedTripDataSource.isEmpty{
            emptyPlaceListView.isHidden = false
            emptyPlaceListView.message = segmentedControl.selectedSegmentIndex == 0 ? "No trips booked yet!" : "Haven't explored any place yet!"
            emptyPlaceListView.emptyImage = segmentedControl.selectedSegmentIndex == 0 ? UIImage(named: "notBooked") : UIImage(named: "unexplored")
        }else{
            emptyPlaceListView.isHidden = true
        }
        
        commonTableView.reloadData()
    }
  
    
    private func setupSegmentedControl(){
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo:  self.view.safeAreaLayoutGuide.topAnchor,constant: 5),
            segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            segmentedControl.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupEmptyPlaceListView(){
        emptyPlaceListView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emptyPlaceListView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            emptyPlaceListView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            emptyPlaceListView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            emptyPlaceListView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }

    private func setupCommonTableView(){
        commonTableView.delegate = self
        commonTableView.dataSource = self
        commonTableView.register(PlaceDetailCardView.self,forCellReuseIdentifier: PlaceDetailCardView.reuseIdentifier)
        commonTableView.showsVerticalScrollIndicator = false

        commonTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            commonTableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10),
            commonTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 2),
            commonTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -2),
            commonTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
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

    private func configTabelCell(cell : inout PlaceListCustomCell,row : Int){
        
        
        cell.primaryLabel.text = primaryPlaceDetailDataSource[row].placeName
        
        let totalPrice = (primaryBookedTripDataSource[row].totalPrice + ControlCenter.serviceFee + ControlCenter.cleaningFee).round(to: 2)
        cell.secondaryLabel.text = "\(primaryPlaceDetailDataSource[row].price.currencyCode) \(totalPrice)  (\(primaryBookedTripDataSource[row].numberOfDays) Days)"
        
        
        var placeImage = UIImage(named: "loadingImage")
        
        if let imageDate = databaseController.getImageData(for: primaryPlaceDetailDataSource[row].images[0]){
            placeImage = UIImage(data: imageDate)
        }
        
        cell.headerImage.image = placeImage
        
    }

}
extension MyTripViewController : UITableViewDelegate,UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        primaryPlaceDetailDataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = commonTableView.dequeueReusableCell(withIdentifier: "MyTripTableCell", for: indexPath) as! PlaceListCustomCell

        configTabelCell(cell: &cell,row: indexPath.row)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


        if segmentedControl.selectedSegmentIndex == 0 {
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

}

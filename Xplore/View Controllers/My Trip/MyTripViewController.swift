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
        var tripDetails = databaseController.getbookedTripDetail()
        
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
        
//        visitedList = convertBookedTripListToCurrentCurrency(bookedTripList: visitedList)
//        
//        reservedList = convertBookedTripListToCurrentCurrency(bookedTripList: reservedList)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setCustomBackground()
                
        tableView.register(PlaceDetailCardView.self,forCellReuseIdentifier: PlaceDetailCardView.reuseIdentifier)
        tableView.showsVerticalScrollIndicator = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.tabBar.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.rightBarButtonItem = swapItem
        self.navigationItem.title = "Reserved"
        
        getTripDetails()
        updateprimaryDatasource()
        tableView.reloadData()
    }
    
    private func convertBookedTripListToCurrentCurrency(bookedTripList : [BookedTrip]) -> [BookedTrip]{
        var convertedBookedTripList : [BookedTrip] = []
        for placeDetail in bookedTripList {
            var placeDetail = placeDetail
            let currentCurrencyCode =  GeneralUtils.getCurrentCurrency() ?? "USD"
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
        
        let currentCurrencyCode =  GeneralUtils.getCurrentCurrency() ?? "USD"
        
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

    
    private func configCell(row : Int,cell : PlaceDetailCardView){
        cell.wishListButton.isHidden = true
        cell.addImages(imageUrls: primaryPlaceDetailDataSource[row].images)
            
        let totalPrice = primaryBookedTripDataSource[row].totalPrice + ControlCenter.serviceFee + ControlCenter.cleaningFee
        
        let priceAmount = "\(primaryPlaceDetailDataSource[row].price.currencyCode) \(totalPrice)  (\(primaryBookedTripDataSource[row].numberOfDays) Days)"
        
        cell.priceLabelButton.setTitle(priceAmount, for: .normal)
        cell.priceLabelButton.titleLabel?.configSecondaryStyle()
        
        cell.titleCardView.text = primaryPlaceDetailDataSource[row].placeName
        cell.titleCardView.configSecondaryStyle()
        
        cell.locationCardView.text = "\(primaryPlaceDetailDataSource[row].location.city), \(primaryPlaceDetailDataSource[row].location.state), \(primaryPlaceDetailDataSource[row].location.country)"
        cell.locationCardView.configSecondaryStyle()
        
        cell.ratingCard.text = primaryPlaceDetailDataSource[row].ratingDetail.count != 0 ? "\(Constants.RATING_STAR)\(Constants.BULLETING_POINT)\(primaryPlaceDetailDataSource[row].placeRating) (\(primaryPlaceDetailDataSource[row].ratingDetail.count))" : "\(Constants.RATING_STAR) new"
    }

}
extension MyTripViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        primaryPlaceDetailDataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlaceDetailCardView.reuseIdentifier, for: indexPath) as! PlaceDetailCardView
        
        configCell(row: indexPath.row, cell: cell)
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

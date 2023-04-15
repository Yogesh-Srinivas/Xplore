import UIKit

class MyTripViewController: UITableViewController {
    
    let databaseController : PlaceDBController
    
//    lazy var segmentedControl = {
//        let segmentedControl = UISegmentedControl(items: ["Reserved","Visited"])
//        segmentedControl.selectedSegmentTintColor = .systemPink
//        segmentedControl.tintColor = .systemPink
//        segmentedControl.selectedSegmentIndex = 0
//        segmentedControl.addTarget(self, action: #selector(segmentedControlAction), for: .valueChanged)
//
//        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
//
//        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .medium)], for: UIControl.State.normal)
//
//
//        return segmentedControl
//    }()
    
    lazy var swapItem = {
        let barButtonItem = UIBarButtonItem()
        barButtonItem.image = UIImage(systemName: "rectangle.2.swap")
        barButtonItem.tintColor = .label
        barButtonItem.target = self
        barButtonItem.action = #selector(self.swapControlAction)
        barButtonItem.tag = 0
        return barButtonItem
    }()
    
//    lazy var commonTableView = UITableView()
    
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
        
        visitedList = []
        visitedListPlaceDetails = []
        reservedList = []
        reservedListPlaceDetails = []
        
       
        
        for tripDetail in tripDetails {
            if let placeDetail = databaseController.getPlaceDetail(placeId: tripDetail.placeId){
                if tripDetail.isVisited{
                    visitedList.append(tripDetail)
                    visitedListPlaceDetails.append(placeDetail)
                }else{
                    reservedList.append(tripDetail)
                    reservedListPlaceDetails.append(placeDetail)
                }
            }
            
        }
       
        
       
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setCustomBackground()
        
//        view.addSubview(segmentedControl)
//        view.addSubview(commonTableView)
        
//        setupSegmentedControl()
//        setupCommonTableView()
        
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
//
//    private func setupSegmentedControl(){
//        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
//            segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
//            segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
//            segmentedControl.heightAnchor.constraint(equalToConstant: 50)
//        ])
//    }
    
//    private func setupCommonTableView(){
//        commonTableView.delegate = self
//        commonTableView.dataSource = self
//
//
//        commonTableView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            commonTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
//            commonTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 2),
//            commonTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -2),
//            commonTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
//        ])
//    }
    
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

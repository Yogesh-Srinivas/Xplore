import UIKit

class MyTripViewController: UIViewController {
    
    let databaseController : PlaceDBController
    
    lazy var segmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Reserved","Visited"])
        segmentedControl.selectedSegmentTintColor = .systemPink
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .systemBackground
        segmentedControl.addTarget(self, action: #selector(segmentedControlAction), for: .valueChanged)
        return segmentedControl
    }()
    
    lazy var commonTableView = UITableView()
    
    var reservedList : [BookedTrip] = DataHold.bookedTrips
    var reservedListPlaceDetails : [TravelPlaceDetail] = DataHold.travelPlaceDetails
    
    var visitedList : [BookedTrip] = DataHold.bookedTrips
    var visitedListPlaceDetails : [TravelPlaceDetail] = DataHold.travelPlaceDetails
    
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
        
        visitedList.remove(at: 0)
        setupSegmentedControl()
        setupCommonTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.tabBar.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc private func segmentedControlAction(){
        if segmentedControl.selectedSegmentIndex == 1{
            primaryPlaceDetailDataSource = visitedListPlaceDetails
        }else{
            primaryPlaceDetailDataSource = reservedListPlaceDetails
        }
        commonTableView.reloadData()
    }
    private func setupSegmentedControl(){
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 5),
            segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            segmentedControl.heightAnchor.constraint(equalToConstant: 40)
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
    
    private func configCell(row : Int,cell : PlaceDetailCardView){
        cell.wishListButton.isHidden = true
        cell.addImages(imageUrls: primaryPlaceDetailDataSource[row].images)
        
        let fromDate = primaryBookedTripDataSource[row].BookedDateFrom
        let toDate = primaryBookedTripDataSource[row].BookedDateTo
        
        
        if let toDate = toDate,let numberOfDays = GeneralUtils.getNumberOfDays(from: fromDate, to: toDate){
            
            let pricePerDay = primaryBookedTripDataSource[row].pricePerNight
            
            let priceAmount = "\(numberOfDays) Days x \(pricePerDay) = \(primaryPlaceDetailDataSource[row].price.currencyCode) \(pricePerDay * numberOfDays)"
            
            cell.priceLabelButton.setTitle(priceAmount, for: .normal)
            cell.priceLabelButton.titleLabel?.configSecondaryStyle()
        }
        
        cell.titleCardView.text = primaryPlaceDetailDataSource[row].placeName
        cell.titleCardView.configSecondaryStyle()
        
        cell.locationCardView.text = "\(primaryPlaceDetailDataSource[row].location.city), \(primaryPlaceDetailDataSource[row].location.state), \(primaryPlaceDetailDataSource[row].location.country)"
        cell.locationCardView.configSecondaryStyle()
        
        cell.ratingCard.text = primaryPlaceDetailDataSource[row].ratingDetail.count != 0 ? "\(Constants.RATING_STAR)\(Constants.BULLETING_POINT)\(primaryPlaceDetailDataSource[row].placeRating) (\(primaryPlaceDetailDataSource[row].ratingDetail.count))" : "\(Constants.RATING_STAR) new"
    }

}
extension MyTripViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        primaryPlaceDetailDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = commonTableView.dequeueReusableCell(withIdentifier: PlaceDetailCardView.reuseIdentifier, for: indexPath) as! PlaceDetailCardView
        
        configCell(row: indexPath.row, cell: cell)
        
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
    
}

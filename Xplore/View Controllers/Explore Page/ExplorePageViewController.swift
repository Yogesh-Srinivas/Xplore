import UIKit

class ExplorePageViewController: UITableViewController {
    
    let databaseController : PlaceDBController = DatabaseController.shared
    
    let imageFetcher : FetchableImage = DatabaseController.shared
    
    var placeDetailsList : [TravelPlaceDetail] = []
    
    var filteredPlaceList : [TravelPlaceDetail] = []
    
    lazy var noSearchResultView = {
        let emptyDetailView = EmptyDetailView(
                    frame: .zero,
                    image: UIImage(named: "noResult"),
                    message: "No Result Found.")
        return emptyDetailView
    }()
    
    lazy var searchItem = {
        let barButtonItem = UIBarButtonItem()
        barButtonItem.image = UIImage(systemName:"magnifyingglass")
        barButtonItem.tintColor = .label
        barButtonItem.target = self
        barButtonItem.action = #selector(searchButtonAction)
        return barButtonItem
    }()
    
    lazy var cancelSearchItem = {
        let barButtonItem = UIBarButtonItem()
        barButtonItem.image = UIImage(systemName:"xmark")
        barButtonItem.tintColor = .label
        barButtonItem.target = self
        barButtonItem.action = #selector(cancelSearchButtonAction)
        return barButtonItem
    }()
    
    private let emptyHeartImage = {
        let image = UIImage(systemName: "heart")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        return image
    }()
    
    private let fullHeartImage = {
        let image = UIImage(systemName: "heart.fill")?.withTintColor(.systemPink, renderingMode: .alwaysOriginal)
        return image
    }()
    
    init(databaseController : PlaceDBController){
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(PlaceDetailCardView.self, forCellReuseIdentifier: PlaceDetailCardView.reuseIdentifier)
        self.tableView.bounces = false
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.separatorStyle = .none

        
        self.navigationItem.rightBarButtonItem = searchItem
        self.navigationItem.title = "Xplore"
        self.placeDetailsList = databaseController.getAllPlaceDetail()
        self.filteredPlaceList = placeDetailsList
        
        view.addSubview(noSearchResultView)
        setupNoSearchResultView()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.tabBar.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        updateWishListDetails()
        updateRatingDetails()
        convertFilteredListToCurrentCurrency()
        tableView.reloadData()
        
        if filteredPlaceList.isEmpty{
            noSearchResultView.isHidden = false
        }else{
            noSearchResultView.isHidden = true
        }
    }
    
    private func setupNoSearchResultView(){
        noSearchResultView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            noSearchResultView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            noSearchResultView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            noSearchResultView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            noSearchResultView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    private func updateWishListDetails(){
        for placeDetailIndex in 0..<placeDetailsList.count {
            let placeId = placeDetailsList[placeDetailIndex].placeId
            placeDetailsList[placeDetailIndex].isWishListed =  databaseController.isWishListed(placeId : placeId)
        }
        
        for placeDetailIndex in 0..<filteredPlaceList.count {
            let placeId = filteredPlaceList[placeDetailIndex].placeId
            filteredPlaceList[placeDetailIndex].isWishListed =  databaseController.isWishListed(placeId : placeId)
        }

    }
    
    private func updateRatingDetails(){
        for placeDetailIndex in 0..<placeDetailsList.count {
            let placeId = placeDetailsList[placeDetailIndex].placeId
            placeDetailsList[placeDetailIndex].ratingDetail =  databaseController.getRatingDetail(placeId: placeId)
        }

        for placeDetailIndex in 0..<filteredPlaceList.count {
            let placeId = filteredPlaceList[placeDetailIndex].placeId
            filteredPlaceList[placeDetailIndex].ratingDetail =  databaseController.getRatingDetail(placeId: placeId)
        }

    }
    
    private func convertFilteredListToCurrentCurrency(){
        var convertedFilteredList : [TravelPlaceDetail] = []
        for placeDetail in filteredPlaceList {
            var placeDetail = placeDetail
            let currentCurrencyCode =  GeneralUtils.getCurrentCurrency()
            placeDetail.price.pricePerDay = GeneralUtils.convertCurrency(
                of: placeDetail.price.pricePerDay,
                from: placeDetail.price.currencyCode,
                to: currentCurrencyCode)
            placeDetail.price.currencyCode = currentCurrencyCode
            convertedFilteredList.append(placeDetail)
        }
        filteredPlaceList = convertedFilteredList
    }
    
    private func configTabelCell(cell : inout PlaceDetailCardView,row : Int){
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(cellImageOnTapAction(_:)))
        
        cell.imagesCollectionView.tag = row
        cell.imagesCollectionView.addGestureRecognizer(gestureRecognizer)
        cell.addImages(imageUrls: filteredPlaceList[row].images)
        
        let taxAmount = (filteredPlaceList[row].price.taxPercentage * 0.01 * filteredPlaceList[row].price.pricePerDay).round(to: 2)
        let priceAmount = "\(filteredPlaceList[row].price.currencyCode) \((filteredPlaceList[row].price.pricePerDay + taxAmount).round(to: 2))"
        
        cell.priceLabelButton.titleLabel?.removeUnderline()
        cell.priceLabelButton.setTitle(priceAmount, for: .normal)
        cell.priceLabelButton.addTarget(self, action: #selector(priceButtonOnTapAction(_:)), for: .touchDown)
        cell.priceLabelButton.tag = row
        
        cell.priceLabelButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        
        cell.priceLabelButton.titleLabel?.underline()
        
        cell.titleCardView.text = filteredPlaceList[row].placeName
        cell.titleCardView.font = .systemFont(ofSize: 16, weight: .medium)
        
        cell.locationCardView.text = "\(filteredPlaceList[row].location.city), \(filteredPlaceList[row].location.state), \(filteredPlaceList[row].location.country)"
        
        cell.locationCardView.font = .systemFont(ofSize: 14, weight: .light)
        cell.locationCardView.textColor = .systemGray
        
        cell.ratingCard.text = filteredPlaceList[row].ratingDetail.count != 0 ? "\(Constants.RATING_STAR) \(filteredPlaceList[row].placeRating) (\(filteredPlaceList[row].ratingDetail.count))" : "\(Constants.RATING_STAR) new"
        cell.ratingCard.font = .systemFont(ofSize: 15, weight: .regular)
        
        cell.wishListButton.tag = row
        
        if filteredPlaceList[row].isWishListed {
            
            cell.wishListButton.setImage(fullHeartImage, for: .normal)
            
            
            cell.wishListButton.removeTarget(self, action: #selector(wishListButtonOnTapActionAddToWishList(_:)), for: .touchUpInside)
            
            cell.wishListButton.addTarget(self, action: #selector(wishListButtonOnTapActionRemoveFromWishList(_:)), for: .touchUpInside)
                        
        }else{
            
            cell.wishListButton.setImage(emptyHeartImage, for: .normal)
            
            
            cell.wishListButton.removeTarget(self, action: #selector(wishListButtonOnTapActionRemoveFromWishList(_:)), for: .touchUpInside)
            
            cell.wishListButton.addTarget(self, action: #selector(wishListButtonOnTapActionAddToWishList(_:)), for: .touchUpInside)
            
        }

    }
    
    @objc private func priceButtonOnTapAction(_ sender: UIButton){
 
        let priceVc = PricePresentationViewController(priceDetails: filteredPlaceList[sender.tag].price,placeTitle: filteredPlaceList[sender.tag].placeName)
        
        priceVc.modalPresentationStyle = .formSheet
        priceVc.sheetPresentationController?.detents = [.custom(resolver: { _ in 270 })]
        present(priceVc, animated: true)
    }
    
    @objc private func wishListButtonOnTapActionAddToWishList(_ sender: UIButton){
        let placeId = filteredPlaceList[sender.tag].placeId
        
        databaseController.addToWishList(placeId: placeId)
        
        sender.setImage(fullHeartImage, for: .normal)
        
        filteredPlaceList[sender.tag].isWishListed = true
        
        if let indexOfPlaceList = placeDetailsList.firstIndex(where: {
            (placeDetail) in placeDetail == self.filteredPlaceList[sender.tag] ? true : false}
        ){
            self.placeDetailsList[indexOfPlaceList].isWishListed = filteredPlaceList[sender.tag].isWishListed
        }
        
        
        sender.removeTarget(self, action: #selector(wishListButtonOnTapActionAddToWishList(_:)), for: .touchUpInside)
        
        sender.addTarget(self, action: #selector(wishListButtonOnTapActionRemoveFromWishList(_:)), for: .touchUpInside)
       
    }
    
    func cellOnTapAction(row : Int){
        let wishListButtonClosure = { [unowned self] in
           
            self.filteredPlaceList[row].isWishListed = self.filteredPlaceList[row].isWishListed ? false : true
            
            if let indexOfPlaceList = placeDetailsList.firstIndex(where: {
                (placeDetail) in placeDetail == self.filteredPlaceList[row] ? true : false}
            ){
                self.placeDetailsList[indexOfPlaceList].isWishListed = self.filteredPlaceList[row].isWishListed
            }
        }
        
        let placeDetailedPageViewController =  UnreservedPlaceDetailsViewController(
            placeDetails: filteredPlaceList[row],
            databaseController: databaseController,wishListButtonClosure : wishListButtonClosure)
                
        self.navigationController?.pushViewController(
           placeDetailedPageViewController,
                animated: true)
    }
    
    @objc func cellImageOnTapAction(_ gestureRecognizer : UIGestureRecognizer){
        if let row = gestureRecognizer.view?.tag{
            cellOnTapAction(row: row)
        }
    }
    
    
    @objc func wishListButtonOnTapActionRemoveFromWishList(_ sender: UIButton){
        
        
        let placeId = filteredPlaceList[sender.tag].placeId
        databaseController.removeFromWishList(placeId: placeId)
    
        sender.setImage(emptyHeartImage, for: .normal)
        
        filteredPlaceList[sender.tag].isWishListed = false
        
        if let indexOfPlaceList = placeDetailsList.firstIndex(where: {
            (placeDetail) in placeDetail == self.filteredPlaceList[sender.tag] ? true : false}
        ){
            self.placeDetailsList[indexOfPlaceList].isWishListed = filteredPlaceList[sender.tag].isWishListed
        }
        
        sender.removeTarget(self, action: #selector(wishListButtonOnTapActionRemoveFromWishList(_:)), for: .touchUpInside)
        
        sender.addTarget(self, action: #selector(wishListButtonOnTapActionAddToWishList(_:)), for: .touchUpInside)
        
    }
    
    @objc private func searchButtonAction(){
        let searchViewController = SearchViewController(databaseController: databaseController){
            
            [unowned self](fromDate : DateComponents?,
                           toDate : DateComponents?,
                           guestDetails : GuestInfo,
                           locationDetail : FilteredLocation?) in
            
            self.filteredPlaceList = []
            
            if fromDate == nil && toDate == nil && guestDetails.numberOfGuests == 1 && locationDetail == nil{
                
                self.filteredPlaceList = placeDetailsList
                
            }else{
                for placeDetail in placeDetailsList {
                    //Place Availability Check
                    if let fromDate = fromDate{
                        if !databaseController.isPlaceAvailable(
                            placeId: placeDetail.placeId,
                            fromDate: fromDate,
                            toDate: toDate){
                            continue
                        }
                    }
                    
                    
                    //Place Acomodation Check
                    let guestsCount : Int = guestDetails.numberOfAdult + (guestDetails.numberOfInfant + guestDetails.numberOfChildren) * Int(0.5)
                    
                    if placeDetail.noOfRooms * placeDetail.noOfPeopleAccomodate < guestsCount{
                        continue
                    }
                    
                    //Place location check
                    if let locationDetail = locationDetail{
                        if placeDetail.location.country != locationDetail.country {
                            continue
                        }
                        
                        if let state = locationDetail.state,placeDetail.location.state != state{
                            continue
                        }
                        
                        if let city = locationDetail.city,placeDetail.location.city != city{
                            continue
                        }
                    }
                    
                    //Filtered Place
                    filteredPlaceList.append(placeDetail)
                }
                
            }
            
            self.navigationItem.title = "Search result"
            self.navigationItem.rightBarButtonItem = cancelSearchItem
            self.tableView.reloadData()
        }
        
        self.navigationController?.pushViewController(searchViewController, animated: true)
    }
    
    @objc private func cancelSearchButtonAction(){
        filteredPlaceList = placeDetailsList
        tableView.reloadData(with: .right)
        noSearchResultView.isHidden = true
        self.navigationItem.title = "Xplore"
        self.navigationItem.rightBarButtonItem = searchItem
    }
    
    
    
}

extension ExplorePageViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredPlaceList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: PlaceDetailCardView.reuseIdentifier, for: indexPath) as! PlaceDetailCardView
        cell.tag = indexPath.row
        configTabelCell(cell: &cell, row: indexPath.row)
        
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        cellOnTapAction(row: indexPath.row)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

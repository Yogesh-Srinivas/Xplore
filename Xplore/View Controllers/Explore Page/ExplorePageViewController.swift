import UIKit

class ExplorePageViewController: UITableViewController {
    
    let databaseController : PlaceDBController
    
    var placeDetailsList : [TravelPlaceDetail] = []
    
    var filteredPlaceList : [TravelPlaceDetail] = []
    
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
        
        self.databaseController = databaseController

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(PlaceDetailCardView.self, forCellReuseIdentifier: PlaceDetailCardView.reuseIdentifier)
        self.navigationItem.rightBarButtonItem = searchItem
        self.navigationItem.title = "Xplore"
        self.placeDetailsList = databaseController.getAllPlaceDetail()
        self.filteredPlaceList = placeDetailsList
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        updateWishListDetails()
        convertFilteredListToCurrentCurrency()
        tableView.reloadData()
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
        
        cell.addImages(imageUrls: filteredPlaceList[row].images)
        
        
        let priceAmount = "\(filteredPlaceList[row].price.currencyCode) \(filteredPlaceList[row].price.pricePerDay)"
        
        cell.priceLabelButton.titleLabel?.removeUnderline()
        cell.priceLabelButton.setTitle(priceAmount, for: .normal)
        cell.priceLabelButton.addTarget(self, action: #selector(priceButtonOnTapAction(_:)), for: .touchDown)
        cell.priceLabelButton.tag = row
        cell.priceLabelButton.titleLabel?.configSecondaryRegularStyle()
        cell.priceLabelButton.titleLabel?.underline()
        
        cell.titleCardView.text = filteredPlaceList[row].placeName
        cell.titleCardView.configSemiPrimary()
        
        cell.locationCardView.text = "\(filteredPlaceList[row].location.city), \(filteredPlaceList[row].location.state), \(filteredPlaceList[row].location.country)"
        cell.locationCardView.configTertiaryStyle()
        
        cell.ratingCard.text = filteredPlaceList[row].ratingDetail.count != 0 ? "\(Constants.RATING_STAR)\(Constants.BULLETING_POINT)\(filteredPlaceList[row].placeRating) (\(filteredPlaceList[row].ratingDetail.count))" : "\(Constants.RATING_STAR) new"
       
        
        
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
 
        let nav = UINavigationController(rootViewController: PricePresentationViewController(priceDetails: filteredPlaceList[sender.tag].price))
        nav.modalPresentationStyle = .formSheet
        nav.sheetPresentationController?.detents = [.custom(resolver: { _ in 200 })]
        present(nav, animated: true)
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
            
            filteredPlaceList = []
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
                
                
                //Place Acoomodation Check
                let guestsCount : Int = guestDetails.numberOfAdult + (guestDetails.numberOfInfant + guestDetails.numberOfChildren) * Int(0.5)
                
                if placeDetail.noOfRooms * placeDetail.noOfPeopleAccomodate < guestsCount{
                    continue
                }
                
                //Place location check
                if placeDetail.location.country != locationDetail?.country {
                    continue
                }
                
                if let state = locationDetail?.state,placeDetail.location.state != state{
                    continue
                }
                
                if let city = locationDetail?.city,placeDetail.location.city != city{
                    continue
                }
                
                //Filtered Place
                filteredPlaceList.append(placeDetail)
            }
            
            self.navigationItem.title = "Search result"
            self.navigationItem.rightBarButtonItem = cancelSearchItem
            self.tableView.reloadData()
        }
        self.navigationController?.pushViewController(searchViewController, animated: true)
    }
    
    @objc private func cancelSearchButtonAction(){
        filteredPlaceList = placeDetailsList
        tableView.reloadData()
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
        
        let wishListButtonClosure = { [unowned self] in
            
            
           
            self.filteredPlaceList[indexPath.row].isWishListed = self.filteredPlaceList[indexPath.row].isWishListed ? false : true
            
            if let indexOfPlaceList = placeDetailsList.firstIndex(where: {
                (placeDetail) in placeDetail == self.filteredPlaceList[indexPath.row] ? true : false}
            ){
                self.placeDetailsList[indexOfPlaceList].isWishListed = self.filteredPlaceList[indexPath.row].isWishListed
            }
        }
        
        let placeDetailedPageViewController =  UnreservedPlaceDetailsViewController(
            placeDetails: filteredPlaceList[indexPath.row],
            databaseController: databaseController,wishListButtonClosure : wishListButtonClosure)
                
        self.navigationController?.pushViewController(
           placeDetailedPageViewController,
                animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

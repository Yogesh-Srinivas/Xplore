import UIKit

class ExplorePageViewController: UITableViewController {
    
    let databaseController : PlaceDBController
    
    var placeDetailsList : [TravelPlaceDetail] = []
        
    init(databaseController : PlaceDBController){
        
        self.databaseController = databaseController
        self.placeDetailsList = databaseController.getAllPlaceDetail()

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(PlaceDetailCardView.self, forCellReuseIdentifier: PlaceDetailCardView.reuseIdentifier)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        
        self.placeDetailsList = databaseController.getAllPlaceDetail()
        
        self.tableView.reloadData()

    }
    
    private func configTabelCell(cell : inout PlaceDetailCardView,row : Int){
        
        cell.addImages(imageUrls: placeDetailsList[row].images)
        
        let priceAmount = "\(placeDetailsList[row].price.currencyCode) \(placeDetailsList[row].price.pricePerDay)"
        
        cell.priceLabelButton.setTitle(priceAmount, for: .normal)
        cell.priceLabelButton.setTitleColor(.label, for: .normal)
        cell.priceLabelButton.underline()
        cell.priceLabelButton.addTarget(self, action: #selector(priceButtonOnTapAction(_:)), for: .touchDown)
        cell.priceLabelButton.tag = row
        
        cell.titleCardView.text = placeDetailsList[row].placeName
        cell.titleCardView.configSecondaryStyle()
        
        cell.locationCardView.text = "\(placeDetailsList[row].location.city), \(placeDetailsList[row].location.state), \(placeDetailsList[row].location.country)"
        cell.locationCardView.configSecondaryStyle()
        
        cell.ratingCard.text = placeDetailsList[row].ratingDetail.count != 0 ? "\(Constants.RATING_STAR)\(Constants.BULLETING_POINT)\(placeDetailsList[row].placeRating) (\(placeDetailsList[row].ratingDetail.count))" : "\(Constants.RATING_STAR) new"
       
        
        
        cell.wishListButton.tag = row
        
        if placeDetailsList[row].isWishListed {
            
            cell.wishListButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            
            
            cell.wishListButton.removeTarget(self, action: #selector(wishListButtonOnTapActionAddToWishList(_:)), for: .touchUpInside)
            
            cell.wishListButton.addTarget(self, action: #selector(wishListButtonOnTapActionRemoveFromWishList(_:)), for: .touchUpInside)
                        
        }else{
            
            cell.wishListButton.setImage(UIImage(systemName: "heart"), for: .normal)
            
            
            cell.wishListButton.removeTarget(self, action: #selector(wishListButtonOnTapActionRemoveFromWishList(_:)), for: .touchUpInside)
            
            cell.wishListButton.addTarget(self, action: #selector(wishListButtonOnTapActionAddToWishList(_:)), for: .touchUpInside)
            
        }

    }
    
    @objc private func priceButtonOnTapAction(_ sender: UIButton){
 
        let nav = UINavigationController(rootViewController: PricePresentationViewController(priceDetails: placeDetailsList[sender.tag].price))
        nav.modalPresentationStyle = .formSheet
        nav.sheetPresentationController?.detents = [.custom(resolver: { _ in 200 })]
        present(nav, animated: true)
    }
    
    @objc private func wishListButtonOnTapActionAddToWishList(_ sender: UIButton){
        let placeId = placeDetailsList[sender.tag].placeId
        
        databaseController.addToWishList(placeId: placeId)
        
        sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        
        placeDetailsList[sender.tag].isWishListed = true
        
        
        sender.removeTarget(self, action: #selector(wishListButtonOnTapActionAddToWishList(_:)), for: .touchUpInside)
        
        sender.addTarget(self, action: #selector(wishListButtonOnTapActionRemoveFromWishList(_:)), for: .touchUpInside)
       
    }
    
    @objc func wishListButtonOnTapActionRemoveFromWishList(_ sender: UIButton){
        
        
        let placeId = placeDetailsList[sender.tag].placeId
        databaseController.removeFromWishList(placeId: placeId)
    
        sender.setImage(UIImage(systemName: "heart"), for: .normal)
        placeDetailsList[sender.tag].isWishListed = false
        
        
        sender.removeTarget(self, action: #selector(wishListButtonOnTapActionRemoveFromWishList(_:)), for: .touchUpInside)
        
        sender.addTarget(self, action: #selector(wishListButtonOnTapActionAddToWishList(_:)), for: .touchUpInside)
        
    }
    
}

extension ExplorePageViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        placeDetailsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: PlaceDetailCardView.reuseIdentifier, for: indexPath) as! PlaceDetailCardView
        configTabelCell(cell: &cell, row: indexPath.row)
        
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
            
            self.placeDetailsList[indexPath.row].isWishListed = self.placeDetailsList[indexPath.row].isWishListed ? false : true

        }
        
        let placeDetailedPageViewController =  UnreservedPlaceDetailsViewController(
            placeDetails: placeDetailsList[indexPath.row],
            databaseController: databaseController,wishListButtonClosure : wishListButtonClosure)
                
        self.navigationController?.pushViewController(
           placeDetailedPageViewController,
                animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

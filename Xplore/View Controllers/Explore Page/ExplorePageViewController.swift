import UIKit

final class ExplorePageViewController: UITableViewController {
    
    let databaseController : ExploreDBController
    
    var placeDetailsList : [TravelPlaceDetail] = []
        
    let imagesList : [[UIImage]] = [[
        UIImage(named: "test")!, UIImage(named: "test2")!, UIImage(named: "test2")!, UIImage(named: "test")!
        ],[
            UIImage(named: "test2")!, UIImage(named: "test2")!, UIImage(named: "test")!, UIImage(named: "test")!
            ]]
    
    let isWishListedPage : Bool
    
    init(databaseController : ExploreDBController,isWishListPage : Bool){
        
        self.databaseController = databaseController
        self.isWishListedPage = isWishListPage
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
        
        if self.isWishListedPage{
            self.placeDetailsList.removeAll{
                placeDetail in !placeDetail.isWishListed
            }
        }
        
        self.tableView.reloadData()

    }
    
    private func configTabelCell(cell : inout PlaceDetailCardView,row : Int){
        cell.addImages(imagesList: imagesList[row])
        
        let priceAmount = "\(placeDetailsList[row].price.currencyCode) \(placeDetailsList[row].price.pricePerDay)"
        
        cell.priceLabelButton.setTitle(priceAmount, for: .normal)
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
        
        self.modalPresentationStyle = .fullScreen
        let priceVC = PricePresentationViewController(priceDetails: placeDetailsList[sender.tag].price)
        self.present(priceVC, animated: true)
    }
    
    @objc private func wishListButtonOnTapActionAddToWishList(_ sender: UIButton){
        let placeId = placeDetailsList[sender.tag].placeId
        
        databaseController.addToWishList(placeId: placeId)
        
        sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        
        placeDetailsList[sender.tag].isWishListed = true
        
        
        sender.removeTarget(self, action: #selector(wishListButtonOnTapActionAddToWishList(_:)), for: .touchUpInside)
        
        sender.addTarget(self, action: #selector(wishListButtonOnTapActionRemoveFromWishList(_:)), for: .touchUpInside)
       
    }
    
    @objc private func wishListButtonOnTapActionRemoveFromWishList(_ sender: UIButton){
        
        
        let placeId = placeDetailsList[sender.tag].placeId
        databaseController.removeFromWishList(placeId: placeId)
        
        if isWishListedPage{
            placeDetailsList.remove(at: sender.tag)
            tableView.deleteRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
            return
        }
    
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
        
        self.navigationController?.pushViewController(
            PlaceDetailedPageViewController(
                imageList: imagesList[indexPath.row],
                placeDetails: placeDetailsList[indexPath.row],
                databaseController: databaseController,wishListButtonClosure : wishListButtonClosure),
                animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
}

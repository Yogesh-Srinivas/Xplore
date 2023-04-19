
import UIKit

class WishListViewController: UITableViewController {
    
    let databaseController : PlaceDBController
    var wishListDetails : [TravelPlaceDetail] = []
    var wishListImagesList : [UIImageView] = []

    init(databaseController : PlaceDBController){
        
        self.databaseController = databaseController

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "WishListTableCell")
        self.navigationItem.title = "Your WishList"
    }
    
    func loadWishlist(){
        wishListDetails = []
        let placeDetails = databaseController.getAllPlaceDetail()
        for placeDetail in placeDetails {
            if placeDetail.isWishListed{
                wishListDetails.append(placeDetail)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        loadWishlist()
        wishListDetails = convertListToCurrentCurrency(travelPlaceList: wishListDetails)
        tableView.reloadData()
    }
    
    private func convertListToCurrentCurrency(travelPlaceList : [TravelPlaceDetail]) -> [TravelPlaceDetail]{
        var convertedList : [TravelPlaceDetail] = []
        
        for placeDetail in travelPlaceList {
            var placeDetail = placeDetail
            let currentCurrencyCode =  GeneralUtils.getCurrentCurrency()
            placeDetail.price.pricePerDay = GeneralUtils.convertCurrency(
                of: placeDetail.price.pricePerDay,
                from: placeDetail.price.currencyCode,
                to: currentCurrencyCode)
            placeDetail.price.currencyCode = currentCurrencyCode
            convertedList.append(placeDetail)
        }
        return convertedList
    }
    
    private func configTabelCell(cell : inout UITableViewCell,row : Int){
        
        
        var contentConfig = UIListContentConfiguration.valueCell()
        contentConfig.text = wishListDetails[row].placeName
        contentConfig.textProperties.configSemiPrimary()
        contentConfig.textProperties.numberOfLines = 4
        contentConfig.textToSecondaryTextVerticalPadding = 3
        
        contentConfig.secondaryText = "\(wishListDetails[row].location.city), \(wishListDetails[row].location.state), \(wishListDetails[row].location.country),"

        contentConfig.secondaryTextProperties.configSecondaryFadedStyle()
        
        wishListImagesList.append(UIImageView(image: UIImage(named: "loadingImage")))
        
        DispatchQueue.global(qos: .userInteractive).async{
            [weak self,row,cell] in
                
            if let weakSelf = self{
                if let data = weakSelf.databaseController.getImageData(for: (weakSelf.wishListDetails[row].images[0])){
                    
                    DispatchQueue.main.async {
                        weakSelf.wishListImagesList[row].image = UIImage(data: data)
                        var contentConfig = cell.contentConfiguration as! UIListContentConfiguration
                        contentConfig.image = weakSelf.wishListImagesList[row].image
                        weakSelf.tableView.reloadData()
                    }
                }
            }
            
        }
        
        contentConfig.image = wishListImagesList[row].image
        contentConfig.imageProperties.reservedLayoutSize = CGSize(width: 100, height: 100)
        contentConfig.imageProperties.maximumSize = CGSize(width: 125, height: 100)
        contentConfig.imageToTextPadding = 20
        contentConfig.imageProperties.cornerRadius = 15
      
        cell.contentConfiguration = contentConfig
        
        
        
        let wishListView = UIImageView(image: UIImage(systemName: "heart.fill"))
        cell.accessoryView = wishListView
        cell.accessoryView?.tintColor = .systemPink
        
        let wishButtonGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(wishListButtonAction(_:)))
        cell.accessoryView?.tag = row
        cell.accessoryView?.addGestureRecognizer(wishButtonGestureRecognizer)
        cell.accessoryView?.isUserInteractionEnabled = true
    }
    
    @objc private func wishListButtonAction(_ gestureRecognizer: UITapGestureRecognizer){
        if let row = gestureRecognizer.view?.tag{
            
            let placeId = wishListDetails[row].placeId
            
            databaseController.removeFromWishList(placeId: placeId)
            
            wishListDetails.remove(at: row)
            tableView.deleteRows(at: [IndexPath(row: row, section: 0)], with: .fade)
            tableView.reloadData()
        }
    }
}


extension WishListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        wishListDetails.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "WishListTableCell", for: indexPath)
        
        configTabelCell(cell: &cell, row: indexPath.row)
        cell.selectionStyle = .none
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let wishListButtonClosure = { [unowned self] in
           
            self.wishListDetails[indexPath.row].isWishListed = self.wishListDetails[indexPath.row].isWishListed ? false : true
            
            if let indexOfPlaceList = wishListDetails.firstIndex(where: {
                (placeDetail) in placeDetail == self.wishListDetails[indexPath.row] ? true : false}
            ){
                self.wishListDetails[indexOfPlaceList].isWishListed = self.wishListDetails[indexPath.row].isWishListed
            }
        }
        
        let placeDetailedPageViewController =  UnreservedPlaceDetailsViewController(
            placeDetails: wishListDetails[indexPath.row],
            databaseController: databaseController,wishListButtonClosure : wishListButtonClosure)
                
        self.navigationController?.pushViewController(
           placeDetailedPageViewController,
                animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

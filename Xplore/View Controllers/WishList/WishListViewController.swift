
import UIKit

class WishListViewController: UITableViewController {
    
    let databaseController : PlaceDBController
    var wishListDetails : [TravelPlaceDetail] = []
    
    lazy var emptyWishListView = {
        let emptyDetailView = EmptyDetailView(
                    frame: .zero,
                    image: UIImage(named: "noWishlist"),
                    message: "It appears that you haven't created a wishlist yet!")
        return emptyDetailView
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
        
        self.tableView.register(PlaceListCustomCell.self, forCellReuseIdentifier: "WishListTableCell")
        self.tableView.separatorStyle = .none
        
        self.navigationItem.title = "Your WishList"
        
        view.addSubview(emptyWishListView)
        
        setupEmptyWishlistView()
    }
    
    private func setupEmptyWishlistView(){
        emptyWishListView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emptyWishListView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            emptyWishListView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            emptyWishListView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            emptyWishListView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
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
    
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.tabBar.backgroundColor = .systemBackground
    }
    override func viewWillAppear(_ animated: Bool) {
        loadWishlist()
        wishListDetails = convertListToCurrentCurrency(travelPlaceList: wishListDetails)
        tableView.reloadData()
        
        if wishListDetails.count > 0{
            emptyWishListView.isHidden = true
        }else{
            emptyWishListView.isHidden = false
        }
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
    
    private func configTabelCell(cell : inout PlaceListCustomCell,row : Int){
        
        cell.primaryLabel.text = wishListDetails[row].placeName
        cell.secondaryLabel.text = "\(wishListDetails[row].location.city), \(wishListDetails[row].location.state), \(wishListDetails[row].location.country)"
        
        var placeImage = UIImage(named: "loadingImage")
        
        if let imageDate = databaseController.getImageData(for: wishListDetails[row].images[0]){
            placeImage = UIImage(data: imageDate)
        }
        
        cell.headerImage.image = placeImage
        

        let wishListView = UIImageView(image: UIImage(systemName: "heart.fill"))
        cell.accessoryView = wishListView
        cell.accessoryView?.tintColor = .systemPink
        
        
        let wishButtonGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(wishListButtonAction(_:)))
        cell.accessoryView?.tag = row
        cell.accessoryView?.addGestureRecognizer(wishButtonGestureRecognizer)
        cell.accessoryView?.isUserInteractionEnabled = true
    }
    
    @objc private func wishListButtonAction(_ gestureRecognizer: UITapGestureRecognizer){
        
        for visibleCell in tableView.visibleCells{
            if visibleCell.accessoryView == gestureRecognizer.view{
                if let rowIndex = tableView.indexPath(for: visibleCell)?.row{
                    let placeId = wishListDetails[rowIndex].placeId
                    
                    databaseController.removeFromWishList(placeId: placeId)
                    
                    wishListDetails.remove(at: rowIndex)
                    tableView.deleteRows(at: [IndexPath(row: rowIndex, section: 0)], with: .fade)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){ [unowned self] in
                        if self.wishListDetails.count > 0{
                            emptyWishListView.isHidden = true
                        }else{
                            emptyWishListView.isHidden = false
                        }
                    }
                }
                break
            }
        }
        
    }
}


extension WishListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        wishListDetails.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "WishListTableCell", for: indexPath) as! PlaceListCustomCell
        
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    


}

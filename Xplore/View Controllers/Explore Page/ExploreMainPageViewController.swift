import UIKit

final class ExploreMainPageViewController: UITableViewController {
    
    let databaseContoller = DatabaseController()
    
    var placeDetailsList : [TravelPlaceDetail] = []
    
    let imagesList : [[UIImage]] = [[
        UIImage(named: "test")!, UIImage(named: "test2")!, UIImage(named: "test2")!, UIImage(named: "test")!
        ],[
            UIImage(named: "test2")!, UIImage(named: "test2")!, UIImage(named: "test")!, UIImage(named: "test")!
            ]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.placeDetailsList = databaseContoller.getAllPlaceDetail()
        
        self.tableView.register(PlaceDetailCardView.self, forCellReuseIdentifier: PlaceDetailCardView.reuseIdentifier)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func configTabelCell(cell : inout PlaceDetailCardView,row : Int){
        cell.addImages(imagesList: imagesList[row])
        
        let priceAmount = "\(placeDetailsList[row].price.currencyCode) \(placeDetailsList[row].price.pricePerDay)"
        
        cell.priceLabelButton.setTitle(priceAmount, for: .normal)
        cell.priceLabelButton.underline()
        cell.priceLabelButton.addTarget(self, action: #selector(priceButtonOnTapAction), for: .touchDown)
        
        cell.titleCardView.text = placeDetailsList[row].placeName
        cell.titleCardView.configSecondaryStyle()
        
        cell.locationCardView.text = "\(placeDetailsList[row].location.city), \(placeDetailsList[row].location.state), \(placeDetailsList[row].location.country)"
        cell.locationCardView.configSecondaryStyle()
        
        cell.ratingCard.text = "\(Constants.RATING_STAR)\(Constants.BULLETING_POINT)\(placeDetailsList[row].placeRating) (\(placeDetailsList[row].ratingDetail.count))"
       
        
        cell.wishListButton.addTarget(self, action: #selector(wishListButtonOnTapAction), for: .touchUpInside)
        cell.wishListButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)

    }
    
    @objc private func priceButtonOnTapAction(){
        print("Price btn")
    }
    
    @objc private func wishListButtonOnTapAction(){
        print("wishlsit btn")
    }
}

extension ExploreMainPageViewController {
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
        
        self.navigationController?.pushViewController(PlaceDetailedPageViewController(imageList: imagesList[indexPath.row]), animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
}

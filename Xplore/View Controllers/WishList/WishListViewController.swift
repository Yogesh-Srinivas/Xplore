import UIKit

final class WishListViewController: ExplorePageViewController {

    
    override init(databaseController : PlaceDBController){        
        super.init(databaseController: databaseController)
        
        super.placeDetailsList.removeAll{
            placeDetail in !placeDetail.isWishListed
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(true)

        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Your WishList"
        self.navigationItem.rightBarButtonItem = nil
        
        super.placeDetailsList.removeAll{
            placeDetail in !placeDetail.isWishListed
        }
        tableView.reloadData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func wishListButtonOnTapActionRemoveFromWishList(_ sender: UIButton) {
        let placeId = placeDetailsList[sender.tag].placeId
        databaseController.removeFromWishList(placeId: placeId)
        
        
        placeDetailsList.remove(at: sender.tag)
        tableView.deleteRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        tableView.reloadData()
        
    }
    

}

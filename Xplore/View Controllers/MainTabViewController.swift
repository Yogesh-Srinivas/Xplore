import UIKit

class MainTabBarController: UITabBarController {
    lazy var exploreViewController = {
        
        let placeDBController : PlaceDBController = DatabaseController.shared
        
        let viewController =  ExplorePageViewController(databaseController: placeDBController)
        
        viewController.tabBarItem = UITabBarItem(
            title: "Explore",
            image: UIImage(systemName: "house"),
            tag: 1)
        return viewController
    }()
    
    lazy var wishListViewController = {
        let placeDBController : PlaceDBController = DatabaseController.shared
        
        let viewController =  WishListViewController(databaseController: placeDBController)
        
        viewController.tabBarItem = UITabBarItem(
            title: "WishList",
            image: UIImage(systemName: "heart"),
            tag: 2
        )
        return viewController
    }()
    
    lazy var myTripViewController = {
        let placeDBController : PlaceDBController = DatabaseController.shared
        
        let viewController =  MyTripViewController(databaseController: placeDBController)
        viewController.tabBarItem = UITabBarItem(
            title: "My Trip",
            image: UIImage(systemName: "briefcase"),
            tag: 3
        )
        return viewController
    }()
    
    lazy var profileViewController = {
        
        let placeDBController : PlaceDBController = DatabaseController.shared
        
        let sessionDBController : SessionDBController = DatabaseController.shared
        
        let viewController = ProfileViewController(placeDBController: placeDBController, sessionDBController: sessionDBController)
        
        viewController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person"),
            tag: 4
        )
        
        return viewController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.viewControllers = [
            UINavigationController(rootViewController: exploreViewController) ,
            UINavigationController(rootViewController: wishListViewController),
            UINavigationController(rootViewController: myTripViewController),
            UINavigationController(rootViewController: profileViewController),
        
        ]
        
        self.tabBar.tintColor = .systemPink
        
        self.tabBar.layer.shadowColor = UIColor.tertiaryLabel.cgColor
        self.tabBar.layer.shadowRadius = 1
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -1)
        self.tabBar.layer.masksToBounds = false
        self.tabBar.layer.shadowOpacity = 1
        
//        self.tabBar.addSubview(UIUtils.getSeparator(size: 1))

        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}

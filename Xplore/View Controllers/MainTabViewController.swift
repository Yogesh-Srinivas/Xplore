import UIKit

class MainTabBarController: UITabBarController {
    lazy var exploreViewController = {
        
        let placeDBController = DBFactory.getPlaceDatabaseController()
        
        let viewController =  ExplorePageViewController(databaseController: placeDBController)
        
        viewController.tabBarItem = UITabBarItem(
            title: "Explore",
            image: UIImage(systemName: "house"),
            tag: 1)
        return viewController
    }()
    
    lazy var wishListViewController = {
        let placeDBController = DBFactory.getPlaceDatabaseController()
        
        let viewController =  WishListViewController(databaseController: placeDBController)
        
        viewController.tabBarItem = UITabBarItem(
            title: "WishList",
            image: UIImage(systemName: "heart"),
            tag: 2
        )
        return viewController
    }()
    
    lazy var myTripViewController = {
        let placeDBController = DBFactory.getPlaceDatabaseController()
        
        let viewController =  MyTripViewController(databaseController: placeDBController)
        viewController.tabBarItem = UITabBarItem(
            title: "My Trip",
            image: UIImage(systemName: "briefcase"),
            tag: 3
        )
        return viewController
    }()
    
    lazy var profileViewController = {
        let viewController = ProfileViewController()
        
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
            
            profileViewController]
        
        self.tabBar.tintColor = .systemPink
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}

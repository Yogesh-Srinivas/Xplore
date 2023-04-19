import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow()
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        
        
//        let mainTabBarController = MainTabBarController()
//        mainTabBarController.selectedIndex = 3
        
//        window?.rootViewController = mainTabBarController
        window?.rootViewController = UINavigationController(rootViewController: LoginViewController())
        
    }

}


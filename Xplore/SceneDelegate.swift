import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow()
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        
        let userDefault = UserDefaults.standard
        if !userDefault.bool(forKey: "hasAppOpenedBefore"){
            
            userDefault.set(true, forKey: "hasAppOpenedBefore")
            window?.rootViewController = UINavigationController(rootViewController: LoginViewController())
            
        }else{
            if userDefault.string(forKey: "userId") != nil{
                
                let navigationController = UINavigationController()
                navigationController.navigationBar.isHidden = true

                navigationController.setViewControllers([LodingViewController()], animated: true)
                self.window?.rootViewController = navigationController
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    navigationController.setViewControllers([MainTabBarController()], animated: true)
                    self.window?.rootViewController = navigationController
                }

               
            }else{
                window?.rootViewController = UINavigationController(rootViewController: LoginViewController())
            }
        }
        
    }

}


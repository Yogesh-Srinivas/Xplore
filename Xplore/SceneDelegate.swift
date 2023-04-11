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
            
            // procedures when app first launches
            userDefault.set(false, forKey: "isDarkTheme")
            window?.overrideUserInterfaceStyle = .light
        }
        
        
        let mainTabBarController = MainTabBarController()
        mainTabBarController.selectedIndex = 2
        
        window?.rootViewController = mainTabBarController
//        window?.rootViewController = UINavigationController(rootViewController: getLoginScreen())
        
    }
    
    private func getLoginScreen() -> LoginTemplateViewController{
        
        let loginViewController = LoginTemplateViewController()

        loginViewController.titleLabel.text = "Login"
        
        let emailField = CustomLoginTextField(frame: .zero)
        emailField.placeholder = "Email"
        emailField.iconImageView.image = UIImage(systemName: "envelope.open")
        loginViewController.addFieldView(fieldView: emailField)
        
        let passwordField = CustomPasswordTextField(frame:.zero)
        passwordField.placeholder = "Password"
        passwordField.iconImageView.image = UIImage(systemName: "lock")
        loginViewController.addFieldView(fieldView: passwordField)
        
        loginViewController.pageButton.setTitle("Login", for: .normal)
        loginViewController.setPageButtonAction {
            loginViewController.navigationController?.navigationBar.isHidden = true
            loginViewController.navigationController?.setViewControllers([MainTabBarController()], animated: true)
        }

        let forgotPasswordButton = UIButton()
       
        forgotPasswordButton.setTitleColor(.label, for: .normal)
        forgotPasswordButton.titleLabel?.configSecondaryRegularStyle()
        forgotPasswordButton.underline()
        
        forgotPasswordButton.setTitle("Forgot Password?", for: .normal)
        forgotPasswordButton.underline()
        
        loginViewController.addFieldView(fieldView: forgotPasswordButton)
        
        loginViewController.linkLabel.leadingLabel.text = "New to Xplore?"
        loginViewController.linkLabel.trailingButton.setTitle("Sign Up", for: .normal)
        
        loginViewController.linkLabel.trailingButton.underline()
        
        loginViewController.setLinkButtonAction {[weak self] in
            if let signupVc = self?.getSignUpScreen(){
                loginViewController.navigationController?.navigationBar.isHidden = true
                loginViewController.navigationController?.pushViewController(signupVc, animated: true)
            }
        }
        
        return loginViewController

    }
    
    private func getSignUpScreen() -> LoginTemplateViewController{
        
        let signupViewController = LoginTemplateViewController()

        signupViewController.titleLabel.text = "Sign Up"
        
        
        let nameField = CustomLoginTextField(frame: .zero)
        nameField.placeholder = "Name"
        nameField.iconImageView.image = UIImage(systemName: "person")
        signupViewController.addFieldView(fieldView: nameField)
        
        let mobileField = CustomLoginTextField(frame: .zero)
        mobileField.placeholder = "Phone Number"
        mobileField.iconImageView.image = UIImage(systemName: "phone")
        signupViewController.addFieldView(fieldView: mobileField)
        
        
        let emailField = CustomLoginTextField(frame: .zero)
        emailField.placeholder = "Email"
        emailField.iconImageView.image = UIImage(systemName: "envelope.open")
        signupViewController.addFieldView(fieldView: emailField)
        
        let passwordField = CustomPasswordTextField(frame:.zero)
        passwordField.placeholder = "Password"
        passwordField.iconImageView.image = UIImage(systemName: "lock")
        signupViewController.addFieldView(fieldView: passwordField)
        
        
        let confirmPasswordField = CustomPasswordTextField(frame:.zero)
        confirmPasswordField.placeholder = "confirm Password"
        confirmPasswordField.iconImageView.image = UIImage(systemName: "lock")
        signupViewController.addFieldView(fieldView: confirmPasswordField)
        
        
        
        
        signupViewController.pageButton.setTitle("Sign Up", for: .normal)
        signupViewController.setPageButtonAction {
            signupViewController.navigationController?.navigationBar.isHidden = true
            signupViewController.navigationController?.setViewControllers([MainTabBarController()], animated: true)
        }
        
        signupViewController.linkLabel.leadingLabel.text = "Already have account?"
        signupViewController.linkLabel.trailingButton.setTitle("Log In", for: .normal)
        signupViewController.linkLabel.trailingButton.underline()
        
        signupViewController.setLinkButtonAction {[weak self] in
            if let loginVc = self?.getLoginScreen(){

                signupViewController.navigationController?.popViewController(animated: true)
            }
        }
        
        return signupViewController

    }


}


import UIKit

class LoginViewController: LoginTemplateViewController {
    
    lazy var emailField = {
        let emailField = CustomLoginFieldView(frame: .zero)
        emailField.textField.placeholder = "Email"
        emailField.textField.iconImageView.image = UIImage(systemName: "envelope.open")
        return emailField
    }()
    
    lazy var passwordField = {
        let passwordField = CustomPasswordFieldView(frame:.zero)
        passwordField.passwordTextField.placeholder = "Password"
        passwordField.passwordTextField.iconImageView.image = UIImage(systemName: "lock")
        return passwordField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addFieldView(fieldView: emailField)
        self.addFieldView(fieldView: passwordField)
        setupView()
        //For test
        emailField.textField.text = "yogi@gmail.com"
        passwordField.passwordTextField.text = "123"
        
    }
    
    private func setupView(){
        
        self.titleLabel.text = "Login"
        
        self.pageButton.setTitle("Login", for: .normal)
        self.setPageButtonAction { [unowned self] in
            
            if !emailField.textField.validateText(for: .Email){
                self.emailField.showErrorMessage(message: "Invalid Email address")
                self.emailField.emptyTextField()
                return
            }
            
            if self.authenticateLogin(){
                self.navigationController?.navigationBar.isHidden = true
                self.navigationController?.setViewControllers([MainTabBarController()], animated: true)
            }else{
                self.emailField.emptyTextField()
                self.passwordField.emptyTextField()
                self.passwordField.showErrorMessage(message: "Email/Password Mismatch")
            }
        }
       
        
        self.linkLabel.leadingLabel.text = "New to Xplore?"
        self.linkLabel.trailingButton.setTitle("Sign Up", for: .normal)
        
        self.linkLabel.trailingButton.underline()
        
        self.setLinkButtonAction {
            self.navigationController?.navigationBar.isHidden = true
            self.navigationController?.pushViewController(SignUpViewController(), animated: true)
        }
        
    }
    
    
    private func authenticateLogin() -> Bool{
        
        if let email = emailField.textField.text,let password = passwordField.passwordTextField.text{
            
            let loginResponse = Authenticator.authenticateLogin(email:email , password: password)
            switch loginResponse{
            case .AuthSuccess:
                return true
            case .EmailPasswordMismatch:
                return false
            }
            
        }
        
        return false
    }

}


extension LoginViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}

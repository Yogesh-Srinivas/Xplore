import UIKit

class LoginViewController: LoginTemplateViewController {
    
    lazy var emailField = {
        let emailField = CustomLoginFieldView(frame: .zero)
        emailField.textField.placeholder = "Email"
        emailField.textField.iconImageView.image = UIImage(systemName: "envelope.open")
        emailField.textField.keyboardType = .emailAddress
        emailField.textField.returnKeyType = .next
        emailField.textField.delegate = self
        return emailField
    }()
    
    lazy var passwordField = {
        let passwordField = CustomPasswordFieldView(frame:.zero)
        passwordField.passwordTextField.placeholder = "Password"
        passwordField.passwordTextField.iconImageView.image = UIImage(systemName: "lock")
        passwordField.passwordTextField.returnKeyType = .done
        passwordField.passwordTextField.delegate = self
        return passwordField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addFieldView(fieldView: emailField)
        self.addFieldView(fieldView: passwordField)
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        emailField.textField.resignFirstResponder()
        passwordField.passwordTextField.resignFirstResponder()
    }
    
    private func setupView(){
        
        self.titleLabel.text = "Login"
        
        self.pageButton.setTitle("Login", for: .normal)
        
        self.setPageButtonAction { [unowned self] in
            
            if !emailField.textField.validateText(for: .Email){
                self.emailField.showErrorMessage(message: "Invalid Email address")
                return
            }
            
            if self.authenticateLogin(){
                self.pageButton.setTitle("Logging in...", for: .normal)
                
                let loadingVC = LodingViewController()
                self.navigationController?.navigationBar.isHidden = true
                self.navigationController?.setViewControllers([loadingVC], animated: false)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){[loadingVC] in
                    loadingVC.navigationController?.navigationBar.isHidden = true
                    loadingVC.navigationController?.setViewControllers([MainTabBarController()], animated: true)
                }
               
            }else{
                self.passwordField.showErrorMessage(message: "Email/Password Mismatch")
            }
        }
       
        
        self.linkLabel.leadingLabel.text = "New to Xplore?"
        self.linkLabel.trailingButton.setTitle("Sign Up", for: .normal)
        
        self.linkLabel.trailingButton.titleLabel?.textColor = .link
        self.linkLabel.trailingButton.titleLabel?.underline()
        
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
        if textField == emailField.textField{
            passwordField.passwordTextField.becomeFirstResponder()
        }else{
            passwordField.passwordTextField.resignFirstResponder()
            pageButtonOnClickAction()
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == emailField.textField{
            emailField.hideErrorMessage()
        }else{
            passwordField.hideErrorMessage()
        }
    }
}

import UIKit

class SignUpViewController: LoginTemplateViewController {
    
    lazy var nameField = {
        let nameField = CustomLoginFieldView(frame: .zero)
        nameField.textField.placeholder = "Name"
        nameField.textField.iconImageView.image = UIImage(systemName: "person")
        return nameField
    }()
    
    lazy var emailField = {
        let emailField = CustomLoginFieldView(frame: .zero)
        emailField.textField.placeholder = "Email"
        emailField.textField.iconImageView.image = UIImage(systemName: "envelope.open")
        return emailField
    }()
    
    lazy var mobileField = {
        let mobileField = CustomLoginFieldView(frame: .zero)
        mobileField.textField.placeholder = "Phone Number"
        mobileField.textField.iconImageView.image = UIImage(systemName: "phone")
        return mobileField
    }()
    
    lazy var passwordField = {
        let passwordField = CustomPasswordFieldView(frame:.zero)
        passwordField.passwordTextField.placeholder = "Password"
        passwordField.passwordTextField.iconImageView.image = UIImage(systemName: "lock")
        return passwordField
    }()
    
    lazy var confirmPasswordField = {
        let confirmPasswordField = CustomPasswordFieldView(frame:.zero)
        confirmPasswordField.passwordTextField.placeholder = "confirm Password"
        confirmPasswordField.passwordTextField.iconImageView.image = UIImage(systemName: "lock")
        return confirmPasswordField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addFieldView(fieldView: nameField)
        self.addFieldView(fieldView: mobileField)
        self.addFieldView(fieldView: emailField)
        self.addFieldView(fieldView: passwordField)
        self.addFieldView(fieldView: confirmPasswordField)

        setupView()
    }
    

    private func setupView(){
        

        self.titleLabel.text = "Sign Up"
        
        self.pageButton.setTitle("Sign Up", for: .normal)
        
        
        self.setPageButtonAction { [unowned self] in
            
            if !nameField.textField.validateText(for: .Name){
                nameField.emptyTextField()
                nameField.showErrorMessage(message: "Provide Proper Name eg. FirstName MiddleName(optional) LastName(optional)")
                
            }else if !mobileField.textField.validateText(for: .Mobile){
                mobileField.emptyTextField()
                mobileField.showErrorMessage(message: "Provide Proper mobile number")
                
            }else if !emailField.textField.validateText(for: .Email){
                emailField.emptyTextField()
                emailField.showErrorMessage(message: "Provide Proper email")
                
            }else if !passwordField.passwordTextField.validateText(for: .Password){
                passwordField.emptyTextField()
                passwordField.showErrorMessage(message: "Password should contain atleast an upperCase,a lowerCase and a number.No spaces or special charactes allowed.")
                
            }else if !confirmPasswordField.passwordTextField.validateText(for: .Password){
                confirmPasswordField.emptyTextField()
                confirmPasswordField.showErrorMessage(message: "Password should contain atleast an upperCase,a lowerCase and a number.No spaces or special charactes allowed.")
                
            }else if confirmPasswordField.passwordTextField.text != passwordField.passwordTextField.text{
                confirmPasswordField.emptyTextField()
                confirmPasswordField.showErrorMessage(message: "Passwords do not match")
                
            }else if let email = emailField.textField.text,
                     let userName = nameField.textField.text,
                     let mobile = mobileField.textField.text,
                     let password = passwordField.passwordTextField.text{
                if Authenticator.isEmailExist(email: email ){
                    emailField.emptyTextField()
                    emailField.showErrorMessage(message: "Email already exists")
                }else{
                    Authenticator.signUp(
                        userName: userName,
                        email: email,
                        mobile: mobile,
                        password: password )
                    self.navigationController?.navigationBar.isHidden = true
                    self.navigationController?.setViewControllers([MainTabBarController()], animated: true)
                }
            }
           
        }
        
        self.linkLabel.leadingLabel.text = "Already have account?"
        self.linkLabel.trailingButton.setTitle("Log In", for: .normal)
        self.linkLabel.trailingButton.underline()
        
        self.setLinkButtonAction {
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
}

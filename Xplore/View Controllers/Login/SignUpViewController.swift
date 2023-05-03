import UIKit

class SignUpViewController: LoginTemplateViewController {
    
    lazy var nameField = {
        let nameField = CustomLoginFieldView(frame: .zero)
        nameField.textField.placeholder = "Name"
        nameField.textField.iconImageView.image = UIImage(systemName: "person")
        nameField.textField.returnKeyType = .next
        nameField.textField.delegate = self
        return nameField
    }()
    
    lazy var emailField = {
        let emailField = CustomLoginFieldView(frame: .zero)
        emailField.textField.placeholder = "Email"
        emailField.textField.iconImageView.image = UIImage(systemName: "envelope.open")
        emailField.textField.keyboardType = .emailAddress
        emailField.textField.returnKeyType = .next
        emailField.textField.delegate = self
        return emailField
    }()
    
    lazy var mobileField = {
        let mobileField = CustomLoginFieldView(frame: .zero)
        mobileField.textField.placeholder = "Phone Number - 10 digits"
        mobileField.textField.iconImageView.image = UIImage(systemName: "phone")
        mobileField.textField.keyboardType = .numberPad
        mobileField.textField.delegate = self
        return mobileField
    }()
    
    lazy var passwordField = {
        let passwordField = CustomPasswordFieldView(frame:.zero)
        passwordField.passwordTextField.placeholder = "Password"
        passwordField.passwordTextField.iconImageView.image = UIImage(systemName: "lock")
        passwordField.passwordTextField.returnKeyType = .next
        passwordField.passwordTextField.delegate = self
        passwordField.passwordTextField.textContentType = .oneTimeCode
        return passwordField
    }()
    
    lazy var confirmPasswordField = {
        let confirmPasswordField = CustomPasswordFieldView(frame:.zero)
        confirmPasswordField.passwordTextField.placeholder = "confirm Password"
        confirmPasswordField.passwordTextField.iconImageView.image = UIImage(systemName: "lock")
        confirmPasswordField.passwordTextField.returnKeyType = .done
        confirmPasswordField.passwordTextField.delegate = self
        confirmPasswordField.passwordTextField.textContentType = .oneTimeCode

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
                nameField.showErrorMessage(message: "Provide Proper Name eg. FirstName MiddleName(optional) LastName(optional)")
                
            }else if !mobileField.textField.validateText(for: .Mobile){
                mobileField.showErrorMessage(message: "Provide Proper mobile number")
                
            }else if let email = emailField.textField.text, email.count < 2 || email.count > 64{
                    emailField.showErrorMessage(message: "length should be between 2-64.")
                
            }else if !emailField.textField.validateText(for: .Email){
                emailField.showErrorMessage(message: "Provide Proper email")
            }else if let password = passwordField.passwordTextField.text, password.count < 6 || password.count > 16{
                    passwordField.showErrorMessage(message: "length should be between 6-16.")
            }else if !passwordField.passwordTextField.validateText(for: .Password){
                passwordField.showErrorMessage(message: "Password should contain atleast an upperCase,a lowerCase and a number.No spaces or special charactes allowed.")
                
            }else if confirmPasswordField.passwordTextField.text != passwordField.passwordTextField.text{
                confirmPasswordField.showErrorMessage(message: "Passwords do not match")
                
            }else if let email = emailField.textField.text,
                     let userName = nameField.textField.text,
                     let mobile = mobileField.textField.text,
                     let password = passwordField.passwordTextField.text{
                if Authenticator.isEmailExist(email: email ){
                    emailField.showErrorMessage(message: "Email already exists")
                    
                }else{
                    Authenticator.signUp(
                        userName: userName,
                        email: email,
                        mobile: mobile,
                        password: password )
                    
                    let loadingVC = LodingViewController()
                    self.navigationController?.navigationBar.isHidden = true
                    self.navigationController?.setViewControllers([loadingVC], animated: false)
                    
                    //Haptic Feedback
                    let notification = UINotificationFeedbackGenerator()
                    notification.notificationOccurred(.success)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1){[loadingVC] in
                        loadingVC.navigationController?.navigationBar.isHidden = true
                        loadingVC.navigationController?.setViewControllers([MainTabBarController()], animated: true)
                    }
                    
                }
            }
           
        }
        
        self.linkLabel.leadingLabel.text = "Already have account?"
        self.linkLabel.trailingButton.setTitle("Log In", for: .normal)
        self.linkLabel.trailingButton.titleLabel?.textColor = .link
        self.linkLabel.trailingButton.titleLabel?.underline()
        
        self.setLinkButtonAction {
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    
    
}

extension SignUpViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let offsetBalance = pageButton.frame.height + linkLabel.frame.height
        
        if textField == nameField.textField{
            mobileField.textField.becomeFirstResponder()
            contentView.contentOffset = CGPoint(x: 0, y: mobileField.frame.origin.y - offsetBalance)

        }else if textField == emailField.textField{
            passwordField.passwordTextField.becomeFirstResponder()
            contentView.contentOffset = CGPoint(x: 0, y: passwordField.frame.origin.y - offsetBalance)
        }else if textField == passwordField.passwordTextField{
            confirmPasswordField.passwordTextField.becomeFirstResponder()
            contentView.contentOffset = CGPoint(x: 0, y: confirmPasswordField.frame.origin.y - offsetBalance)
        }else if textField == confirmPasswordField.passwordTextField{
            confirmPasswordField.passwordTextField.resignFirstResponder()
            pageButtonOnClickAction()
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let offsetBalance = pageButton.frame.height + linkLabel.frame.height

        
        if textField == nameField.textField{
            nameField.hideErrorMessage()
            contentView.contentOffset = CGPoint(x: 0, y: 0)
            
        }else if textField == emailField.textField{
            emailField.hideErrorMessage()
            contentView.contentOffset = CGPoint(x: 0, y: 0)
        }else if textField == passwordField.passwordTextField{
            passwordField.hideErrorMessage()
            contentView.contentOffset = CGPoint(x: 0, y: passwordField.frame.origin.y - offsetBalance)
        }else if textField == confirmPasswordField.passwordTextField{
            confirmPasswordField.hideErrorMessage()
            contentView.contentOffset = CGPoint(x: 0, y: confirmPasswordField.frame.origin.y - offsetBalance)
        }else if textField == mobileField.textField{
            mobileField.hideErrorMessage()
            contentView.contentOffset = CGPoint(x: 0, y: 0)

        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(textField)
        
        let offsetBalance = pageButton.frame.height + linkLabel.frame.height
        
        if textField == emailField.textField{
            contentView.contentOffset = CGPoint(x: 0, y: 0)

        }else if textField == passwordField.passwordTextField{
            contentView.contentOffset = CGPoint(x: 0, y: passwordField.frame.origin.y - offsetBalance)
        }else if textField == confirmPasswordField.passwordTextField{
            contentView.contentOffset = CGPoint(x: 0, y: confirmPasswordField.frame.origin.y - offsetBalance)
        }
        
        return true
    }
}


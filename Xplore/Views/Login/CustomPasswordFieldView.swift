import UIKit

class CustomPasswordFieldView: CustomLoginFieldView {
    
    lazy var passwordTextField = {
        let textField = CustomPasswordTextField(frame: .zero)
        return textField
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
         
        errorLabel.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: passwordTextField.frame.height * 0.7).isActive = true

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.textField.removeFromSuperview()
        self.addSubview(passwordTextField)
        setupPasswordTextFieldsView()
    }
    
    private func setupPasswordTextFieldsView(){
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: self.topAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordTextField.bottomAnchor.constraint(equalTo: super.errorLabel.topAnchor, constant: -3)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func emptyTextField() {
        passwordTextField.text = nil
    }
}

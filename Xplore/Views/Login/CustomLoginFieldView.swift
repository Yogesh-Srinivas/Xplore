

import UIKit


class CustomLoginFieldView: UIView {
    
    lazy var textField : CustomTextField = CustomTextField(frame: .zero)
    
    lazy var errorLabel = {
        let label = UILabel()
        label.configTertiaryStyle()
        label.textColor = .systemRed
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(textField)
        self.addSubview(errorLabel)
        textField.delegate = self
        setupTextFieldsView()
        setupErrorLabel()
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if textField.frame.height > 0.0{
            errorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: textField.frame.height * 0.7).isActive = true
            
        }

    }
    
    private func setupTextFieldsView(){
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: self.topAnchor),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    private func setupErrorLabel(){
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: textField.bottomAnchor,constant: 3),
            errorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            errorLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func showErrorMessage(message : String){
        errorLabel.text = message
    }
    
    func hideErrorMessage(){
        errorLabel.text = nil
    }
    
    func emptyTextField(){
        textField.text = nil
    }
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomLoginFieldView : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        hideErrorMessage()
    }
    
}

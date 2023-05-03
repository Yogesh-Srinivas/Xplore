import UIKit

class CustomPasswordTextField: CustomTextField {
    private lazy var eyeButton = {
        let button = UIButton(type: .custom)
        let eyeImage = UIImage(systemName: "eye.slash")
        button.setImage(eyeImage, for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.tintColor = textFieldElementsColor
    
        return button
    }()
    
    private var isPasswordVisible = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.rightView = eyeButton
        self.rightViewMode = .always
        self.isSecureTextEntry = !isPasswordVisible
        setupEyeButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupEyeButton(){
        
        eyeButton.addTarget(self, action: #selector(didTapEyeButton), for: .touchUpInside)
    }
    
    @objc private func didTapEyeButton() {
        isPasswordVisible.toggle()
        
        let eyeImage = isPasswordVisible ?
        UIImage(systemName: "eye") :
        UIImage(systemName: "eye.slash")
        
        eyeButton.setImage(eyeImage, for: .normal)
        self.isSecureTextEntry = !isPasswordVisible
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: frame.size.width - frame.size.height * 0.4 - 10, y: frame.size.height * 0.3, width: frame.size.height * 0.7, height: frame.size.height * 0.5)
    }
    
}

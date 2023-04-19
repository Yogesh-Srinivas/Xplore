import UIKit


class CustomTextField: UITextField {
    
    var textFieldElementsColor = UIColor.systemGray2
    
    lazy var iconImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let borderLayer = CALayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setCustomBackground()
        
        self.leftView = iconImageView
        self.leftViewMode = .always
        
        setupBorderLayer()
        
        iconImageView.tintColor = textFieldElementsColor
        
        self.font = UIFont.systemFont(ofSize: 20)
        self.textColor = .label
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
        self.spellCheckingType = .no
        self.returnKeyType = .done
        
    }
    
    private func setupBorderLayer(){
        self.borderLayer.borderColor = textFieldElementsColor.cgColor
        self.borderLayer.borderWidth = 1.0
        self.layer.addSublayer(borderLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let leftImageIconWidth = frame.size.height * 0.25

        return bounds.insetBy(dx: leftImageIconWidth + 20, dy: leftImageIconWidth)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let leftImageIconWidth = frame.size.height * 0.25

        return bounds.insetBy(dx: leftImageIconWidth + 20, dy: leftImageIconWidth)
    }


    override func draw(_ rect: CGRect) {
        let leftImageIconWidth = frame.size.height * 0.5

        borderLayer.frame = CGRect(x: leftImageIconWidth + 10, y: frame.size.height - 1, width: frame.size.width - leftImageIconWidth - 10, height: 2)
    }

    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 0, y: frame.size.height * 0.3, width: frame.size.height * 0.6, height: frame.size.height * 0.6)
    }
    
}

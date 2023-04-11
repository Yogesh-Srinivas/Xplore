import UIKit

class LabelWithButtonView: UIStackView {

    lazy var leadingLabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()
    
    lazy var trailingButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.axis = .horizontal
        self.addArrangedSubview(leadingLabel)
        self.addArrangedSubview(trailingButton)
        self.spacing = 2
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

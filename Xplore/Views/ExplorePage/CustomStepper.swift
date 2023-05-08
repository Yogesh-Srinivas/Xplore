import UIKit

class CustomStepper: UIView {
    
    private let stepperSize : Double
    var stepValue : Int = 1
    var maximumValue : Int = 0{
        didSet{
            updateButtonState()
        }
    }
    var minimumValue : Int = 0{
        didSet{
            updateButtonState()
        }
    }
    
    var value : Int = 0{
        didSet{
            contentLabel.text = String(value)
        }
    }

    lazy var incrementButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.configSecondaryStyle()
        button.addTarget(self, action: #selector(stepperButtonActon(_:)), for: .touchDown)
        button.tag = 1
        
        button.layer.cornerRadius = stepperSize / 2
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray.cgColor

        return button
    }()
    
    lazy var decrementButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.configSecondaryStyle()

        button.addTarget(self, action: #selector(stepperButtonActon(_:)), for: .touchDown)
        button.tag = 0
        button.layer.cornerRadius = stepperSize / 2
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray.cgColor

        return button
    }()
    
    lazy var contentLabel = {
        let label = UILabel()
        label.configSemiPrimary()
        label.text = String(value)
        label.textAlignment = .center
        return label
    }()
    
   
    
    init(frame: CGRect,stepperSize : Double) {
        self.stepperSize = stepperSize
        super.init(frame: frame)
        
        self.addSubview(decrementButton)
        self.addSubview(contentLabel)
        self.addSubview(incrementButton)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        decrementButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            decrementButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            decrementButton.topAnchor.constraint(equalTo: self.topAnchor),
            decrementButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            decrementButton.trailingAnchor.constraint(equalTo: contentLabel.leadingAnchor),
            decrementButton.heightAnchor.constraint(equalToConstant: stepperSize),
            decrementButton.widthAnchor.constraint(equalToConstant: stepperSize)
        ])
        
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: self.topAnchor),
            contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: incrementButton.leadingAnchor),
            contentLabel.heightAnchor.constraint(equalToConstant: stepperSize),
            contentLabel.widthAnchor.constraint(equalToConstant: stepperSize)
        ])
        
        incrementButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            incrementButton.topAnchor.constraint(equalTo: self.topAnchor),
            incrementButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            incrementButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            incrementButton.heightAnchor.constraint(equalToConstant: stepperSize),
            incrementButton.widthAnchor.constraint(equalToConstant: stepperSize)
        ])
        
    }
    
    @objc private func stepperButtonActon(_ button : UIButton){
        if button.tag == 0{
            value -= stepValue
        }else{
            value += stepValue
        }
        updateButtonState()
    }
    
    private func updateButtonState(){
        
        if value == minimumValue{
            decrementButton.isEnabled = false
            decrementButton.alpha = 0.4
        }else if value > minimumValue{
            decrementButton.isEnabled = true
            decrementButton.alpha = 1.0
        }
        
        
        if value == maximumValue{
            incrementButton.isEnabled = false
            incrementButton.alpha = 0.4
        }else if value < maximumValue{
            incrementButton.isEnabled = true
            incrementButton.alpha = 1.0
        }
        
    }
}

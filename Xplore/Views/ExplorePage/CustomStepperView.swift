
import UIKit

class CustomStepperView: UIView {
    
    
//    lazy var contentStepper = {
//        let stepper = UIStepper()
//        stepper.stepValue = 1
//        stepper.addTarget(self, action: #selector(stepperAction), for: .valueChanged)
//        return stepper
//    }()
    
//    lazy var stepperValueLabel = {
//        let label = UILabel()
//        label.text = String(Int(contentStepper.value))
//        label.configSemiPrimary()
//        label.textAlignment = .center
//        return label
//    }()
    
    lazy var contentStepper = {
        let stepper = CustomStepper(frame: .zero, stepperSize: 40)
        stepper.stepValue = 1
//        stepper.addTarget(self, action: #selector(stepperAction), for: .valueChanged)
        return stepper
    }()
    
    lazy var titleLabel = {
        let label = UILabel()
        label.configSemiPrimary()
        return label
    }()
    
    lazy var subTitleLabel = {
        let label = UILabel()
        label.configSecondaryFadedStyle()
        return label
    }()
    
    let completionHandler : (Int)->()
    
    init(frame: CGRect,maxValue : Int,minValue : Int,titleText : String,subTitleText : String,completionHandler : @escaping (Int)->()) {
        self.completionHandler = completionHandler
        super.init(frame: frame)
        
        self.contentStepper.maximumValue = maxValue
        self.contentStepper.minimumValue = minValue
        self.contentStepper.value = minValue
//        stepperValueLabel.text = String(minValue)
        self.titleLabel.text = titleText
        self.subTitleLabel.text = subTitleText
        
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
        self.addSubview(contentStepper)
//        self.addSubview(stepperValueLabel)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: subTitleLabel.topAnchor, constant: -5)
        ])
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
        
        contentStepper.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentStepper.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentStepper.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        
//        stepperValueLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            stepperValueLabel.trailingAnchor.constraint(equalTo: contentStepper.leadingAnchor, constant: -20),
//            stepperValueLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            stepperValueLabel.heightAnchor.constraint(equalToConstant: 35),
//            stepperValueLabel.widthAnchor.constraint(equalToConstant: 35),
//        ])
        
    }
    
//    @objc private func stepperAction(){
//        stepperValueLabel.text = String(Int(contentStepper.value))
//        completionHandler(Int(contentStepper.value))
//    }
    
}

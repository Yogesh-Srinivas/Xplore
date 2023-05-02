
import UIKit

class PricePresentationViewController: UIViewController {
    
    let priceDetails : Price
    
    let placeTitle : String
    
    lazy var titleView = {
        let titleLabel = UILabel()
        titleLabel.text = "Price Details (\(priceDetails.currencyCode))"
        titleLabel.configPrimaryStyle()
//        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        return titleLabel
    }()
    
    lazy var placeTitleView = {
        let titleLabel = UILabel()
        titleLabel.text = placeTitle
        titleLabel.configSecondaryStyle()
        return titleLabel
    }()
    
    lazy var cancelButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.tintColor = .label
        button.addTarget(self, action: #selector(dismissViewAction), for: .touchDown)
        return button
    }()
    
    lazy var mainSeparator = UIUtils.getSeparator(size: 1.3)
    
    lazy var contentStackView = {
        
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    init(priceDetails : Price,placeTitle : String){
        self.priceDetails = priceDetails
        self.placeTitle = placeTitle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 16
        
        view.addSubview(cancelButton)
        view.addSubview(contentStackView)
        view.addSubview(titleView)
        view.addSubview(placeTitleView)
        view.addSubview(mainSeparator)
        
        setupTitleViews()
        setupStackView()
    }
    
    private func setupTitleViews(){
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 22),
            cancelButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 15),
            cancelButton.heightAnchor.constraint(equalToConstant: 17),
            cancelButton.widthAnchor.constraint(equalToConstant: 17),
        ])
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            titleView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
        ])
        
        placeTitleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            placeTitleView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 10),
            placeTitleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            placeTitleView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10)
        ])
        
        mainSeparator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainSeparator.topAnchor.constraint(equalTo: placeTitleView.bottomAnchor, constant: 3),
            mainSeparator.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            mainSeparator.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            
        ])
        
    }
    
    private func setupStackView(){
        
        
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: mainSeparator.bottomAnchor,constant:30),
            contentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -10),
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10)
        ])
        
        let pricePerDayView = StackViewWithCornorLabels(frame: .zero)
        pricePerDayView.leadingLabel.text = "Price Per Day"
        pricePerDayView.trailingLabel.text = "\(priceDetails.pricePerDay)"
        
        let taxesPercentageView = StackViewWithCornorLabels(frame: .zero)
        taxesPercentageView.leadingLabel.text = "Tax Percentage"
        taxesPercentageView.leadingLabel.configSecondaryFadedStyle()
        taxesPercentageView.trailingLabel.text = "\(priceDetails.taxPercentage) %"
        taxesPercentageView.trailingLabel.configSecondaryFadedStyle()

        
        
        let taxAmount = (Double(priceDetails.pricePerDay) * priceDetails.taxPercentage / 100).round(to: 2)
        
        let taxesAmountView = StackViewWithCornorLabels(frame: .zero)
        taxesAmountView.leadingLabel.text = "Tax Amount"
        taxesAmountView.trailingLabel.text = "\(taxAmount)"
        
        let totalPerDayView = StackViewWithCornorLabels(frame: .zero)
        totalPerDayView.leadingLabel.text = "Total Per Day"
        totalPerDayView.leadingLabel.configSemiPrimary()
        
        totalPerDayView.trailingLabel.text = "\((priceDetails.pricePerDay + taxAmount).round(to: 2))"
        totalPerDayView.trailingLabel.configSemiPrimary()
        
        
        contentStackView.addArrangedSubview(pricePerDayView)
        contentStackView.addArrangedSubview(taxesAmountView)
        contentStackView.addArrangedSubview(taxesPercentageView)
        contentStackView.addArrangedSubview(UIUtils.getSeparator(size: 1))
        contentStackView.addArrangedSubview(totalPerDayView)

    }
    
    @objc private func dismissViewAction(){
        self.dismiss(animated: true)
    }
}

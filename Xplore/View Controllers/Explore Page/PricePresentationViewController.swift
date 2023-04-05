
import UIKit

class PricePresentationViewController: UIViewController {
    
    let priceDetails : Price
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 16
        return view
    }()
    
    lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dimmedViewOnTapAction)))
        
        return view
    }()
    
    lazy var contentStackView = {
        
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    init(priceDetails : Price){
        self.priceDetails = priceDetails
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
        setupConstraints()
        setupStackView()
    }
    
    private func setupConstraints() {
        
        view.addSubview(dimmedView)
        view.addSubview(containerView)
        
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dimmedView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmedView.bottomAnchor.constraint(equalTo: containerView.topAnchor),
            dimmedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             containerView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
    }
    
    private func setupStackView(){
        
        containerView.addSubview(contentStackView)
        
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: containerView.topAnchor,constant:20),
            contentStackView.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor,constant: -10),
            contentStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 10),
            contentStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -10)
        ])
        
        let currencyCodeView = StackViewWithCornorLabels(frame: .zero)
        currencyCodeView.trailingLabel.text = "In \(priceDetails.currencyCode)"
        currencyCodeView.trailingLabel.configSecondaryFadedStyle()
        
        
        let pricePerDayView = StackViewWithCornorLabels(frame: .zero)
        pricePerDayView.leadingLabel.text = "Price Per Day"
        pricePerDayView.trailingLabel.text = "\(priceDetails.pricePerDay)"
        
        let taxesPercentageView = StackViewWithCornorLabels(frame: .zero)
        taxesPercentageView.leadingLabel.text = "Tax Percentage"
        taxesPercentageView.trailingLabel.text = "\(priceDetails.taxPercentage) %"
        
        
        let taxAmount = Int(Double(priceDetails.pricePerDay) * priceDetails.taxPercentage / 100)
        
        let taxesAmountView = StackViewWithCornorLabels(frame: .zero)
        taxesAmountView.leadingLabel.text = "Tax Amount"
        taxesAmountView.trailingLabel.text = "\(taxAmount)"
        
        let totalPerDayView = StackViewWithCornorLabels(frame: .zero)
        totalPerDayView.leadingLabel.text = "Total Per Day"
        totalPerDayView.leadingLabel.configSemiPrimary()
        
        totalPerDayView.trailingLabel.text = "\(priceDetails.pricePerDay + taxAmount)"
        totalPerDayView.trailingLabel.configSemiPrimary()
        
        contentStackView.addArrangedSubview(currencyCodeView)
        contentStackView.addArrangedSubview(pricePerDayView)
        contentStackView.addArrangedSubview(taxesAmountView)
        contentStackView.addArrangedSubview(taxesPercentageView)
        contentStackView.addArrangedSubview(totalPerDayView)

    }
    
    @objc private func dimmedViewOnTapAction(){
        self.dismiss(animated: true)
    }
}

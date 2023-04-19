import UIKit

class PriceDetails: SectionView {

    let contentStackView = {
       let stackView =  UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let tripDetails : BookedTrip
    
    lazy var numberOfDaysStayView = {
        let horizontalStackView = StackViewWithCornorLabels()
        horizontalStackView.leadingLabel.configSecondaryStyle()
        horizontalStackView.trailingLabel.configSecondaryRegularStyle()
        return horizontalStackView
    }()
    
    
    lazy var pricePerDay = {
        let horizontalStackView = StackViewWithCornorLabels()
        horizontalStackView.leadingLabel.configSecondaryFadedStyle()
        horizontalStackView.trailingLabel.configSecondaryFadedStyle()
        return horizontalStackView
    }()
    
    lazy var actualPrice = {
        let horizontalStackView = StackViewWithCornorLabels()
        horizontalStackView.leadingLabel.configSecondaryStyle()
        horizontalStackView.trailingLabel.configSecondaryRegularStyle()
        return horizontalStackView
    }()
    
    lazy var taxes = {
        let horizontalStackView = StackViewWithCornorLabels()
        horizontalStackView.leadingLabel.configSecondaryStyle()
        horizontalStackView.trailingLabel.configSecondaryRegularStyle()
        return horizontalStackView
    }()
    
    lazy var serviceFee = {
        let horizontalStackView = StackViewWithCornorLabels()
        horizontalStackView.leadingLabel.configSecondaryFadedStyle()
        horizontalStackView.trailingLabel.configSecondaryFadedStyle()
        return horizontalStackView
    }()
    
    lazy var cleaningFee = {
        let horizontalStackView = StackViewWithCornorLabels()
        horizontalStackView.leadingLabel.configSecondaryFadedStyle()
        horizontalStackView.trailingLabel.configSecondaryFadedStyle()
        return horizontalStackView
    }()
    
    lazy var totalPrice = {
        let horizontalStackView = StackViewWithCornorLabels()
        horizontalStackView.leadingLabel.configPrimaryRegularStyle()
        horizontalStackView.trailingLabel.configSecondaryStyle()
        return horizontalStackView
    }()
    
    
    init(frame: CGRect,tripDetails : BookedTrip) {
        self.tripDetails = tripDetails
    
        super.init(
            frame: frame,
            contentView: contentStackView,
            titleText: "Price Details (\(tripDetails.currencyCode))")
        
        setupPriceDetails()
        
        
        self.contentStackView.addArrangedSubview(numberOfDaysStayView)
        self.contentStackView.addArrangedSubview(pricePerDay)
        self.contentStackView.addArrangedSubview(actualPrice)
        self.contentStackView.addArrangedSubview(taxes)
        self.contentStackView.addArrangedSubview(cleaningFee)
        self.contentStackView.addArrangedSubview(serviceFee)
        self.contentStackView.addArrangedSubview(UIUtils.getSeparator(size: 1.5))
        self.contentStackView.addArrangedSubview(totalPrice)
        self.contentStackView.addArrangedSubview(UIUtils.getSeparator(size: 1.5))
    }
    
    private func setupPriceDetails(){
        numberOfDaysStayView.leadingLabel.text = "No. of Days Stay"
        numberOfDaysStayView.trailingLabel.text = "\(tripDetails.numberOfDays) Days"
        
        pricePerDay.leadingLabel.text = "Price Per Day"
        pricePerDay.trailingLabel.text = "\(tripDetails.pricePerDay)"
        
        actualPrice.leadingLabel.text = "Actual Price"
        actualPrice.trailingLabel.text = "\(tripDetails.actualPrice)"
        
        taxes.leadingLabel.text = "Taxes (\(tripDetails.taxPercentage) %)"
        taxes.trailingLabel.text = "\(tripDetails.taxes)"
        
        cleaningFee.leadingLabel.text = "Cleaning Fee"
        cleaningFee.trailingLabel.text = "\(ControlCenter.cleaningFee)"
        
        serviceFee.leadingLabel.text = "Service Fee"
        serviceFee.trailingLabel.text = "\(ControlCenter.serviceFee)"
        
        totalPrice.leadingLabel.text = "Total(\(tripDetails.currencyCode))"
        totalPrice.trailingLabel.text = "\(tripDetails.totalPrice + ControlCenter.cleaningFee + ControlCenter.serviceFee)"
        
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
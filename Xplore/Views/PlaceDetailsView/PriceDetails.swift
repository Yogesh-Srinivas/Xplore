import UIKit

class PriceDetails: SectionView {

    
    let contentStackView = {
       let stackView =  UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    var tripDetails : BookedTrip
    
    lazy var numberOfDaysStayView = {
        let horizontalStackView = StackViewWithCornorLabels()
        horizontalStackView.leadingLabel.configSecondaryFadedStyle()
        horizontalStackView.trailingLabel.configSecondaryFadedStyle()
        return horizontalStackView
    }()
    
    lazy var numberOfRoomsLabel = {
        let horizontalStackView = StackViewWithCornorLabels()
        horizontalStackView.leadingLabel.configSecondaryFadedStyle()
        horizontalStackView.trailingLabel.configSecondaryFadedStyle()
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
        horizontalStackView.leadingLabel.configSecondaryStyle()
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
        self.contentStackView.addArrangedSubview(numberOfRoomsLabel)
        self.contentStackView.addArrangedSubview(pricePerDay)
        self.contentStackView.addArrangedSubview(actualPrice)
        self.contentStackView.addArrangedSubview(taxes)
        self.contentStackView.addArrangedSubview(cleaningFee)
        self.contentStackView.addArrangedSubview(serviceFee)
        self.contentStackView.addArrangedSubview(UIUtils.getSeparator(size: 1.7))
        self.contentStackView.addArrangedSubview(totalPrice)
    }
    
    func updatePriceDetail(for numberOfRooms : Int){
        self.tripDetails.numberOfrooms = numberOfRooms
        setupPriceDetails()
    }
    
    private func setupPriceDetails(){
        let cleaningFeeDetail = (Double(tripDetails.numberOfrooms) * ControlCenter.cleaningFee).round(to: 2)
        let serviceFeeDetail = (Double(tripDetails.numberOfrooms) * ControlCenter.serviceFee).round(to: 2)
        
        numberOfDaysStayView.leadingLabel.text = "No. of Days Stay"
        numberOfDaysStayView.trailingLabel.text = "\(tripDetails.numberOfDays) Days"
        
        numberOfRoomsLabel.leadingLabel.text = "No. of Rooms"
        numberOfRoomsLabel.trailingLabel.text = "\(tripDetails.numberOfrooms)"
        
        pricePerDay.leadingLabel.text = "Price Per Day"
        pricePerDay.trailingLabel.text = "\(tripDetails.pricePerDay)"
        
        actualPrice.leadingLabel.text = "Actual Price"
        actualPrice.trailingLabel.text = "\(tripDetails.actualPrice)"
        
        taxes.leadingLabel.text = "Taxes (\(tripDetails.taxPercentage.round(to: 2)) %)"
        taxes.trailingLabel.text = "\(tripDetails.taxes)"
        
        cleaningFee.leadingLabel.text = "Cleaning Fee"
        cleaningFee.trailingLabel.text = "\(cleaningFeeDetail)"
        
        serviceFee.leadingLabel.text = "Service Fee"
        serviceFee.trailingLabel.text = "\(serviceFeeDetail)"
        
        totalPrice.leadingLabel.text = "Total(\(tripDetails.currencyCode))"
        totalPrice.trailingLabel.text = "\((tripDetails.totalPrice + cleaningFeeDetail + serviceFeeDetail).round(to: 2))"
        
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

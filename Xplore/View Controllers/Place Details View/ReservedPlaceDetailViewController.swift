import UIKit

class ReservedPlaceDetailViewController: UnvisitedPlaceDetailViewController {

    let tripDetails : BookedTrip
    
    lazy var priceDetailsView = PriceDetails(frame: .zero, tripDetails: tripDetails)
    
    lazy var guestView = {
        let labelView = StackViewWithCornorLabels(frame: .zero)
        labelView.leadingLabel.text = "Number Of Guests"
        labelView.trailingLabel.text = String(tripDetails.numberOfGuests)
        labelView.leadingLabel.configSecondaryStyle()
        labelView.trailingLabel.configSecondaryFadedStyle()
        return labelView
    }()
    
    lazy var cancelReservationButton = {
        let button = UIButton()
        button.setTitle("cancel Reservation", for: .normal)
        button.titleLabel?.configSecondaryStyle()
        button.setTitleColor(.red, for: .normal)
        button.underline()
        button.addTarget(self, action: #selector(cancelReservationButtonOnTapAction), for: .touchDown)
        return button
    }()
    
    init(placeDetails :  TravelPlaceDetail,databaseController : PlaceDBController,tripDetails : BookedTrip){
        self.tripDetails = tripDetails
        super.init(placeDetails: placeDetails, databaseController: databaseController)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.contentScrollView.addSubview(UIUtils.getSeparator(size: 1))
        super.contentScrollView.addSubview(cancelReservationButton)
        super.contentScrollView.insertSubview(priceDetailsView, belowSubview: amenitiesView)
        super.contentScrollView.insertSubview(guestView, aboveSubview: availabiltiyView)
        super.contentScrollView.insertSubview(UIUtils.getSeparator(size: 1), belowSubview: guestView)

        setupTripDates()
        setupScrollView()
    }
    
    private func setupTripDates(){
        if let numberOfDays = GeneralUtils.getNumberOfDays(from: tripDetails.BookedDateFrom, to: tripDetails.BookedDateTo){
            
            let tripCost = (tripDetails.pricePerDay * Double(numberOfDays)).round(to: 2)
            super.priceLabel.text = "Trip Cost : \(tripCost) \(tripDetails.currencyCode)"
        }
        
        
        super.availabiltiyView.headerLabel.text = "Your Stay"

        let fromDate = tripDetails.BookedDateFrom
        var dateText = "\(fromDate.day!) \(GeneralUtils.getMonthInString(month: fromDate.month!) )"

        if let toDate = tripDetails.BookedDateTo{
            
            dateText += " to \(toDate.day!) \(GeneralUtils.getMonthInString(month: toDate.month!))"
            
        }
        
        super.availabiltiyView.contentLabel.text = dateText
        super.availabiltiyView.contentLabel.removeUnderline()
        super.availabiltiyView.contentLabel.isUserInteractionEnabled = false
    }
    
    @objc private func cancelReservationButtonOnTapAction(){
        self.navigationController?.pushViewController(
            CancelReservationPageViewController(
            reservationId: tripDetails.reservationId,
            databaseController: databaseController
            ), animated: true)
    }
    

}

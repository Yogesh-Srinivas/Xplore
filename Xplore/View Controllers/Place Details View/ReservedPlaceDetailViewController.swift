import UIKit

class ReservedPlaceDetailViewController: UnvisitedPlaceDetailViewController {

    let tripDetails : BookedTrip
    
    lazy var priceDetailsView = PriceDetails(frame: .zero, tripDetails: tripDetails)
    
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
        var dateText = "\(fromDate.day!) \(GeneralUtils.getMonthInString(month: fromDate.month!) ) '\(fromDate.year! % 100)"

        if let toDate = tripDetails.BookedDateTo{
            
            dateText += " to \(toDate.day!) \(GeneralUtils.getMonthInString(month: toDate.month!)) '\(toDate.year! % 100)"
            
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

import UIKit

class ReservedPlaceDetailViewController: UnvisitedPlaceDetailViewController {

    let tripDetails : BookedTrip
    
    lazy var cancelReservationButton = {
        let button = UIButton()
        button.setTitle("cancel Reservation", for: .normal)
        button.titleLabel?.configSecondaryStyle()
        button.setTitleColor(.red, for: .normal)
        button.underline()

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
        super.contentScrollView.addSubview(cancelReservationButton)
        setupTripDates()
        setupScrollView()
    }
    
    private func setupTripDates(){
        if let numberOfDays = GeneralUtils.getNumberOfDays(from: tripDetails.BookedDateFrom, to: tripDetails.BookedDateTo){
            
            super.priceLabel.text = "Trip Cost : \(tripDetails.pricePerNight * numberOfDays) \(tripDetails.currencyCode)"
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
    

}

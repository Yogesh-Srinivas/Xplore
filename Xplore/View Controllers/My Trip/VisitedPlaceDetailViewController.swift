import UIKit

class VisitedPlaceDetailViewController: PlaceDetailViewController {

    let tripDetails : BookedTrip
    
    
    
    init(placeDetails :  TravelPlaceDetail,tripDetails : BookedTrip,databaseController : PlaceDBController) {
        self.tripDetails = tripDetails
        super.init(placeDetails: placeDetails, databaseController: databaseController)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        setupScrollView()
        
        setupTripDates()
        
      
       
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

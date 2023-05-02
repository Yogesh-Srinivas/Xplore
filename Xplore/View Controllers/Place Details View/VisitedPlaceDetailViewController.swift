import UIKit

class VisitedPlaceDetailViewController: PlaceDetailViewController {

    let tripDetails : BookedTrip
    
    lazy var ratingButtonItem = {
        let buttonItem = UIBarButtonItem()
        buttonItem.title = "Rate Place"
        buttonItem.tintColor = .link
        buttonItem.target = self
        buttonItem.action = #selector(ratingButtonOnTapAction)
        return buttonItem
    }()
    
    lazy var guestView = {
        let labelView = StackViewWithCornorLabels(frame: .zero)
        labelView.leadingLabel.text = "Number Of Guests"
        labelView.trailingLabel.text = String(tripDetails.numberOfGuests)
        labelView.leadingLabel.configSecondaryStyle()
        labelView.trailingLabel.configSecondaryFadedStyle()
        return labelView
    }()
    
    lazy var codeView = {
        let labelView = StackViewWithCornorLabels(frame: .zero)
        labelView.leadingLabel.text = "Reservation Code"
        labelView.trailingLabel.text = tripDetails.reservationId
        labelView.leadingLabel.configSecondaryStyle()
        labelView.trailingLabel.configSecondaryFadedStyle()
        return labelView
    }()
    
    lazy var priceDetailsView = PriceDetails(frame: .zero, tripDetails: tripDetails)
    
    init(placeDetails :  TravelPlaceDetail,tripDetails : BookedTrip,databaseController : PlaceDBController) {
        self.tripDetails = tripDetails
        super.init(placeDetails: placeDetails, databaseController: databaseController)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        super.contentScrollView.insertSubview(codeView, belowSubview: hostLabel)
        super.contentScrollView.insertSubview(UIUtils.getSeparator(size: 1), belowSubview: hostLabel)
        
        super.contentScrollView.insertSubview(priceDetailsView, belowSubview: hostLabel)
        super.contentScrollView.insertSubview(UIUtils.getSeparator(size: 1), belowSubview: hostLabel)
        
        super.contentScrollView.insertSubview(guestView, belowSubview: priceDetailsView)
        super.contentScrollView.insertSubview(UIUtils.getSeparator(size: 1), aboveSubview: guestView)
       
        setupScrollView()
        
        setupTripDates()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if !databaseController.isUserRated(placeId: placeDetails.placeId){
            self.navigationItem.rightBarButtonItem = ratingButtonItem
        }
        
        setupScrollView()
        
        reviewView.updateReviewList(
            updatedReviewList: databaseController.getReviews(placeId : placeDetails.placeId)
        )
        
        let rating = databaseController.getRatingDetail(placeId: placeDetails.placeId)
        placeDetails.ratingDetail = rating
//        ratingView.updateRatingView(newRating: placeDetails.placeRating)
        ratingLabel.text = self.placeDetails.ratingDetail.isEmpty ?                     "\(Constants.RATING_STAR) New" :
                            "\(Constants.RATING_STAR) \(placeDetails.placeRating) (\(placeDetails.ratingDetail.count))"
    }
    
    private func setupTripDates(){

        let fromDate = tripDetails.BookedDateFrom
        var dateText = "\(fromDate.day!) \(GeneralUtils.getMonthInString(month: fromDate.month!) )"

        if let toDate = tripDetails.BookedDateTo{
            
            dateText += " to \(toDate.day!) \(GeneralUtils.getMonthInString(month: toDate.month!))"
            
        }
        
        super.availabiltiyView.contentLabel.text = dateText
        super.availabiltiyView.contentLabel.removeUnderline()
        super.availabiltiyView.contentLabel.isUserInteractionEnabled = false
    }
    
    
    @objc private func ratingButtonOnTapAction(){
        self.navigationController?.pushViewController(
            RatingAndReviewViewController(databaseController: databaseController, placeId: placeDetails.placeId),
            animated: true
        )
    }

}

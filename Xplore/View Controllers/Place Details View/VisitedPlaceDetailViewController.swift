import UIKit

class VisitedPlaceDetailViewController: PlaceDetailViewController {

    let tripDetails : BookedTrip
    
    lazy var ratingButton = {
        let button = UIButton()
        button.setTitle("Rate this Place", for: .normal)
        button.titleLabel?.configSecondaryStyle()
        button.setTitleColor(.systemYellow, for: .normal)
        button.underline()
        button.addTarget(self, action: #selector(ratingButtonOnTapAction), for: .touchDown)
        return button
    }()
    
    lazy var guestView = {
        let labelView = StackViewWithCornorLabels(frame: .zero)
        labelView.leadingLabel.text = "Number Of Guests"
        labelView.trailingLabel.text = String(tripDetails.numberOfGuests)
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
        
        super.contentScrollView.bringSubviewToFront(ratingView)
        super.contentScrollView.bringSubviewToFront(super.contentScrollView.subviews[6])
        
        super.contentScrollView.bringSubviewToFront(reviewView)
        super.contentScrollView.bringSubviewToFront(super.contentScrollView.subviews[6])
        
        super.contentScrollView.insertSubview(priceDetailsView, belowSubview: availabiltiyView)
        super.contentScrollView.insertSubview(guestView, aboveSubview: availabiltiyView)
        super.contentScrollView.insertSubview(UIUtils.getSeparator(size: 1), belowSubview: guestView)

        if !databaseController.isUserRated(placeId: placeDetails.placeId){
            super.contentScrollView.addSubview(ratingButton)
        }
       
        setupScrollView()
        
        setupTripDates()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if databaseController.isUserRated(placeId: placeDetails.placeId){
            ratingButton.removeFromSuperview()
        }
        setupScrollView()
        
        reviewView.updateReviewList(
            updatedReviewList: databaseController.getReviews(placeId : placeDetails.placeId)
        )
        
        let rating = databaseController.getRatingDetail(placeId: placeDetails.placeId)
        placeDetails.ratingDetail = rating
        ratingView.updateRatingView(newRating: placeDetails.placeRating)
    }
    
    private func setupTripDates(){
        if let numberOfDays = GeneralUtils.getNumberOfDays(from: tripDetails.BookedDateFrom, to: tripDetails.BookedDateTo){
            
            super.priceLabel.text = "Trip Cost : \((tripDetails.pricePerDay * Double(numberOfDays)).round(to: 2)) \(tripDetails.currencyCode)"
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
    
    
    @objc private func ratingButtonOnTapAction(){
        self.navigationController?.pushViewController(
            RatingAndReviewViewController(databaseController: databaseController, placeId: placeDetails.placeId),
            animated: true
        )
    }

}

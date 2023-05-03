import UIKit

class ReservationViewController: UIViewController {
    
    private struct TripDetails{
        let placeId : String
        let placeName : String
        let fromDate : DateComponents
        let toDate : DateComponents?
        let dates : String
        var numberOfGuestes : Int
        let rating : Double
        let numberOfRating : Int
        let location : Location
        let imageUrl : String
        let numberOfPeopleAccomodate : Int
        let numberOfRoom : Int
        var guestes : String {
            return String(numberOfGuestes)+" guests"
        }
    }
    
    var numberOfRoomsNeeded = 1 {
        didSet{
            self.priceDetailView.updatePriceDetail(for: numberOfRoomsNeeded)
        }
    }
    
    lazy var guestView = {
        let customStepper = CustomStepperView(frame: .zero, maxValue: 33, minValue: 1, titleText: "Guests", subTitleText: ""){
            
            [unowned self](value) in
            self.tripDetails.numberOfGuestes = value
            self.numberOfRoomsNeeded = Int(value / self.tripDetails.numberOfPeopleAccomodate) + (value % self.tripDetails.numberOfPeopleAccomodate == 0 ? 0 : 1)
            
        }
        customStepper.titleLabel.configSecondaryStyle()
        customStepper.stepperValueLabel.configSecondaryRegularStyle()
        return customStepper
    }()
    
    private var tripDetails : TripDetails
    
    let databaseController : PlaceDBController
    
    lazy var contentScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    lazy var headerView = {
        let headerImageView = HeaderImageWithTitle(frame: .zero)
        return headerImageView
    }()
    
    lazy var yourTripView = {
        let sectionView = SectionView(frame: .zero, contentView: yourTripContentStackView, titleText: "Your Trip")
        sectionView.titleView.configSemiPrimary()

        return sectionView
    }()
    
    lazy var yourTripContentStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    var priceDetails : BookedTrip
    
    lazy var priceDetailView = {
        let priceDetail = PriceDetails(frame: .zero, tripDetails: priceDetails)
        priceDetail.titleView.configSemiPrimary()
        return priceDetail
    }()
    
    lazy var confirmLabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.configSecondaryRegularStyle()
        label.text = ControlCenter.reserveConfirmText
        return label
    }()
    
    lazy var confirmButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.setTitle("Confirm and Reserve", for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.configSecondaryStyle()
        button.addTarget(self, action: #selector(reserveButtonOnTapAction), for: .touchDown)
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        return button
    }()
    
    lazy var guestRulesView = {
        let label = UILabel()
        label.numberOfLines = 0
        label.configSecondaryRegularStyle()
        label.text = ControlCenter.guestRules
        
        let sectionView = SectionView(frame: .zero, contentView: label, titleText: "Guest rules")
        sectionView.titleView.configSemiPrimary()
        
        return sectionView
    }()
    
    init(fromDate : DateComponents,toDate : DateComponents?,placeDetail : TravelPlaceDetail,numberOfGuests : Int,databaseController : PlaceDBController,headerImage : UIImage?){
        
        
        var dates = "\(fromDate.day!) \(GeneralUtils.getMonthInString(month: fromDate.month!))"
        
        
        if let toDate = toDate{
            dates += " - \(toDate.day!) \(GeneralUtils.getMonthInString(month: toDate.month!))"

        }
        
        
        self.tripDetails = TripDetails(
            placeId : placeDetail.placeId,
            placeName: placeDetail.placeName,
            fromDate: fromDate,
            toDate: toDate,
            dates: dates,
            numberOfGuestes: numberOfGuests,
            rating: placeDetail.placeRating,
            numberOfRating: placeDetail.ratingDetail.count,
            location : placeDetail.location,
            imageUrl: placeDetail.images[0],
            numberOfPeopleAccomodate: placeDetail.noOfPeopleAccomodate,
            numberOfRoom: placeDetail.noOfRooms
        )
        
        self.priceDetails = BookedTrip(
            userId: GeneralUtils.getUserId(),
            placeId: placeDetail.placeId,
            BookedDateFrom: fromDate,
            BookedDateTo: toDate,
            pricePerDay: placeDetail.price.pricePerDay,
            taxPercentage: placeDetail.price.taxPercentage,
            currencyCode: placeDetail.price.currencyCode,
            isVisited: false,
            numberOfGuests: 1,
            cleaningFee: ControlCenter.cleaningFee,
            serviceFee: ControlCenter.cleaningFee,
            reservationId: "")
        
        self.databaseController = databaseController
        
        super.init(nibName: nil, bundle: nil)
        
        if let headerImage = headerImage{
            self.headerView.headerImage.image = headerImage
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.configBackgroundTheme()
        
        view.addSubview(contentScrollView)
        contentScrollView.addSubview(headerView)
        contentScrollView.addSubview(UIUtils.getSeparator(size: 1))
        contentScrollView.addSubview(yourTripView)
        contentScrollView.addSubview(UIUtils.getSeparator(size: 1))
        contentScrollView.addSubview(priceDetailView)
        contentScrollView.addSubview(guestRulesView)
        contentScrollView.addSubview(UIUtils.getSeparator(size: 1))
        contentScrollView.addSubview(confirmLabel)
        contentScrollView.addSubview(confirmButton)
        
        setupScrollView()
        setupYourTripView()
        setupHeaderview()
    }
    
    private func setupHeaderview(){
        headerView.primaryLabel.text = tripDetails.placeName
        
        headerView.tertiaryLabel.text = tripDetails.numberOfRating != 0 ? "\(Constants.RATING_STAR) \(tripDetails.rating) (\(tripDetails.numberOfRating))" : "\(Constants.RATING_STAR) New"
        
        headerView.secondaryLabel.text = "\(tripDetails.location.city), \(tripDetails.location.state), \(tripDetails.location.country)"
    }
    
    private func setupYourTripView(){
        
        let datesView = StackViewWithCornorLabels(frame: .zero)
        datesView.leadingLabel.text = "Dates"
        datesView.trailingLabel.text = self.tripDetails.dates
        
        datesView.leadingLabel.configSecondaryStyle()
        datesView.trailingLabel.configSecondaryRegularStyle()
        
        yourTripContentStackView.addArrangedSubview(datesView)
        yourTripContentStackView.addArrangedSubview(guestView)
    }
        
    private func setupScrollView(){
        
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        let scrollViewChildren = contentScrollView.subviews
        
        for childIndex in 0..<scrollViewChildren.count{
            
            let child = scrollViewChildren[childIndex]
            let widthPadingSize = 20.0
            child.translatesAutoresizingMaskIntoConstraints = false
            
            switch childIndex{
            case 0:
                NSLayoutConstraint.activate([
                    child.topAnchor.constraint(equalTo: contentScrollView.topAnchor)
                   
                ])
            case scrollViewChildren.count - 1:
                NSLayoutConstraint.activate([
                    child.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor,constant: -20),
                ])
            default:
                NSLayoutConstraint.activate([
                    child.topAnchor.constraint(equalTo: scrollViewChildren[childIndex-1].bottomAnchor,constant: 20),
                    child.bottomAnchor.constraint(equalTo: scrollViewChildren[childIndex+1].topAnchor,constant: -20)
    
                ])
            }
            
            NSLayoutConstraint.activate([
                child.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: widthPadingSize),
                child.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -widthPadingSize)
            ])
        }
        
        contentScrollView.showsVerticalScrollIndicator = false
    }
    
    
    @objc private func reserveButtonOnTapAction(_ button : UIButton){
        let reservationId = GeneralUtils.generateReservationUniqueID()
                
        let reservedPlaceDetail = BookedTrip(
            userId: GeneralUtils.getUserId(),
            placeId: tripDetails.placeId,
            BookedDateFrom: tripDetails.fromDate,
            BookedDateTo: tripDetails.toDate,
            pricePerDay: priceDetails.pricePerDay,
            taxPercentage: priceDetails.taxPercentage,
            currencyCode: priceDetails.currencyCode,
            isVisited: false,
            numberOfGuests: tripDetails.numberOfGuestes,
            cleaningFee: ControlCenter.cleaningFee,
            serviceFee: ControlCenter.serviceFee,
            reservationId: reservationId,
            numberOfrooms: numberOfRoomsNeeded
        )
        
        
        let confirmReserveAlert = UIAlertController(title: "Confirm Reservation", message: "Are you sure you want to make this reservation?", preferredStyle: UIAlertController.Style.alert)
        
        confirmReserveAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

        confirmReserveAlert.addAction(UIAlertAction(title: "Reserve", style: .default, handler: { (action: UIAlertAction!) in
            
            self.databaseController.reservePlace(tripDetails : reservedPlaceDetail)
                    
            self.navigationController?.pushViewController(
                ReservationConfirmationViewController(
                    location: self.tripDetails.location.city,
                    reservationCode: reservationId,
                    imageUrl: self.tripDetails.imageUrl), animated: true)
            
            let notification = UINotificationFeedbackGenerator()
            notification.notificationOccurred(.success)
        }))

        present(confirmReserveAlert, animated: true, completion: nil)
       
    }
 
}

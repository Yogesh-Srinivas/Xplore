import UIKit

class PlaceDetailedPageViewController: UIViewController {

    let databaseController : ExploreDBController
    
    var placeImagesCollectionView : UICollectionView
    
    lazy var availabiltiyView = AvailabilityDetailView()
    
    lazy var contentScrollView = UIScrollView()
    
    lazy var ratingView = RatingView(frame: CGRect.zero, rating: placeDetails.placeRating)
    
    let titleLabel = {
        let label = UILabel()
        label.configPrimaryStyle()
        label.numberOfLines = 0
        return label
    }()
    
    let locationLabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.configSecondaryStyle()
        
        let sectionedView = SectionView(frame: .zero, contentView: label, titleText: "Destination")
        return sectionedView
    }()
    
    let hostLabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.configSecondaryRegularStyle()
        let sectionedView = SectionView(frame: .zero, contentView: label, titleText: "Hosted By")
        
        return sectionedView
    }()
    
    let descriptionLabel = {
        let label = UILabel()
        label.configSemiPrimary()
        label.numberOfLines = 0
        return label
    }()
    
    let priceLabel = UILabel()
    let footerView = UIView()
    lazy var reserveButton = UIButton()
    
    var fromDate : DateComponents = DateComponents(){
        didSet{
            availabiltiyView.contentLabel.text = "\(fromDate.day!)-\(fromDate.month!) '\(fromDate.year! % 100)"
            
            availabiltiyView.contentLabel.configSecondaryStyle()
            
            let pricePerDay = placeDetails.price.pricePerDay
            let currencyCode = placeDetails.price.currencyCode
            
            priceLabel.text = "\(pricePerDay) x 1 day(s) = \(pricePerDay) \(currencyCode)"
            
            reserveButton.backgroundColor = .systemPink
            
            reserveButton.removeTarget(self, action: #selector(reserveButtonOnTapActionDisabled), for: .touchDown)
            
            reserveButton.addTarget(self, action: #selector(reserveButtonOnTapAction), for: .touchDown)
            
        }
    }
    var toDate : DateComponents? = nil{
        didSet{
            if let toDate = toDate{
                
                availabiltiyView.contentLabel.text = "\(fromDate.day!)-\(fromDate.month!) '\(fromDate.year! % 100) to \(toDate.day!)-\(toDate.month!) '\(toDate.year! % 100)"
                
                if let numberOfDays = Calendar.current.dateComponents([.day], from: fromDate.date!, to: toDate.date!).day{
                    let pricePerDay = placeDetails.price.pricePerDay
                    let currencyCode = placeDetails.price.currencyCode
                    priceLabel.text = "\(pricePerDay) x \(numberOfDays + 1) day(s) = \(pricePerDay * (numberOfDays+1)) \(currencyCode)"
                }
            }
        }
    }

    lazy var amenitiesView = AmenitiesView(frame: CGRect.zero, amenitiesList: placeDetails.amenities)
    
    lazy var reviewView = ReviewView(frame: CGRect.zero, reviewList: placeDetails.reviewDetail,referenceViewController: self)
    
    lazy var cancellationPolicyView = {
        let commonDetailShowView = CommonDetailShowView(frame: CGRect.zero, title: "Cancellation Policy")
        return commonDetailShowView
    }()
    
    lazy var houseRulesView = {
        let commonDetailShowView = CommonDetailShowView(frame: CGRect.zero, title: "House rules")
        return commonDetailShowView
    }()
    
    lazy var safetyAndPropertyView = {
        let commonDetailShowView = CommonDetailShowView(frame: CGRect.zero, title: "Safety & Property")
        return commonDetailShowView
    }()
    
    
    lazy var wishListItem = {
        let barButtonItem = UIBarButtonItem()
        barButtonItem.tintColor = .systemPink
        return barButtonItem
    }()
    
    var placeDetails : TravelPlaceDetail

    let wishListButtonClosure : ()->()
    
    init(imageList : [UIImage],placeDetails :  TravelPlaceDetail,databaseController : ExploreDBController,wishListButtonClosure : @escaping ()->()){
        self.placeImagesCollectionView = ImagesDisplayCollectionView(imagesList: imageList)
        self.wishListButtonClosure = wishListButtonClosure
        self.placeDetails = placeDetails
        
        self.databaseController = databaseController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        navigationItem.rightBarButtonItem = wishListItem

        //sample coloring
        footerView.backgroundColor = .systemBackground
        reserveButton.backgroundColor = .systemGray
        contentScrollView.backgroundColor = .systemBackground
        view.backgroundColor = .systemBackground

        
        view.addSubview(contentScrollView)
        contentScrollView.addSubview(placeImagesCollectionView)
        contentScrollView.addSubview(titleLabel)
        contentScrollView.addSubview(descriptionLabel)
        contentScrollView.addSubview(locationLabel)
        contentScrollView.addSubview(hostLabel)
        contentScrollView.addSubview(ratingView)
        contentScrollView.addSubview(reviewView)
        contentScrollView.addSubview(availabiltiyView)
        contentScrollView.addSubview(amenitiesView)
        contentScrollView.addSubview(cancellationPolicyView)
        contentScrollView.addSubview(houseRulesView)
        contentScrollView.addSubview(safetyAndPropertyView)
        view.addSubview(footerView)


        setupScrollView()
        setupDetailsLabels()
        setupAvailabilityView()
        setupAmentiesView()
        setupCancellationPolicyView()
        setupHouseRulesView()
        setupSafetyAndPropertyView()
        setupFooterView()
        setupWishItem()

    }

    private func setupFooterView(){
        
        footerView.addSubview(priceLabel)
        footerView.addSubview(reserveButton)

        setupPriceLabel()
        setupReserveButton()
                
        footerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            footerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        reserveButton.setTitle("Reserve", for: .normal)
        reserveButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        reserveButton.layer.cornerRadius = 10
        
        priceLabel.text = "\(placeDetails.price.pricePerDay) x 1 day(s)  = \(placeDetails.price.pricePerDay) \(placeDetails.price.currencyCode)"
        priceLabel.adjustsFontSizeToFitWidth = true
        priceLabel.configSecondaryStyle()
    }
    
    private func setupPriceLabel(){
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: footerView.leadingAnchor,constant: 10),
            priceLabel.topAnchor.constraint(equalTo: footerView.topAnchor,constant: 10),
            priceLabel.bottomAnchor.constraint(equalTo: footerView.bottomAnchor,constant: -10),
            priceLabel.trailingAnchor.constraint(equalTo: reserveButton.leadingAnchor,constant: -5)
        ])
        
    }
    
    private func setupDetailsLabels(){
        self.titleLabel.text = self.placeDetails.placeName
        
        descriptionLabel.text = self.placeDetails.description
        
        let locationContentLabel = locationLabel.contentView as! UILabel
        locationContentLabel.text = "\(self.placeDetails.location.address),\n\(self.placeDetails.location.city),\n\(self.placeDetails.location.state), \(self.placeDetails.location.country)."
        
        let hostContentLabel = self.hostLabel.contentView as! UILabel
        hostContentLabel.text = self.placeDetails.hostId
    }
    
    private func setupReserveButton(){
        reserveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reserveButton.trailingAnchor.constraint(equalTo: footerView.trailingAnchor,constant: -20),
            reserveButton.topAnchor.constraint(equalTo: footerView.topAnchor,constant: 10),
            reserveButton.bottomAnchor.constraint(equalTo: footerView.bottomAnchor,constant: -10),
            reserveButton.widthAnchor.constraint(equalTo: footerView.widthAnchor, multiplier: 0.3)
        ])
        
        reserveButton.addTarget(self, action: #selector(reserveButtonOnTapActionDisabled), for: .touchDown)
    }
    
    @objc private func reserveButtonOnTapAction(){
        self.navigationController?.pushViewController(ReservationViewController(fromDate: fromDate, toDate: toDate, placeDetail: placeDetails), animated: true)
    }
    
    @objc private func reserveButtonOnTapActionDisabled(){
        UIUtils.showAlertMessage(message: "choose your dates", viewController: self, durationInSeconds: 1.2)
    }
    
    private func setupScrollView(){
        
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentScrollView.bottomAnchor.constraint(equalTo: footerView.topAnchor)
        ])
        
        let scrollViewChildren = contentScrollView.subviews
        
        for childIndex in 0..<scrollViewChildren.count{
            let child = scrollViewChildren[childIndex]
            var widthPadingSize = 20.0
            child.translatesAutoresizingMaskIntoConstraints = false
            switch childIndex{
            case 0:
                NSLayoutConstraint.activate([
                    child.topAnchor.constraint(equalTo: contentScrollView.topAnchor),
                    child.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.4)
                ])
                widthPadingSize = 0
            case scrollViewChildren.count - 1:
                NSLayoutConstraint.activate([
                    child.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor)
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
    
    private func setupAvailabilityView(){
        availabiltiyView.setupTapAction(currentViewController: self, viewControllerToPresentOnTap: AvailabilityCalenderViewController(districtName: placeDetails.location.city,
            pricePerDay: placeDetails.price.pricePerDay,
            currencyCode: placeDetails.price.currencyCode){[weak self](fromDate,toDate) in
            self?.fromDate = fromDate
            self?.toDate = toDate
        })
        
        availabiltiyView.contentLabel.text = "choose your dates"
        availabiltiyView.contentLabel.configSecondaryStyle()
        availabiltiyView.contentLabel.underline()
       
    }

    private func setupAmentiesView(){
        
        amenitiesView.enableShowAllButtonAction(referenceViewControllerToPresent: self)
      
    }
    private func setupCancellationPolicyView(){
        cancellationPolicyView.setViewTapAction(referenceViewController: self, viewControllerToPresent: CancellationPolicyViewController())
    }
    
    func setupHouseRulesView(){
        houseRulesView.setViewTapAction(referenceViewController: self, viewControllerToPresent: HouseRulesViewController())
    }
    func setupSafetyAndPropertyView(){
        safetyAndPropertyView.setViewTapAction(referenceViewController: self, viewControllerToPresent: SafetyAndPropertyViewController())
    }
    
    private func setupWishItem(){
        
        
        if self.placeDetails.isWishListed{
            wishListItem.action  = #selector(wishListButtonOnTapActionRemoveFromWishList)
            wishListItem.target = self
            wishListItem.image = UIImage(systemName: "heart.fill")
        }else{
         
            wishListItem.action  = #selector(wishListButtonOnTapActionAddToWishList)
            wishListItem.target = self
            wishListItem.image = UIImage(systemName: "heart")
        }
    }
    
    @objc private func wishListButtonOnTapActionAddToWishList(){
        let placeId = placeDetails.placeId
        
        databaseController.addToWishList(placeId: placeId)
        
        wishListItem.image = UIImage(systemName: "heart.fill")
        
        placeDetails.isWishListed = true
        wishListButtonClosure()
        
        wishListItem.action = #selector(wishListButtonOnTapActionRemoveFromWishList)
       
    }
    
    @objc private func wishListButtonOnTapActionRemoveFromWishList(){
        
        let placeId = placeDetails.placeId
        
        databaseController.removeFromWishList(placeId: placeId)
    
        wishListItem.image = UIImage(systemName: "heart")
        placeDetails.isWishListed = false
        wishListButtonClosure()
        
        wishListItem.action = #selector(wishListButtonOnTapActionAddToWishList)
    }

}

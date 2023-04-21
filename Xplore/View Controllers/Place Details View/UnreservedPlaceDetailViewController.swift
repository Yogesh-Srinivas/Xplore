
import UIKit

class UnreservedPlaceDetailsViewController: UnvisitedPlaceDetailViewController {
    
    lazy var guestView = {
        let customStepper = CustomStepperView(frame: .zero, maxValue: 33, minValue: 1, titleText: "Number of guests", subTitleText: ""){
            [unowned self](value) in
            self.numberOfGuests = value
        }
        customStepper.titleLabel.configSecondaryStyle()
        return customStepper
    }()
    
    lazy var wishListItem = {
        let barButtonItem = UIBarButtonItem()
        return barButtonItem
    }()
    
    let wishListButtonClosure : (()->())?

    init(placeDetails :  TravelPlaceDetail,databaseController : PlaceDBController,wishListButtonClosure : (()->())?){

        
        self.wishListButtonClosure = wishListButtonClosure
        super.init(placeDetails: placeDetails, databaseController: databaseController)
       
    }
    
    var fromDate : DateComponents = DateComponents(){
        didSet{
            availabiltiyView.contentLabel.text = "on \(fromDate.day!) \(GeneralUtils.getMonthInString(month: fromDate.month!) )"
            
            availabiltiyView.contentLabel.configSecondaryStyle()
            
            let pricePerDay = placeDetails.price.pricePerDay
            let currencyCode = placeDetails.price.currencyCode
            
            priceLabel.text = "Trip Cost \(pricePerDay) \(currencyCode)"
            
            reserveButton.backgroundColor = .systemPink
            reserveButton.tag = 1
            
        }
    }
    
    var toDate : DateComponents? = nil{
        didSet{
            if let toDate = toDate{
                
                availabiltiyView.contentLabel.text = "\(fromDate.day!) \(GeneralUtils.getMonthInString(month: fromDate.month!))  to  \(toDate.day!) \(GeneralUtils.getMonthInString(month: toDate.month!))"
                
                if let numberOfDays = GeneralUtils.getNumberOfDays(from: fromDate, to: toDate){
                    let pricePerDay = placeDetails.price.pricePerDay
                    let currencyCode = placeDetails.price.currencyCode
                    priceLabel.text = "Trip Cost \((pricePerDay * Double(numberOfDays)).round(to: 2)) \(currencyCode)"
                }
            }
        }
    }
    
    var numberOfGuests : Int = 1

    lazy var footerView = UIView()

    private let paddingView = UIView()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = wishListItem
        setupWishItem()
        
        contentScrollView.insertSubview(guestView, belowSubview: cancellationPolicyView)
        contentScrollView.insertSubview(UIUtils.getSeparator(size: 1), aboveSubview: guestView)
        contentScrollView.addSubview(paddingView)
        footerView.backgroundColor = .systemBackground
        view.addSubview(footerView)
        
        setupFooterView()
        setupAvailabilityView()
        setupPaddingView()
        setupScrollView()
    }
    
    private func setupPaddingView(){
        paddingView.translatesAutoresizingMaskIntoConstraints = false
      
        paddingView.heightAnchor.constraint(equalToConstant: 60).isActive = true
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
    
    private func setupReserveButton(){
        reserveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reserveButton.trailingAnchor.constraint(equalTo: footerView.trailingAnchor,constant: -20),
            reserveButton.topAnchor.constraint(equalTo: footerView.topAnchor,constant: 10),
            reserveButton.bottomAnchor.constraint(equalTo: footerView.bottomAnchor,constant: -10),
            reserveButton.widthAnchor.constraint(equalTo: footerView.widthAnchor, multiplier: 0.3)
        ])
        
        reserveButton.addTarget(self, action: #selector(reserveButtonOnTapAction), for: .touchDown)
    
    }
    
    @objc private func reserveButtonOnTapAction(){
        if reserveButton.tag == 0{
            availabiltiyView.viewOnTap()
        }else{
            self.navigationController?.pushViewController(ReservationViewController(
                fromDate: fromDate,
                toDate: toDate,
                placeDetail: placeDetails,
                numberOfGuests: numberOfGuests,
                databaseController: databaseController,
                headerImage: self.placeImagesCollectionView.images[0]), animated: true)
        }
    }
    
    private func setupWishItem(){
        
        if self.placeDetails.isWishListed{
            wishListItem.action  = #selector(wishListButtonOnTapActionRemoveFromWishList)
            wishListItem.target = self
            wishListItem.tintColor = .systemPink
            wishListItem.image = UIImage(systemName: "heart.fill")
        }else{
         
            wishListItem.action  = #selector(wishListButtonOnTapActionAddToWishList)
            wishListItem.target = self
            wishListItem.image = UIImage(systemName: "heart")
            wishListItem.tintColor = .label
        }
    }
    
    private func setupAvailabilityView(){
        availabiltiyView.setupTapAction(currentViewController: self, viewControllerToPresentOnTap: AvailabilityCalenderViewController(
            
            districtName: placeDetails.location.city,
            pricePerDay: placeDetails.price.pricePerDay,
            currencyCode: placeDetails.price.currencyCode,
            bookedDates: databaseController.getBookedDates(of: placeDetails.placeId)
            
        ){[unowned self](fromDate,toDate) in
            self.fromDate = fromDate
            self.toDate = toDate
        })
        
        availabiltiyView.contentLabel.text = "choose your dates"
        availabiltiyView.contentLabel.configSecondaryStyle()
        availabiltiyView.contentLabel.underline()
       
    }
    
    @objc private func wishListButtonOnTapActionAddToWishList(){
        let placeId = placeDetails.placeId
        
        databaseController.addToWishList(placeId: placeId)
        
        wishListItem.image = UIImage(systemName: "heart.fill")
        wishListItem.tintColor = .systemPink
        
        placeDetails.isWishListed = true
        wishListButtonClosure?()
        
        wishListItem.action = #selector(wishListButtonOnTapActionRemoveFromWishList)
       
    }
    
    @objc private func wishListButtonOnTapActionRemoveFromWishList(){
        
        let placeId = placeDetails.placeId
        
        databaseController.removeFromWishList(placeId: placeId)
    
        wishListItem.image = UIImage(systemName: "heart")
        wishListItem.tintColor = .label
        
        placeDetails.isWishListed = false
        wishListButtonClosure?()
        
        wishListItem.action = #selector(wishListButtonOnTapActionAddToWishList)
    }
}

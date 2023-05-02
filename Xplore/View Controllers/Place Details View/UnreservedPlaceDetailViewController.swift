
import UIKit

class UnreservedPlaceDetailsViewController: UnvisitedPlaceDetailViewController {
    
    
    lazy var reserveButton = {
        let button = UIButton()
        button.isEnabled = false
        button.backgroundColor = .systemGray4
        return button
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
            let dateText = "on \(fromDate.day!) \(GeneralUtils.getMonthInString(month: fromDate.month!) )"
            
            availabiltiyView.contentLabel.text = dateText
            datesButton.setTitle(dateText, for: .normal)
                                
            reserveButton.backgroundColor = .systemPink
            reserveButton.isEnabled = true
            
        }
    }
    
    var toDate : DateComponents? = nil{
        didSet{
            if let toDate = toDate{
                
                let dateText = "\(fromDate.day!) \(GeneralUtils.getMonthInString(month: fromDate.month!)) to \(toDate.day!) \(GeneralUtils.getMonthInString(month: toDate.month!))"
                
                availabiltiyView.contentLabel.text = dateText
                datesButton.setTitle(dateText, for: .normal)
                
            }
        }
    }
    
    var numberOfGuests : Int = 1

    lazy var footerView = UIView()
    
    lazy var priceLabel = {
        let label = UILabel()
        label.configSecondaryFadedStyle()
        return label
    }()

    lazy var datesButton = {
        let button = UIButton()
        button.setTitle("choose your dates", for: .normal)
        button.titleLabel?.configSecondaryRegularStyle()
        button.setTitleColor(.link, for: .normal)
        button.titleLabel?.underline()
        button.addTarget(self, action: #selector(datesButtonOnTapAction), for: .touchDown)
        
        return button
    }()

    private let paddingView = UIView()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = wishListItem
        setupWishItem()
        
//        contentScrollView.insertSubview(guestView, belowSubview: cancellationPolicyView)
//        contentScrollView.insertSubview(UIUtils.getSeparator(size: 1), aboveSubview: guestView)
        
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
      
        paddingView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    private func setupFooterView(){
        
        footerView.addSubview(priceLabel)
        footerView.addSubview(reserveButton)
        footerView.addSubview(datesButton)
        
        setupPriceLabel()
        setupDatesButton()
        setupReserveButton()
                
        footerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            footerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        footerView.layer.shadowColor = UIColor.tertiaryLabel.cgColor
        footerView.layer.shadowRadius = 1
        footerView.layer.shadowOffset = CGSize(width: 0, height: -1)
        footerView.layer.masksToBounds = false
        footerView.layer.shadowOpacity = 1
        
        reserveButton.setTitle("Reserve", for: .normal)
        reserveButton.layer.cornerRadius = 10
        
        priceLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func setupPriceLabel(){
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: footerView.leadingAnchor,constant: 10),
            priceLabel.topAnchor.constraint(equalTo: footerView.topAnchor,constant: 10),
            priceLabel.trailingAnchor.constraint(equalTo: reserveButton.leadingAnchor,constant: -5)
        ])
        
        priceLabel.text = "\(placeDetails.price.currencyCode) \(placeDetails.price.pricePerDay) day"
        
    }
    
    private func setupDatesButton(){
        datesButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datesButton.leadingAnchor.constraint(equalTo: footerView.leadingAnchor,constant: 10),
            datesButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor,constant: 10),
            datesButton.bottomAnchor.constraint(equalTo: footerView.bottomAnchor,constant: -15),
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
        self.navigationController?.pushViewController(ReservationViewController(
            fromDate: fromDate,
            toDate: toDate,
            placeDetail: placeDetails,
            numberOfGuests: numberOfGuests,
            databaseController: databaseController,
            headerImage: self.placeImagesCollectionViewWithPageControl.placeImagesCollectionView.images[0]), animated: true)
        
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
        availabiltiyView.contentLabel.textColor = .link
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
    
    @objc private func datesButtonOnTapAction(){
        availabiltiyView.viewOnTap()
    }
}

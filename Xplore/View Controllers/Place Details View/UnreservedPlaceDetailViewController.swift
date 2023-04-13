
import UIKit

class UnreservedPlaceDetailsViewController: UnvisitedPlaceDetailViewController {
    
    
    lazy var wishListItem = {
        let barButtonItem = UIBarButtonItem()
        barButtonItem.tintColor = .systemPink
        return barButtonItem
    }()
    
    let wishListButtonClosure : (()->())?

    init(placeDetails :  TravelPlaceDetail,databaseController : PlaceDBController,wishListButtonClosure : (()->())?){

        
        self.wishListButtonClosure = wishListButtonClosure
        super.init(placeDetails: placeDetails, databaseController: databaseController)
       
    }
    
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
                
                if let numberOfDays = GeneralUtils.getNumberOfDays(from: fromDate, to: toDate){
                    let pricePerDay = placeDetails.price.pricePerDay
                    let currencyCode = placeDetails.price.currencyCode
                    priceLabel.text = "\(pricePerDay) x \(numberOfDays + 1) day(s) = \(pricePerDay * (numberOfDays+1)) \(currencyCode)"
                }
            }
        }
    }

    lazy var footerView = UIView()

    private let paddingView = UIView()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = wishListItem
        setupWishItem()
        
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
        self.navigationController?.pushViewController(ReservationViewController(fromDate: fromDate, toDate: toDate, placeDetail: placeDetails,databaseController: databaseController), animated: true)
    }
    
    @objc private func reserveButtonOnTapActionDisabled(){
        UIUtils.showAlertMessage(message: "choose your dates", viewController: self, durationInSeconds: 1.2)
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
    
    @objc private func wishListButtonOnTapActionAddToWishList(){
        let placeId = placeDetails.placeId
        
        databaseController.addToWishList(placeId: placeId)
        
        wishListItem.image = UIImage(systemName: "heart.fill")
        
        placeDetails.isWishListed = true
        wishListButtonClosure?()
        
        wishListItem.action = #selector(wishListButtonOnTapActionRemoveFromWishList)
       
    }
    
    @objc private func wishListButtonOnTapActionRemoveFromWishList(){
        
        let placeId = placeDetails.placeId
        
        databaseController.removeFromWishList(placeId: placeId)
    
        wishListItem.image = UIImage(systemName: "heart")
        placeDetails.isWishListed = false
        wishListButtonClosure?()
        
        wishListItem.action = #selector(wishListButtonOnTapActionAddToWishList)
    }
}

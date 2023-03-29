import UIKit

class PlaceDetailedPageViewController: UIViewController {

        
    lazy var placeImagesCollectionView = PlaceDetailCardView()
    
    lazy var availabiltiyView = AvailabilityDetailView()
    
    lazy var contentScrollView = UIScrollView()
    
    lazy var ratingView = RatingView(frame: CGRect.zero, rating: 1.45)
    
    
    let priceLabel = UILabel()
    let footerView = UIView()
    lazy var reserveButton = UIButton()

    
    //sample amenity list
    let amenitiesList = [Amenity.Air_Conditioning,Amenity.CarbonMonoxide_Alarm,Amenity.Hot_Tub,Amenity.First_Aid_Kit,Amenity.Air_Conditioning,Amenity.CarbonMonoxide_Alarm,Amenity.Hot_Tub,Amenity.First_Aid_Kit,Amenity.Air_Conditioning,Amenity.CarbonMonoxide_Alarm,Amenity.Hot_Tub,Amenity.First_Aid_Kit]
//    let amenitiesList = [Amenity.Air_Conditioning]
    lazy var amenitiesView = AmenitiesView(frame: CGRect.zero, amenitiesList: amenitiesList)
    
    
    //sample review list
    let reviewList = [Review(userID: "UD101", userName: "Rahul", review: " this is nice course fd dfdvd v dfv df vdfv d v d vd  vdfd d d v d v dfv d vd cf d fd  d f this is nice course fd dfdvd v dfv df vdfv d v d vd  vdfd d d v d v dfv d vd cf d fd  d f this is nice course fd dfdvd v dfv df vdfv d v d vd  vdfd d d v d v dfv d vd cf d fd  d f this is nice course fd dfdvd v dfv df vdfv d v d vd  vdfd d d v d v dfv d vd cf d fd  d f this is nice course fd dfdvd v dfv df vdfv d v d vd  vdfd d d v d v dfv d vd cf d fd  d f v "),Review(userID: "UD101", userName: "Rahul", review: "this is nice course"),Review(userID: "UD101", userName: "Rahul", review: "this is nice course")]
    lazy var reviewView = ReviewView(frame: CGRect.zero, reviewList: reviewList)
    
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        
        //sample coloring
        footerView.backgroundColor = .systemBackground
        reserveButton.backgroundColor = .systemPink
        view.backgroundColor = .white

        view.addSubview(contentScrollView)
        contentScrollView.addSubview(placeImagesCollectionView)
        contentScrollView.addSubview(availabiltiyView)
        contentScrollView.addSubview(ratingView)
        contentScrollView.addSubview(reviewView)
        contentScrollView.addSubview(amenitiesView)
        contentScrollView.addSubview(cancellationPolicyView)
        contentScrollView.addSubview(houseRulesView)
        contentScrollView.addSubview(safetyAndPropertyView)
        view.addSubview(footerView)

        
        setupFooterView()
        setupScrollView()
        setupPlaceImagesCollectionView()
        setupAvailabilityView()
        setupRatingView()
        setupReviewView()
        setupAmentiesView()
        setupCancellationPolicyView()
        setupHouseRulesView()
        setupSafetyAndPropertyView()
    }

    private func setupFooterView(){
        
        footerView.addSubview(priceLabel)
        setupPriceLabel()
        
        footerView.addSubview(reserveButton)
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
        
        priceLabel.text = "20000 INR"
        priceLabel.font = .systemFont(ofSize: 15)

    }
    
    private func setupPriceLabel(){
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: footerView.leadingAnchor,constant: 10),
            priceLabel.topAnchor.constraint(equalTo: footerView.topAnchor,constant: 10),
            priceLabel.bottomAnchor.constraint(equalTo: footerView.bottomAnchor,constant: -10)
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
        self.navigationController?.pushViewController(ReservationViewController(), animated: true)
    }
    
    private func setupPlaceImagesCollectionView(){
        placeImagesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            placeImagesCollectionView.topAnchor.constraint(equalTo: contentScrollView.topAnchor),
            placeImagesCollectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            placeImagesCollectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            placeImagesCollectionView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.6)
        ])
        
        placeImagesCollectionView.titleLabel.text = "fsdfd sfds fds ds v"
        placeImagesCollectionView.locationLabel.text = "njdfsdjksnfkjdsf,ijnfsdfsjknkjndsf,njkdvskjnsvkj"
        placeImagesCollectionView.ratingLabel.text = "Rating : 5.0"
        
        placeImagesCollectionView.titleLabel.numberOfLines = 0
        placeImagesCollectionView.titleLabel.sizeToFit()
        placeImagesCollectionView.titleLabel.lineBreakMode = .byTruncatingTail
        placeImagesCollectionView.titleLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func setupScrollView(){
        
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentScrollView.bottomAnchor.constraint(equalTo: footerView.topAnchor)
        ])
    }
    
    private func setupAvailabilityView(){
        availabiltiyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            availabiltiyView.topAnchor.constraint(equalTo: reviewView.bottomAnchor),
            availabiltiyView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            availabiltiyView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            availabiltiyView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor,multiplier: 0.1)
        ])
        availabiltiyView.setupTapAction(currentViewController: self, viewControllerToPresentOnTap: AvailabilityCalenderViewController())
        
        
        availabiltiyView.contentLabel.text = "20 jun '22 - 31 Aug '22"
        
        
       
    }
    private func setupRatingView(){
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            ratingView.topAnchor.constraint(equalTo: amenitiesView.bottomAnchor),
            ratingView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            ratingView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ratingView.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.15)
        
        ])
    }
    
    private func setupReviewView(){
        reviewView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reviewView.topAnchor.constraint(equalTo: ratingView.bottomAnchor),
            reviewView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            reviewView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            reviewView.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.35)
        ])
    }
    
    private func setupAmentiesView(){
        amenitiesView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            amenitiesView.topAnchor.constraint(equalTo: placeImagesCollectionView.bottomAnchor),
            amenitiesView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            amenitiesView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        amenitiesView.enableShowAllButtonAction(referenceViewControllerToPresent: self)
      
    }
    private func setupCancellationPolicyView(){
        cancellationPolicyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cancellationPolicyView.topAnchor.constraint(equalTo: availabiltiyView.bottomAnchor),
            cancellationPolicyView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            cancellationPolicyView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            cancellationPolicyView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1)
        ])
        
        cancellationPolicyView.setViewTapAction(referenceViewController: self, viewControllerToPresent: CancellationPolicyViewController())
    }
    
    func setupHouseRulesView(){
        houseRulesView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            houseRulesView.topAnchor.constraint(equalTo: cancellationPolicyView.bottomAnchor),
            houseRulesView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            houseRulesView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            houseRulesView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1)
        ])
        
        houseRulesView.setViewTapAction(referenceViewController: self, viewControllerToPresent: HouseRulesViewController())
    }
    func setupSafetyAndPropertyView(){
        safetyAndPropertyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            safetyAndPropertyView.topAnchor.constraint(equalTo: houseRulesView.bottomAnchor),
            safetyAndPropertyView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            safetyAndPropertyView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            safetyAndPropertyView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1),
            safetyAndPropertyView.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor),
        ])
        
        safetyAndPropertyView.setViewTapAction(referenceViewController: self, viewControllerToPresent: SafetyAndPropertyViewController())
        
    }

}

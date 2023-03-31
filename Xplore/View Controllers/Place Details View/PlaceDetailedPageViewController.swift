import UIKit

class PlaceDetailedPageViewController: UIViewController {

        
    var placeImagesCollectionView : UICollectionView
    
    lazy var availabiltiyView = AvailabilityDetailView()
    
    lazy var contentScrollView = UIScrollView()
    
    lazy var ratingView = RatingView(frame: CGRect.zero, rating: 1.45)
    
    let titleLabel = {
        let label = UILabel()
        return label
    }()
    
    let locationLabel = {
        let label = UILabel()
        return label
    }()
    
    let priceLabel = UILabel()
    let footerView = UIView()
    lazy var reserveButton = UIButton()
    
    var fromDate : DateComponents = DateComponents(){
        didSet{
            availabiltiyView.contentLabel.text = "\(fromDate.day!)-\(fromDate.month!) '\(fromDate.year! % 100)"
            
            availabiltiyView.contentLabel.configSecondaryStyle()
            
            priceLabel.text = "\(pricePerDay) x 1 = \(pricePerDay) \(currencyCode)"
            
            reserveButton.backgroundColor = .systemPink
        }
    }
    var toDate : DateComponents? = nil{
        didSet{
            if let toDate = toDate{
                
                availabiltiyView.contentLabel.text = "\(fromDate.day!)-\(fromDate.month!) '\(fromDate.year! % 100) to \(toDate.day!)-\(toDate.month!) '\(toDate.year! % 100)"
                
                if let numberOfDays = Calendar.current.dateComponents([.day], from: fromDate.date!, to: toDate.date!).day{
                    
                    priceLabel.text = "\(pricePerDay) x \(numberOfDays + 1) = \(pricePerDay * (numberOfDays+1)) \(currencyCode)"
                }
            }
        }
    }
    

    //sample details
    let districtName : String = "Naggar"
    let pricePerDay : Int = 12000
    let currencyCode : String = "INR"
    //sample amenity list
    let amenitiesList = [Amenity.Air_Conditioning,Amenity.CarbonMonoxide_Alarm,Amenity.Hot_Tub,Amenity.First_Aid_Kit,Amenity.Air_Conditioning,Amenity.CarbonMonoxide_Alarm,Amenity.Hot_Tub,Amenity.First_Aid_Kit,Amenity.Air_Conditioning,Amenity.CarbonMonoxide_Alarm,Amenity.Hot_Tub,Amenity.First_Aid_Kit]
//    let amenitiesList = [Amenity.Air_Conditioning]
    lazy var amenitiesView = AmenitiesView(frame: CGRect.zero, amenitiesList: amenitiesList)
    
    
    //sample review list
    let reviewList = [Review(userID: "UD101", userName: "Rahul", review: " this is nice course fd dfdvd v dfv df vdfv d v d vd  vdfd d d v d v dfv d vd cf d fd  d f this is nice course fd dfdvd v dfv df vdfv d v d vd  vdfd d d v d v dfv d vd cf d fd  d f this is nice course fd dfdvd v dfv df vdfv d v d vd  vdfd d d v d v dfv d vd cf d fd  d f this is nice course fd dfdvd v dfv df vdfv d v d vd  vdfd d d v d v dfv d vd cf d fd  d f this is nice course fd dfdvd v dfv df vdfv d v d vd  vdfd d d v d v dfv d vd cf d fd  d f v "),Review(userID: "UD101", userName: "Sujatha", review: "this is nice course"),Review(userID: "UD101", userName: "Susi", review: "this is nice course")]
    
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
    
    lazy var wishListButton = {
       
        let button = UIButton(type: .custom)
        let image = UIImage(systemName: "heart")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .systemPink
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()

    
    init(imageList : [UIImage]){
        self.placeImagesCollectionView = ImagesDisplayCollectionView(imagesList: imageList)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        
        //sample coloring
        footerView.backgroundColor = .systemBackground
        reserveButton.backgroundColor = .systemGray
        contentScrollView.backgroundColor = .systemBackground
        view.backgroundColor = .systemBackground

        view.addSubview(contentScrollView)
        contentScrollView.addSubview(placeImagesCollectionView)
        contentScrollView.addSubview(ratingView)
        contentScrollView.addSubview(reviewView)
        contentScrollView.addSubview(availabiltiyView)
        contentScrollView.addSubview(amenitiesView)
        contentScrollView.addSubview(cancellationPolicyView)
        contentScrollView.addSubview(houseRulesView)
        contentScrollView.addSubview(safetyAndPropertyView)
        view.addSubview(footerView)

        setupScrollView()
        setupAvailabilityView()
        setupAmentiesView()
        setupCancellationPolicyView()
        setupHouseRulesView()
        setupSafetyAndPropertyView()
        setupFooterView()

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
        
        priceLabel.configSecondaryStyle()
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
        availabiltiyView.setupTapAction(currentViewController: self, viewControllerToPresentOnTap: AvailabilityCalenderViewController(districtName: districtName, pricePerDay: pricePerDay, currencyCode: currencyCode){[weak self](fromDate,toDate) in
            self?.fromDate = fromDate
            self?.toDate = toDate
        })
        
        availabiltiyView.contentLabel.text = "choose your dates"
        availabiltiyView.contentLabel.font = .systemFont(ofSize: 15, weight: .light)
       
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

}

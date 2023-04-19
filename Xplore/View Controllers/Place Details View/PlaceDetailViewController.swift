import UIKit

class PlaceDetailViewController: UIViewController {

    let databaseController : PlaceDBController
    
    lazy var placeImagesCollectionView  = ImagesDisplayCollectionView()
    
    lazy var availabiltiyView = AvailabilityDetailView()
    
    lazy var contentScrollView = UIScrollView()
        
    lazy var ratingView = RatingView(frame: CGRect.zero, rating: placeDetails.placeRating)
    
    lazy var titleView = {
        let sectionedView = SectionView(frame: .zero, contentView: descriptionLabel, titleText: "")
        return sectionedView
    }()
    
    lazy var descriptionLabel = {
        let label = UILabel()
        label.configSecondaryRegularStyle()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var locationLabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.configSecondaryStyle()
        
        let sectionedView = SectionView(frame: .zero, contentView: label, titleText: "Destination")
        return sectionedView
    }()
    
    lazy var hostLabel = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 3
        let sectionedView = SectionView(frame: .zero, contentView: stackView, titleText: "Hosted By")
        
        return sectionedView
    }()
    
   
    
    lazy var priceLabel = UILabel()
    lazy var reserveButton = {
        let button = UIButton()
        button.tag = 0
        button.backgroundColor = .systemGray
        return button
    }()
    
    
    lazy var reviewView = ReviewView(frame: CGRect.zero, reviewList: placeDetails.reviewDetail,referenceViewController: self)
   
    var placeDetails : TravelPlaceDetail

    
    init(placeDetails :  TravelPlaceDetail,databaseController : PlaceDBController){

        
        self.placeDetails = placeDetails
        self.databaseController = databaseController
        
        super.init(nibName: nil, bundle: nil)
        
        self.placeImagesCollectionView.imageUrls = placeDetails.images
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
        
        

        //sample coloring
        contentScrollView.backgroundColor = .systemBackground
        view.backgroundColor = .systemBackground

        
        view.addSubview(contentScrollView)
        contentScrollView.addSubview(placeImagesCollectionView)
        contentScrollView.addSubview(titleView)
        contentScrollView.addSubview(UIUtils.getSeparator(size: 1))
        contentScrollView.addSubview(locationLabel)
        contentScrollView.addSubview(UIUtils.getSeparator(size: 1))
        contentScrollView.addSubview(hostLabel)
        contentScrollView.addSubview(UIUtils.getSeparator(size: 1))
        contentScrollView.addSubview(ratingView)
        contentScrollView.addSubview(UIUtils.getSeparator(size: 1))
        contentScrollView.addSubview(reviewView)
        contentScrollView.addSubview(UIUtils.getSeparator(size: 1))
        contentScrollView.addSubview(availabiltiyView)
        contentScrollView.addSubview(UIUtils.getSeparator(size: 1))

        setupDetailsLabels()
    
    }

    private func setupDetailsLabels(){
        self.titleView.titleText = self.placeDetails.placeName
        self.titleView.titleView.numberOfLines = 0
        
        descriptionLabel.text = self.placeDetails.description
        
        let locationContentLabel = locationLabel.contentView as! UILabel
        locationContentLabel.text = "\(self.placeDetails.location.address),\n\(self.placeDetails.location.city),\n\(self.placeDetails.location.state), \(self.placeDetails.location.country)."
        
        let hostContentLabel = self.hostLabel.contentView as! UIStackView
        let hostDetail = databaseController.getHostDetail(hostId: self.placeDetails.hostId)
        
        let hostName = UILabel()
        hostName.configSecondaryStyle()
        hostName.text = hostDetail.userName
        
        let hostMobile = UILabel()
        hostMobile.configSecondaryFadedStyle()
        hostMobile.text = "contact : \(hostDetail.mobile)"
        
        let hostEmail = UILabel()
        hostEmail.configSecondaryFadedStyle()
        hostEmail.text = "email : \(hostDetail.email)"
        
        hostContentLabel.addArrangedSubview(hostName)
        hostContentLabel.addArrangedSubview(hostMobile)
        hostContentLabel.addArrangedSubview(hostEmail)
        
    }
    
    
    func setupScrollView(){
        
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
    
   

    

}

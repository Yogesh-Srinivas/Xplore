import UIKit

class PlaceDetailViewController: UIViewController {

    let databaseController : PlaceDBController
    
    lazy var placeImagesCollectionView  = ImagesDisplayCollectionView()
    
    lazy var availabiltiyView = AvailabilityDetailView()
    
    lazy var contentScrollView = UIScrollView()
        
    lazy var ratingView = RatingView(frame: CGRect.zero, rating: placeDetails.placeRating)
    
    lazy var titleLabel = {
        let label = UILabel()
        label.configPrimaryStyle()
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
        let label = UILabel()
        label.numberOfLines = 0
        label.configSecondaryRegularStyle()
        let sectionedView = SectionView(frame: .zero, contentView: label, titleText: "Hosted By")
        
        return sectionedView
    }()
    
    lazy var descriptionLabel = {
        let label = UILabel()
        label.configSemiPrimary()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var priceLabel = UILabel()
    lazy var reserveButton = UIButton()
    
    
    
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


//        setupScrollView()
        setupDetailsLabels()
       

    }

   
    
    private func setupDetailsLabels(){
        self.titleLabel.text = self.placeDetails.placeName
        
        descriptionLabel.text = self.placeDetails.description
        
        let locationContentLabel = locationLabel.contentView as! UILabel
        locationContentLabel.text = "\(self.placeDetails.location.address),\n\(self.placeDetails.location.city),\n\(self.placeDetails.location.state), \(self.placeDetails.location.country)."
        
        let hostContentLabel = self.hostLabel.contentView as! UILabel
        hostContentLabel.text = self.placeDetails.hostId
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

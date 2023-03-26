import UIKit

class PlaceDetailedPageViewController: UIViewController {

    
    lazy var reserveButton = UIButton()
    
    lazy var placeImagesCollectionView = PlaceDetailCardView()
    
    lazy var availabiltiyView = AvailabilityDetailView()
    
    lazy var contentScrollView = UIScrollView()
    
    lazy var ratingView = RatingView(frame: CGRect.zero, rating: 1.45)

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        
        //sample coloring
        reserveButton.backgroundColor = .systemPink
        view.backgroundColor = .white

        view.addSubview(contentScrollView)
        contentScrollView.addSubview(placeImagesCollectionView)
        contentScrollView.addSubview(availabiltiyView)
        contentScrollView.addSubview(ratingView)
        view.addSubview(reserveButton)



        
        setupReserveButton()
        setupPlaceImagesCollectionView()
        setupScrollView()
        setupAvailabilityView()
        setupRatingView()
        
    }

    func setupReserveButton(){
        
        reserveButton.setTitle("Reserve", for: .normal)
        reserveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reserveButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            reserveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            reserveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            reserveButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func setupPlaceImagesCollectionView(){
        placeImagesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            placeImagesCollectionView.topAnchor.constraint(equalTo: contentScrollView.topAnchor),
            placeImagesCollectionView.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor),
            placeImagesCollectionView.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor),
            placeImagesCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            placeImagesCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        placeImagesCollectionView.titleLabel.text = "fsdfd sfds fds ds v"
        placeImagesCollectionView.locationLabel.text = "njdfsdjksnfkjdsf,ijnfsdfsjknkjndsf,njkdvskjnsvkj"
        placeImagesCollectionView.ratingLabel.text = "Rating : 5.0"
        
        placeImagesCollectionView.titleLabel.numberOfLines = 0
        placeImagesCollectionView.titleLabel.sizeToFit()
        placeImagesCollectionView.titleLabel.lineBreakMode = .byTruncatingTail
        placeImagesCollectionView.titleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setupScrollView(){
        
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentScrollView.bottomAnchor.constraint(equalTo: reserveButton.topAnchor)
        ])
    }
    
    func setupAvailabilityView(){
        availabiltiyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            availabiltiyView.topAnchor.constraint(equalTo: ratingView.bottomAnchor),
            availabiltiyView.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor),
            availabiltiyView.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor),
            availabiltiyView.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor),
            availabiltiyView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor,multiplier: 0.1)
        ])
        availabiltiyView.setupTapAction(currentViewController: self, viewControllerToPresentOnTap: AvailabilityCalenderViewController())
        
        
        availabiltiyView.contentLabel.text = "20 jun '22 - 31 Aug '22"
        
        
       
    }
    func setupRatingView(){
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            ratingView.topAnchor.constraint(equalTo: placeImagesCollectionView.bottomAnchor),
            ratingView.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor),
            ratingView.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor),
            ratingView.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.15)
        
        ])
    }

}

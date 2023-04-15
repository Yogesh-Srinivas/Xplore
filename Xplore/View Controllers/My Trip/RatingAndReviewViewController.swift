import UIKit

class RatingAndReviewViewController: UIViewController {
    
    private enum StarButtonState : String{
        case EMPTY
        case HALF
        case FULL
    }
    
    private let databaseController : PlaceDBController
    private let placeId : String
    
    private let fullStarImage = UIImage(systemName: "star.fill")?.withTintColor(.systemYellow,renderingMode: .alwaysOriginal)
    
    private let halfStarImage = UIImage(systemName: "star.leadinghalf.fill")?.withTintColor(.systemYellow,renderingMode: .alwaysOriginal)
    
    private let emptyStarImage = UIImage(systemName: "star")?.withTintColor(.systemYellow,renderingMode: .alwaysOriginal)
    
    private lazy var ratingStarView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        
        if let tintedEmptyStar = emptyStarImage{
            for starCount in 1...5{
                let starButton = getStarButton()
                stack.addArrangedSubview(starButton)
                            
                starButton.accessibilityIdentifier = StarButtonState.EMPTY.rawValue
                starButton.tag = starCount
            }
        }
            
        return stack
    }()
    
    private lazy var ratingView = {
        let sectionedView = SectionView(frame: .zero, contentView: ratingStarView, titleText: "Your Rating \(Constants.RATING_STAR) \(rating)")
        return sectionedView
    }()

    private var rating : Double = 0 {
        didSet{
            ratingView.titleText = "Your Rating \(Constants.RATING_STAR) \(rating)"
            submitButton.isHidden = false
        }
    }
    
    private lazy var reviewTextView = {
        let textView = UITextView()
        textView.configSecondaryStyle()
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 1.5
        textView.layer.cornerRadius = 5
        textView.backgroundColor = .tertiarySystemFill
        textView.showsVerticalScrollIndicator = false
        textView.autocorrectionType = .no
        textView.autocapitalizationType = .none
        textView.textContainerInset = UIEdgeInsets(top: 3, left: 3, bottom: 1, right: 3)
        return textView
    }()
    
    private lazy var submitButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.addBorder()
        button.addTarget(self, action: #selector(submitButtonOnTapAction), for: .touchDown)
        button.isHidden = true
        return button
    }()
    
    private lazy var reviewView = {
        let sectionedView = SectionView(frame: .zero, contentView: reviewTextView, titleText: "Your Review (Optional)")
        return sectionedView
    }()
    
    init(databaseController : PlaceDBController,placeId : String){
        self.databaseController = databaseController
        self.placeId = placeId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setCustomBackground()
        
        view.addSubview(ratingView)
        view.addSubview(reviewView)
        view.addSubview(submitButton)
        
        setupRatingView()
        setupReviewView()
        setupSubmitButton()
    }
    
    private func getStarButton() -> UIButton{
        let starButton = UIButton()
        starButton.setImage(emptyStarImage, for: .normal)
        starButton.contentVerticalAlignment = .fill
        starButton.contentHorizontalAlignment = .fill
        starButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            starButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        starButton.addTarget(self, action: #selector(starButtonOnSingleTapAction(_:)), for: .touchDown)
        return starButton
    }
    
    private func setupRatingView(){
    
        
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ratingView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            ratingView.leadingAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            ratingView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor,multiplier: 0.6),
            ratingView.heightAnchor.constraint(equalTo: ratingView.widthAnchor, multiplier: 0.4)
        ])
    }
    
    private func setupSubmitButton(){
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            submitButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,constant: -10),
            submitButton.leadingAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupReviewView(){
        reviewView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reviewView.topAnchor.constraint(equalTo: ratingView.bottomAnchor,constant: 10),
            reviewView.leadingAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            reviewView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            reviewView.bottomAnchor.constraint(equalTo: submitButton.topAnchor, constant: -30)
        ])
    }
    
        
    @objc private func starButtonOnSingleTapAction(_ sender : UIButton){
        
        switch sender.accessibilityIdentifier{
        case StarButtonState.EMPTY.rawValue:
            
            rating = Double(sender.tag) - 0.5
            sender.accessibilityIdentifier = StarButtonState.HALF.rawValue
            sender.setImage(halfStarImage, for: .normal)
            
        case StarButtonState.HALF.rawValue:
            
            rating = Double(sender.tag)
            sender.accessibilityIdentifier = StarButtonState.FULL.rawValue
            sender.setImage(fullStarImage, for: .normal)
            
        case StarButtonState.FULL.rawValue:
            rating = Double(sender.tag) - 1
            sender.accessibilityIdentifier = StarButtonState.EMPTY.rawValue
            sender.setImage(emptyStarImage, for: .normal)
            
        default:
            break
        }
        
        
        if sender.tag > 1{
            for starCount in 0..<sender.tag-1{
                if let ratingViewSubStar = ratingStarView.subviews[starCount] as? UIButton{
                    ratingViewSubStar.setImage(fullStarImage, for: .normal)
                    ratingViewSubStar.accessibilityIdentifier = StarButtonState.FULL.rawValue
                }
            }
        }
        
        if sender.tag < 5{
            for starCount in sender.tag..<5{
                if let ratingViewSubStar = ratingStarView.subviews[starCount] as? UIButton{
                    ratingViewSubStar.setImage(emptyStarImage, for: .normal)
                    ratingViewSubStar.accessibilityIdentifier = StarButtonState.EMPTY.rawValue
                }
            }
        }
    }
    
    @objc private func submitButtonOnTapAction(){
        
        databaseController.addRating(placeId: placeId, rating: rating)
        
        if let reviewText = reviewTextView.text {
            databaseController.addReview(placeId: placeId, review: reviewText)
        }
        
        UIUtils.showAlertMessage(message: "Thank you for taking the time to provide a rating.", viewController: self, durationInSeconds: 1.5)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            self.navigationController?.popViewController(animated: true)
        }
        
    }
}

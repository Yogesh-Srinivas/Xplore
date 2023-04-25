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
        stack.distribution = .fillProportionally
        stack.alignment = .center
        
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
        
    private var ratingTitleLabel = {
        let label = UILabel()
        label.text = "Rate your Experience"
        label.configSemiPrimary()
        return label
    }()
    
    private var ratingDescriptionLabel = {
        let label = UILabel()
        label.text = "How was your experience at this palce?"
        label.configSecondaryFadedStyle()
        return label
    }()

    private var rating : Double = 0 {
        didSet{
           
            submitButton.isEnabled = true
            submitButton.backgroundColor = .systemPink
            submitButton.setTitleColor(.white, for: .normal)
        }
    }
    
    private lazy var reviewTextView = {
        let textView = UITextView()
        textView.configSecondaryStyle()
        textView.layer.borderColor = UIColor.systemGray4.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 5
        textView.backgroundColor = .systemGray6
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
        button.backgroundColor = .systemGray4
        button.addBorder()
        button.addTarget(self, action: #selector(submitButtonOnTapAction), for: .touchDown)
        button.isEnabled = false
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
    
    lazy var contentScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setCustomBackground()
        
        view.addSubview(contentScrollView)
        contentScrollView.addSubview(ratingTitleLabel)
        contentScrollView.addSubview(ratingDescriptionLabel)
        contentScrollView.addSubview(ratingStarView)
        contentScrollView.addSubview(reviewView)
        contentScrollView.addSubview(submitButton)
        
        setupRatingView()
        setupReviewView()
        setupSubmitButton()
        setupScrollView()
    }
    
    
    private func setupScrollView(){
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentScrollView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor)
        ])
        
        contentScrollView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(contentScrollOnTapAction)))
    }
    
    private func getStarButton() -> UIButton{
        let starButton = UIButton()
        starButton.setImage(emptyStarImage, for: .normal)
        starButton.contentVerticalAlignment = .fill
        starButton.contentHorizontalAlignment = .fill
        starButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            starButton.heightAnchor.constraint(equalToConstant: 50),
            starButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        starButton.addTarget(self, action: #selector(starButtonOnSingleTapAction(_:)), for: .touchDown)
        return starButton
    }
    
    private func setupRatingView(){
    
        
        ratingTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ratingTitleLabel.topAnchor.constraint(equalTo: contentScrollView.topAnchor,constant: 5),
            ratingTitleLabel.leadingAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            ratingTitleLabel.trailingAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.trailingAnchor,constant: -20)

        ])
        
        ratingDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ratingDescriptionLabel.topAnchor.constraint(equalTo: ratingTitleLabel.bottomAnchor,constant: 3),
            ratingDescriptionLabel.leadingAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            ratingDescriptionLabel.trailingAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.trailingAnchor,constant: -20)
        ])
        
        ratingStarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ratingStarView.topAnchor.constraint(equalTo: ratingDescriptionLabel.bottomAnchor,constant: 10),
            ratingStarView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    private func setupSubmitButton(){
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            submitButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor,constant: -10),
            submitButton.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor,constant: -10),
            submitButton.leadingAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupReviewView(){
        reviewView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reviewView.topAnchor.constraint(equalTo: ratingStarView.bottomAnchor,constant: 20),
            reviewView.leadingAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            reviewView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            reviewView.bottomAnchor.constraint(equalTo: submitButton.topAnchor, constant: -30),
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
        reviewTextView.resignFirstResponder()
        
        databaseController.addRating(placeId: placeId, rating: rating)
        
        if let reviewText = reviewTextView.text {
            databaseController.addReview(placeId: placeId, review: reviewText)
        }
        
        UIUtils.showAlertMessage(message: "Thank you for taking the time to provide a rating.", viewController: self, durationInSeconds: 1.5)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    @objc private func contentScrollOnTapAction(){
        reviewTextView.resignFirstResponder()
    }
}

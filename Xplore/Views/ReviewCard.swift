import UIKit

class ReviewCard: UICollectionViewCell {
    let profilePicture = UIImageView(frame: CGRect.zero)
    let reviewerNameLabel = UILabel()
    let reviewLabel = UILabel()
    private let reviewLabelButtonWrapper = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemBackground
        self.addSubview(profilePicture)
        self.addSubview(reviewerNameLabel)
        self.addSubview(reviewLabelButtonWrapper)
        reviewLabelButtonWrapper.addSubview(reviewLabel)
        
        setupProfilePicture()
        setupReviewerNameLabel()
        setupReviewLabel()
        setupReviewLabelButtonWrapper()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProfilePicture(){
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profilePicture.topAnchor.constraint(equalTo: self.topAnchor),
            profilePicture.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profilePicture.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.20),
            profilePicture.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.20)
        ])
    }
    
    private func setupReviewerNameLabel(){
        reviewerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            reviewerNameLabel.topAnchor.constraint(equalTo: self.topAnchor),
            reviewerNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            reviewerNameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.80),
            reviewerNameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.20)
        ])
    }
    
    private func setupReviewLabelButtonWrapper(){
        reviewLabelButtonWrapper.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reviewLabelButtonWrapper.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            reviewLabelButtonWrapper.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            reviewLabelButtonWrapper.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            reviewLabelButtonWrapper.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.80)
        ])
        
        reviewLabelButtonWrapper.contentVerticalAlignment = .top
        reviewLabelButtonWrapper.contentHorizontalAlignment = .left
        reviewLabelButtonWrapper.isUserInteractionEnabled = false
    }
    private func setupReviewLabel(){
        reviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            reviewLabel.trailingAnchor.constraint(equalTo: reviewLabelButtonWrapper.trailingAnchor),
            reviewLabel.leadingAnchor.constraint(equalTo: reviewLabelButtonWrapper.leadingAnchor),
            reviewLabel.topAnchor.constraint(equalTo: reviewLabelButtonWrapper.topAnchor)
        ])
        
        reviewLabel.numberOfLines = 9
        reviewLabel.lineBreakMode = .byCharWrapping
    }
}

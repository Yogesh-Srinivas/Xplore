import UIKit

class ReviewCard: UICollectionViewCell {
    let reviewerNameLabel = UILabel()
    let reviewLabel = UITextView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemBackground
        self.addSubview(reviewerNameLabel)
        self.addSubview(reviewLabel)
    
        setupReviewerNameLabel()
        setupReviewLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   

    private func setupReviewerNameLabel(){
        reviewerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            reviewerNameLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 5),
            reviewerNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -5),
            reviewerNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 5),
            reviewerNameLabel.bottomAnchor.constraint(equalTo: reviewLabel.topAnchor,constant: -10)
        ])
        
        reviewerNameLabel.configPrimaryRegularStyle()
    }
    
    private func setupReviewLabel(){
        reviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            reviewLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -2),
            reviewLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 2),
            reviewLabel.topAnchor.constraint(equalTo: reviewerNameLabel.bottomAnchor,constant: 10),
            reviewLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -3)
        ])
        
        
        reviewLabel.textAlignment = .justified
        reviewLabel.isUserInteractionEnabled = false
        reviewLabel.configSecondaryRegularStyle()
        
    }
}

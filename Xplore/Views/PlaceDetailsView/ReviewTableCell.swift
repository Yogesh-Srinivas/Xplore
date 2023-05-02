import UIKit

class ReviewTableCell: UITableViewCell {

    let reviewerNameLabel = UILabel()
    let reviewLabel = UITextView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
            reviewerNameLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 15),
            reviewerNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -5),
            reviewerNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            reviewerNameLabel.bottomAnchor.constraint(equalTo: reviewLabel.topAnchor,constant: -10)
        ])
        
        reviewerNameLabel.configSemiPrimary()
        reviewerNameLabel.setContentHuggingPriority(.required, for: .vertical)
        
    }
    
    private func setupReviewLabel(){
        reviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            reviewLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -5),
            reviewLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 5),
            reviewLabel.topAnchor.constraint(equalTo: reviewerNameLabel.bottomAnchor,constant: 10),
            reviewLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -5)
        ])
        
        
        reviewLabel.textAlignment = .natural
        reviewLabel.isUserInteractionEnabled = false
        reviewLabel.isScrollEnabled = false
        reviewLabel.textContainer.lineBreakMode = .byTruncatingTail
        
        reviewLabel.configSecondaryRegularStyle()

    }
    
}

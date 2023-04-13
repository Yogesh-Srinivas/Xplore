import UIKit

class RatingView: UIView {
    
    let headerLabel = UILabel()
    let contentView = UIView()
   
    var rating : Double
    
    init(frame: CGRect,rating : Double) {
        self.rating = rating
        super.init(frame: frame)
        
        self.backgroundColor = .systemBackground
        self.addSubview(headerLabel)
        self.addSubview(contentView)
        setupHeaderLabel()
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHeaderLabel(){
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: contentView.topAnchor,constant: -10)
        ])
        headerLabel.text = "Rating \(Constants.RATING_STAR)\(Constants.BULLETING_POINT)\(rating)"
        
        headerLabel.adjustsFontSizeToFitWidth = true
        headerLabel.configPrimaryStyle()
        
    }
    func setupContentView(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor,constant: 10),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentView.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier : 0.5),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        let fullStarImage = UIImage(systemName: "star.fill")?.withTintColor(.systemYellow,renderingMode: .alwaysOriginal)
        
        let halfStarImage = UIImage(systemName: "star.leadinghalf.fill")?.withTintColor(.systemYellow,renderingMode: .alwaysOriginal)
        
        let emptyStarImage = UIImage(systemName: "star")?.withTintColor(.systemYellow,renderingMode: .alwaysOriginal)
        
        let ratingView = UIStackView()
        ratingView.axis = .horizontal
        ratingView.distribution = .fillEqually
        
        for i in 1...5 {
            if rating >= Double(i) {
                if let tintedStar = fullStarImage{
                    ratingView.addArrangedSubview(UIImageView(image: tintedStar))
                }
            } else if rating > Double(i) - 1 {
                if let tintedHalfStar = halfStarImage {
                    ratingView.addArrangedSubview(UIImageView(image: tintedHalfStar))
                }
            } else {
                if let tintedEmptyStar = emptyStarImage{
                    ratingView.addArrangedSubview(UIImageView(image: tintedEmptyStar))
                }
            }
        }
        
        contentView.addSubview(ratingView)
        
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ratingView.topAnchor.constraint(equalTo: contentView.topAnchor),
            ratingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            ratingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ratingView.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 0.5),
        ])
        
    }
    
}

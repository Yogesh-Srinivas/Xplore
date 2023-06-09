import UIKit

class RatingView: UIView {
    
    let headerLabel = UILabel()
    let contentView = UIView()
    
    let fullStarImage = {
        let image = UIImage(systemName: "star.fill")?.withTintColor(.systemYellow,renderingMode: .alwaysOriginal)
        return image
    }()
    
    let halfStarImage = {
        let image = UIImage(systemName: "star.leadinghalf.fill")?.withTintColor(.systemYellow,renderingMode: .alwaysOriginal)
        return image
    }()
    
    let emptyStarImage = {
        let image = UIImage(systemName: "star")?.withTintColor(.systemYellow,renderingMode: .alwaysOriginal)
        return image
    }()
    
    lazy var ratingView = UIStackView()
   
    var rating : Double
    
    var numberOfRating : Int
    
    init(frame: CGRect,rating : Double,numberOfRating : Int) {
        self.rating = rating
        self.numberOfRating = numberOfRating
        super.init(frame: frame)
        
        self.backgroundColor = .systemBackground
        self.addSubview(headerLabel)
        self.addSubview(contentView)
        contentView.addSubview(ratingView)
        setupHeaderLabel()
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateRatingView(newRating : Double){
        self.rating = newRating
        headerLabel.text = "Rating \(Constants.RATING_STAR) \(rating) (\(numberOfRating)"
        setRatingStars()
    }
    
    func setupHeaderLabel(){
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: contentView.topAnchor,constant: -10)
        ])
        headerLabel.text = "Rating \(Constants.RATING_STAR) \(rating)"
        
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
        
        
        ratingView.axis = .horizontal
        ratingView.distribution = .fillEqually
        
        
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ratingView.topAnchor.constraint(equalTo: contentView.topAnchor),
            ratingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            ratingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ratingView.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 0.5),
        ])
        
        setRatingStars()
        
    }
    
    private func setRatingStars(){
        for child in ratingView.arrangedSubviews{
            child.removeFromSuperview()
        }
        for i in 1...5 {
            if rating >= Double(i) {
                if let tintedStar = fullStarImage{
                    let fullStarImageView = UIImageView(image: tintedStar)
                    ratingView.addArrangedSubview(fullStarImageView)
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
    }
    
}

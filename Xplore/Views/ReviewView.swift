import UIKit

class ReviewView: UIView {

    let headerLabel = UILabel()
    let contentView = UIView()
//    private var viewControllerToPresentOnTap : UIViewController?
//    private var referenceViewControllerToPresent : UIViewController?
    var rating : Double
    
    init(frame: CGRect,rating : Double) {
        self.rating = rating
        super.init(frame: frame)

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
            headerLabel.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier : 0.5),
        ])
        headerLabel.text = "Review"
        headerLabel.adjustsFontSizeToFitWidth = true
        headerLabel.font = .boldSystemFont(ofSize: 20)
       
    }
    func setupContentView(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentView.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier : 0.5),
        ])
            
        let fullStarImage = UIImage(systemName: "star.fill")
        let halfStarImage = UIImage(systemName: "star.leadinghalf.fill")
        let emptyStarImage = UIImage(systemName: "star")

        let ratingView = UIStackView()
        ratingView.axis = .horizontal
        ratingView.distribution = .fillEqually

        for i in 1...5 {
            if rating >= Double(i) {
                ratingView.addArrangedSubview(UIImageView(image: fullStarImage))
            } else if rating > Double(i) - 1 {
                ratingView.addArrangedSubview(UIImageView(image: halfStarImage))
            } else {
                ratingView.addArrangedSubview(UIImageView(image: emptyStarImage))
            }
        }
        
        contentView.addSubview(ratingView)
        
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ratingView.topAnchor.constraint(equalTo: contentView.topAnchor),
            ratingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            ratingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ratingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
        
    }
    
}

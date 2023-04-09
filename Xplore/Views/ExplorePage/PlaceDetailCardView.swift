import UIKit

class PlaceDetailCardView: UITableViewCell {
    
    static let reuseIdentifier = "PlaceDetailCardView"
    
    var imagesCollectionView : ImagesDisplayCollectionView
    
    let wishListButton = {
       
        let button = UIButton(type: .custom)
        let image = UIImage(systemName: "heart")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .systemPink
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()
    
        
    let titleCardView = UILabel()
    let locationCardView = UILabel()
    let ratingCard = UILabel()
    let priceLabelButton = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        self.imagesCollectionView = ImagesDisplayCollectionView()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(imagesCollectionView)
        contentView.addSubview(ratingCard)
        contentView.addSubview(titleCardView)
        contentView.addSubview(locationCardView)
        contentView.addSubview(priceLabelButton)
        
        setupCellView()
        
        contentView.addSubview(wishListButton)
        setupWishButton()
    }
    
    
    func addImages(imageUrls : [String]){
        self.imagesCollectionView.imageUrls = imageUrls
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellView(){
        for childIndex in 0..<contentView.subviews.count{
            contentView.subviews[childIndex].translatesAutoresizingMaskIntoConstraints = false

            switch childIndex{
            case 0:
                NSLayoutConstraint.activate([
                contentView.subviews[childIndex].topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
                contentView.subviews[childIndex].leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5),
                contentView.subviews[childIndex].trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5),
                contentView.subviews[childIndex].bottomAnchor.constraint(equalTo:  contentView.subviews[childIndex+1].topAnchor,constant: -10),
                contentView.subviews[childIndex].heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.3)

                ])

            case contentView.subviews.count - 1:
                NSLayoutConstraint.activate([
                    contentView.subviews[childIndex].topAnchor.constraint(equalTo: contentView.subviews[childIndex-1].bottomAnchor,constant: 10),
                contentView.subviews[childIndex].bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10),
                contentView.subviews[childIndex].leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20)
              
                ])
                
            default:
                NSLayoutConstraint.activate([
                    contentView.subviews[childIndex].topAnchor.constraint(equalTo: contentView.subviews[childIndex-1].bottomAnchor,constant: 10),
                contentView.subviews[childIndex].leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
                contentView.subviews[childIndex].trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20)
                ])
            }
            
            priceLabelButton.titleLabel?.tintColor = .label
            imagesCollectionView.layer.cornerRadius = 20
        }
        
                
    }
    
    private func setupWishButton(){
        wishListButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wishListButton.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 15),
            wishListButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -25),
            wishListButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.08),
            wishListButton.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.06),
     
        ])
    }

    

}

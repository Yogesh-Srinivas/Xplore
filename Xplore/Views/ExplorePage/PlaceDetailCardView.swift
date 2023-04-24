import UIKit

class PlaceDetailCardView: UITableViewCell {
    
    static let reuseIdentifier = "PlaceDetailCardView"
    
    var row : Int = -1
        
    var databaseController : PlaceDBController = DatabaseController.shared
    
//    private var imagesCollectionView : ImagesDisplayCollectionView
    
    var placeImage = UIImage(named: "loadingImage")
    
    lazy var placeImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = placeImage
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    let wishListButton = {
        let button = UIButton()
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()
    
        
    let titleCardView = UILabel()
    let locationCardView = UILabel()
    let ratingCard = UILabel()
    let priceLabelButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        return button
    }()
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
//        self.imagesCollectionView = ImagesDisplayCollectionView()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        contentView.addSubview(imagesCollectionView)
        contentView.addSubview(placeImageView)
        contentView.addSubview(titleCardView)
        contentView.addSubview(locationCardView)
        contentView.addSubview(priceLabelButton)
        contentView.addSubview(ratingCard)

        
        setupCellView()
        
        contentView.addSubview(wishListButton)
        setupWishButton()
        
    }
    
    
//    func addImages(imageUrls : [String]){
//        self.imagesCollectionView.imageUrls = imageUrls
//    }
    
    
    
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
                contentView.subviews[childIndex].heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.35)

                ])

            case contentView.subviews.count - 2:
                NSLayoutConstraint.activate([
                    contentView.subviews[childIndex].topAnchor.constraint(equalTo: contentView.subviews[childIndex-1].bottomAnchor,constant: 3),
                contentView.subviews[childIndex].bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -25),
                contentView.subviews[childIndex].leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20)
              
                ])
                
            case contentView.subviews.count - 1:
                NSLayoutConstraint.activate([
                    contentView.subviews[childIndex].topAnchor.constraint(equalTo: contentView.subviews[childIndex-2].bottomAnchor,constant: 3),
                contentView.subviews[childIndex].bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -25),
                contentView.subviews[childIndex].trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20)
              
                ])
                
            default:
                NSLayoutConstraint.activate([
                    contentView.subviews[childIndex].topAnchor.constraint(equalTo: contentView.subviews[childIndex-1].bottomAnchor,constant: 10),
                contentView.subviews[childIndex].leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
                contentView.subviews[childIndex].trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20)
                ])
            }
            
//            imagesCollectionView.layer.cornerRadius = 20
        }
        
                
    }
    
    private func setupWishButton(){
        wishListButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wishListButton.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 15),
            wishListButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -25),
            wishListButton.widthAnchor.constraint(equalToConstant: 30),
            wishListButton.heightAnchor.constraint(equalToConstant: 25),
     
        ])
    }
}


extension PlaceDetailCardView{
    override func prepareForReuse() {
        super.prepareForReuse()
        
        placeImageView.image = UIImage(named: "loadingImage")
        
    }
}

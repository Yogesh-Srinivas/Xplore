import UIKit

class PlaceDetailCardView : UICollectionViewCell {
    
    let placeImagesView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    let placeDetailsView = UIView()
    let wishListButton = UIButton()
    let ratingLabel = UILabel()
    let locationLabel = UILabel()
    let titleLabel = UILabel()
    let priceButton = UIButton(type: .system)
    private let pageControl = UIPageControl()
    var placeImagesViewClickHandler : (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(placeImagesView)
        self.addSubview(placeDetailsView)
        setupPlaceImagesView()
        setupPlaceDetailsView()
    }
    
    private func setupPlaceImagesView(){
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        placeImagesView.collectionViewLayout = layout
        placeImagesView.dataSource = self
        placeImagesView.delegate = self
        placeImagesView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")
        placeImagesView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(placeImageViewTapped)))

        placeImagesView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            placeImagesView.topAnchor.constraint(equalTo: self.topAnchor),
            placeImagesView.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier: 0.64),
            placeImagesView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            placeImagesView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        
        //Paging
        placeImagesView.isPagingEnabled = true
        
       
        
    }
    private func setupPlaceDetailsView(){
        
        
        wishListButton.setImage(UIImage(systemName: "heart"), for: .normal)
        
    
        placeDetailsView.translatesAutoresizingMaskIntoConstraints = false
        wishListButton.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceButton.translatesAutoresizingMaskIntoConstraints = false
        
        placeDetailsView.addSubview(wishListButton)
        placeDetailsView.addSubview(ratingLabel)
        placeDetailsView.addSubview(locationLabel)
        placeDetailsView.addSubview(titleLabel)
        placeDetailsView.addSubview(priceButton)
        
        NSLayoutConstraint.activate([
            placeDetailsView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            placeDetailsView.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier: 0.36),
            placeDetailsView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            placeDetailsView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            wishListButton.topAnchor.constraint(equalTo: placeDetailsView.topAnchor),
            wishListButton.leadingAnchor.constraint(equalTo: placeDetailsView.leadingAnchor),
            wishListButton.heightAnchor.constraint(equalTo: placeDetailsView.heightAnchor, multiplier: 0.25),
            wishListButton.widthAnchor.constraint(equalTo: placeDetailsView.heightAnchor, multiplier: 0.25)
        ])
        
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: placeDetailsView.topAnchor),
            ratingLabel.leadingAnchor.constraint(equalTo: wishListButton.trailingAnchor),
            ratingLabel.trailingAnchor.constraint(equalTo: placeDetailsView.trailingAnchor),
            ratingLabel.heightAnchor.constraint(equalTo: placeDetailsView.heightAnchor, multiplier: 0.25)
        ])
        
        
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: wishListButton.bottomAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: placeDetailsView.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: placeDetailsView.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalTo: placeDetailsView.heightAnchor, multiplier: 0.25)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: placeDetailsView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: placeDetailsView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalTo: placeDetailsView.heightAnchor, multiplier: 0.25)
        ])
        
        NSLayoutConstraint.activate([
            priceButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            priceButton.leadingAnchor.constraint(equalTo: placeDetailsView.leadingAnchor),
            priceButton.heightAnchor.constraint(equalTo: placeDetailsView.heightAnchor, multiplier: 0.25),
        ])
    }
    
    
    @objc private func placeImageViewTapped(){
        placeImagesViewClickHandler?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension PlaceDetailCardView : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = placeImagesView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as UICollectionViewCell
        let image = UIImageView(image: UIImage(systemName: "bell"))
        image.backgroundColor = .purple
        
        cell.contentView.addSubview(image)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: cell.topAnchor),
            image.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
            image.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
            image.centerXAnchor.constraint(equalTo: cell.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: cell.centerYAnchor)

        ])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.placeImagesView.frame.width, height: self.placeImagesView.frame.height)
    }
}

import UIKit

class ReviewView: UIView {

    lazy var titleLabel = UILabel()
    
    lazy var reviewCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let uiCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        return uiCollectionView
    }()
    
    var reviewList : [Review]
    
    init(frame: CGRect,reviewList : [Review]) {
        self.reviewList = reviewList
        super.init(frame: frame)

        self.addSubview(titleLabel)
        self.addSubview(reviewCollectionView)
        self.backgroundColor = .systemBackground
        setupTitleLabel()
        setupRatingCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTitleLabel(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: reviewCollectionView.topAnchor,constant: -10)
        ])
        titleLabel.text = "Reviews"
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.configPrimaryStyle()
       
    }
    func setupRatingCollectionView(){
        reviewCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reviewCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            reviewCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            reviewCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            reviewCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 10),
            reviewCollectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.2)
        ])
        
        reviewCollectionView.register(ReviewCard.self, forCellWithReuseIdentifier: "ReviewCard")
        reviewCollectionView.delegate = self
        reviewCollectionView.dataSource = self
        
        reviewCollectionView.showsHorizontalScrollIndicator = false
        reviewCollectionView.showsVerticalScrollIndicator = false
        
    }
    
}


extension ReviewView : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviewList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = reviewCollectionView.dequeueReusableCell(withReuseIdentifier: "ReviewCard", for: indexPath) as! ReviewCard
        
      
        cell.reviewerNameLabel.text = reviewList[indexPath.row].userName
        
        cell.reviewLabel.text = "        " + reviewList[indexPath.row].review
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.reviewCollectionView.frame.height, height: self.reviewCollectionView.frame.height)
    }
    
    
}

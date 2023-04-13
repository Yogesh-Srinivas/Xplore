import UIKit

final class ReviewView: UIView {

    private lazy var titleLabel = UILabel()
    
    private lazy var showAllButton = {
        let button = UIButton()
        button.setTitle("Show All \(reviewList.count) reviews", for: .normal)
        button.underline()
        button.setTitleColor(.label, for: .normal)
        button.addBorder()
        
        button.addTarget(self, action: #selector(showAllReviewAction), for: .touchDown)
        return button
    }()
    
    
    private lazy var reviewCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let uiCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        return uiCollectionView
    }()
    
    private let reviewList : [Review]
    
    private let referenceViewController : UIViewController
    
    init(frame: CGRect,reviewList : [Review],referenceViewController : UIViewController) {
        self.reviewList = reviewList
        self.referenceViewController = referenceViewController
        
        super.init(frame: frame)

        self.addSubview(titleLabel)
        self.addSubview(reviewCollectionView)
        self.addSubview(showAllButton)
        
        self.backgroundColor = .systemBackground
        setupTitleLabel()
        setupRatingCollectionView()
        setupShowAllButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTitleLabel(){
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
    private func setupRatingCollectionView(){
        reviewCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reviewCollectionView.bottomAnchor.constraint(equalTo: showAllButton.topAnchor,constant: -10),
            reviewCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            reviewCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            reviewCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 10),
            reviewCollectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.3)
        ])
        
        reviewCollectionView.register(ReviewCard.self, forCellWithReuseIdentifier: "ReviewCard")
        reviewCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ShowAllButton")
        reviewCollectionView.delegate = self
        reviewCollectionView.dataSource = self
        
        reviewCollectionView.showsHorizontalScrollIndicator = false
        reviewCollectionView.showsVerticalScrollIndicator = false
        
    }
    
    private func setupShowAllButton(){
        showAllButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            showAllButton.topAnchor.constraint(equalTo: reviewCollectionView.bottomAnchor,constant: 10),
            showAllButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            showAllButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
            showAllButton.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -10),
            showAllButton.heightAnchor.constraint(equalToConstant: showAllButton.intrinsicContentSize.height + 10)
        ])
        
    }
    
    private func addShowAllLabelToCell(cell : UICollectionViewCell){
        
        let viewAllLabel = UILabel()
        viewAllLabel.text = "Show All \(reviewList.count) Reviews"
        viewAllLabel.underline()
        viewAllLabel.configSecondaryRegularStyle()
       
        
        cell.contentView.addSubview(viewAllLabel)
        
        viewAllLabel.translatesAutoresizingMaskIntoConstraints = false

        viewAllLabel.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor).isActive = true
        viewAllLabel.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = true
        
        
    }
    
    @objc private func showAllReviewAction(){
        referenceViewController.navigationController?.pushViewController(
            ReviewPageViewController(reviewList: reviewList), animated: true)
    }
    
}


extension ReviewView : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min(6,reviewList.count + 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == min(5,reviewList.count){
            let cell = reviewCollectionView.dequeueReusableCell(withReuseIdentifier: "ShowAllButton", for: indexPath)
            addShowAllLabelToCell(cell: cell)
            
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 10

            return cell
        }
        
        let cell = reviewCollectionView.dequeueReusableCell(withReuseIdentifier: "ReviewCard", for: indexPath) as! ReviewCard
        
      
        cell.reviewerNameLabel.text = reviewList[indexPath.row].userName
        
        cell.reviewLabel.text = reviewList[indexPath.row].review
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.reviewCollectionView.frame.height, height: self.reviewCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 5{
            showAllReviewAction()
        }
    }
    
}

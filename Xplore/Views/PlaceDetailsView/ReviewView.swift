import UIKit

final class ReviewView: UIView {

    private lazy var titleLabel = UILabel()
    
    private lazy var showAllButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.addBorder()
        
        button.addTarget(self, action: #selector(showAllReviewAction), for: .touchDown)
        return button
    }()
    
    
    private lazy var reviewCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let uiCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        uiCollectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return uiCollectionView
    }()
    
    private var reviewList : [Review]
    
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
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
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
            reviewCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 2),
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
            showAllButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            showAllButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            showAllButton.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -10),
            showAllButton.heightAnchor.constraint(equalToConstant: showAllButton.intrinsicContentSize.height + 10)
        ])
        
        showAllButton.setTitle("Show All \(reviewList.count) Reviews", for: .normal)
        
    }
    
    private func addShowAllLabelToCell(cell : UICollectionViewCell){
        
        let viewAllLabel = UILabel()
        viewAllLabel.text = "Show All \(reviewList.count) Reviews"
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
    
    func updateReviewList(updatedReviewList : [Review]){
        reviewList = updatedReviewList
        
        showAllButton.setTitle("Show All \(updatedReviewList.count) reviews", for: .normal)
        
        reviewCollectionView.reloadData()
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
        
        let reviewerName = reviewList[indexPath.row].userID == GeneralUtils.getUserId() ? "You" : reviewList[indexPath.row].userName
        
        cell.reviewerNameLabel.text = reviewerName
        
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
        
        if indexPath.row == min(5,reviewList.count){
            showAllReviewAction()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

   
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {

            let minimumInteritemSpacing : CGFloat = 10

           if !decelerate {
               let index = Int(round(scrollView.contentOffset.x / (self.reviewCollectionView.frame.height + minimumInteritemSpacing)))

               let indexPath = IndexPath(item: index, section: 0)


               reviewCollectionView.scrollToItem(
                    at: indexPath,
                    at: .left,
                    animated: true
               )
           }
       }

       
       func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
           
           let minimumInteritemSpacing : CGFloat = 10
           
           var index = Int(round(scrollView.contentOffset.x / (self.reviewCollectionView.frame.height + minimumInteritemSpacing)))
           
           
           var scrollPosition : UICollectionView.ScrollPosition = .left
           
           let reviewListCount = min(6,reviewList.count + 1)
           
           
           if index == reviewListCount - 2 && index != 0{
               index += 1
               scrollPosition = .right
           }
           
           let indexPath = IndexPath(item: index, section: 0)
           reviewCollectionView.scrollToItem(
                at: indexPath,
                at: scrollPosition,
                animated: true
           )
       }
    
}

import UIKit

class ImageCollectionWithPageControl: UIView {

    
    lazy var pageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .systemPink
        pageControl.pageIndicatorTintColor = .systemGray2
        return pageControl
    }()
    
    lazy var placeImagesCollectionView  = ImagesDisplayCollectionView()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(placeImagesCollectionView)
        setupCollectionView()
        
        self.addSubview(pageControl)
        setupPageControl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPageControl(){
        pageControl.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            pageControl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5)
        ])
    }
    
    private func setupCollectionView(){
        placeImagesCollectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            placeImagesCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            placeImagesCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            placeImagesCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            placeImagesCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        placeImagesCollectionView.setPageControlAction{
            [weak self](row) in
            self?.pageControl.currentPage = row
        }
    }
    
}

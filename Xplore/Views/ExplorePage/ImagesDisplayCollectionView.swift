import UIKit

class ImagesDisplayCollectionView: UICollectionView {
        
    var imageUrls : [String]  = []
    var images : [UIImage?] = []
    var databaseController : FetchableImage!
    var pageControlAction : ((Int)->())?
    let imgaeView = UIImageView(image: UIImage(systemName: "heart"))
    
    init() {
      
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        databaseController = DatabaseController.shared 
        
        self.dataSource = self
        self.delegate = self

        self.register(CustomImageCell.self, forCellWithReuseIdentifier: "ImagesCollectionCell")
        self.isPagingEnabled = true
        self.showsHorizontalScrollIndicator = false
        
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPageControlAction(pageControlAction : @escaping (Int)->()){
        self.pageControlAction = pageControlAction
    }
    
}

extension ImagesDisplayCollectionView : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImagesCollectionCell", for: indexPath) as! CustomImageCell
       
        if images.count < imageUrls.count {
            images.append(UIImage(named: "loadingImage"))
        }
        
        if let image = images[indexPath.row]{
            cell.setupImageView(image: image)
        }
       
        DispatchQueue.global(qos: .userInteractive).async {[weak self] in
            
            if let weakSelf = self{
                
                weakSelf.databaseController.fetchImage(from: weakSelf.imageUrls[indexPath.row]){
                    [weak cell](data) in
                    
                    guard let data = data else{return}
                    let image = UIImage(data: data)
                    
                    DispatchQueue.main.async {
                        cell?.imageToDisplay.image = image
                        weakSelf.images[indexPath.row] = image
                    }
                }
                
            }
        }
           
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(
            width: self.frame.width,
            height:self.frame.height
        )
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page : Int = Int(round(scrollView.contentOffset.x / self.frame.width))

        pageControlAction?(page)
    }
   
    
}


class CustomImageCell : UICollectionViewCell{

    var imageUrl : String?

    lazy var imageToDisplay = UIImageView(
        image : UIImage(named: "loadingImage")
    )

    func setupImageView(image : UIImage){

        imageToDisplay.clipsToBounds = true
        imageToDisplay.contentMode = .scaleToFill

        self.contentView.addSubview(imageToDisplay)

        imageToDisplay.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageToDisplay.topAnchor.constraint(equalTo: self.topAnchor),
            imageToDisplay.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageToDisplay.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageToDisplay.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        imageToDisplay.image =  image
    }

}


import UIKit

class ImagesDisplayCollectionView: UICollectionView {
    
    var imagesList : [UIImage]
    
    init(imagesList : [UIImage]) {
        self.imagesList = imagesList
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0

        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.dataSource = self
        self.delegate = self
        self.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ImagesCollectionCell")
        self.isPagingEnabled = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ImagesDisplayCollectionView : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imagesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImagesCollectionCell", for: indexPath)
        
        let imageToDisplay = UIImageView(
            image: imagesList[indexPath.row]
        )
        
        imageToDisplay.clipsToBounds = true
        imageToDisplay.contentMode = .scaleAspectFill
        
        cell.contentView.addSubview(imageToDisplay)
                
        imageToDisplay.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageToDisplay.topAnchor.constraint(equalTo: cell.topAnchor),
            imageToDisplay.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
            imageToDisplay.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
            imageToDisplay.trailingAnchor.constraint(equalTo: cell.trailingAnchor)
        ])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(
            width: self.frame.width,
            height:self.frame.height
        )
    }
    

    
}

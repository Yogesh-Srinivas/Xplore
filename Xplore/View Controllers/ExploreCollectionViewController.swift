import UIKit
import Foundation

class ExploreViewController : UIViewController {
    lazy var placeDetailCollectionView : UICollectionView = {
        let uiCollectionViewLayout = UICollectionViewFlowLayout()
        let uiCollectionView = UICollectionView(frame: CGRect(), collectionViewLayout: uiCollectionViewLayout)
        return uiCollectionView
    }()
    
    lazy var primaryPlaceDetailsList : [TravelPlaceDetail] = []
    lazy var secondaryPlaceDetailsList : [TravelPlaceDetail] = DataHold.travelPlaceDetails
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        placeDetailCollectionView.delegate = self
        placeDetailCollectionView.dataSource = self
        placeDetailCollectionView.frame = view.bounds
        placeDetailCollectionView.register(PlaceDetailCardView.self, forCellWithReuseIdentifier: "placeDetailCell")
        view.addSubview(placeDetailCollectionView)
    }
    

}

extension ExploreViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return secondaryPlaceDetailsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = placeDetailCollectionView.dequeueReusableCell(withReuseIdentifier: "placeDetailCell", for: indexPath) as! PlaceDetailCardView
        
        let placeDetail = self.secondaryPlaceDetailsList[indexPath.row]
        
        cell.titleLabel.text = placeDetail.placeName
        cell.locationLabel.text = placeDetail.location.address
        cell.ratingLabel.text = " Rating \(placeDetail.rating.count)"
        cell.priceButton.setTitle("\(placeDetail.price.pricePerNight )", for: .normal)
        
    
        cell.placeImagesViewClickHandler = { [weak self] in
            self?.present(UINavigationController(rootViewController: PlaceDetailedPageViewController()), animated: true)
        }
        return cell
               
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width) - 16, height: (view.frame.height) * 0.7)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8)
    }
    
}

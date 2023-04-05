import Foundation
import UIKit

final class DatabaseController : ExploreDBController{
    let databaseOperationDelegate : DatabaseOperationDelegate
    
    init(){
        self.databaseOperationDelegate = DatabaseOperation.shared
        
        initializeDatabase()
    }
    
    func initializeDatabase(){
        
        databaseOperationDelegate.initializeDatabase()
        databaseOperationDelegate.loadUserDetailData(DataHold.userDetails)
        databaseOperationDelegate.loadTravelPlaceDetailData(DataHold.travelPlaceDetails)
    }
    
    func getAllPlaceDetail() -> [TravelPlaceDetail]{
        databaseOperationDelegate.getAllPlacesDetails()
    }
    
    
    func addToWishList(placeId : String){
        databaseOperationDelegate.addToWishList(placeId: placeId, userId: GeneralUtils.getUserId())
    }
    
    func removeFromWishList(placeId : String){
        databaseOperationDelegate.removeFromWishList(placeId: placeId, userId: GeneralUtils.getUserId())
    }
    
//    func getImages(placeId : String) -> [UIImage]{
//        var imagesList : [UIImage] = []
//        
//        if let imageUrls = DataHold.getImagesList(placeId: placeId){
//        }
//        
//        return []
//    }
//    
//    func getImageFromUrl(){
//        DispatchQueue.global().async { [placeId] in
//            for url in imageUrls{
//                if let imageUrl = URL(string: url){
//                    if let imageData = try? Data(contentsOf: imageUrl){
//                        let uniqueImageName = GeneralUtils.generateRandomImageName()
//                        let docDir = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//                        let imageDirURL = docDir.appendingPathComponent("\(uniqueImageName).png")
//                        try! imageData.write(to: imageDirURL)
//                        
//                        let imageDirPath = imageDirURL.path
//                    }
//                    
//                }
//            }
//        }
//    }
}

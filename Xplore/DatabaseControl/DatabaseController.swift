import Foundation
import UIKit
import SystemConfiguration

final class DatabaseController : PlaceDBController,FetchableImage{
    
    let databaseOperationDelegate : DatabaseOperationDelegate
    
    static let shared = DatabaseController()
    
    private init(){
        self.databaseOperationDelegate = DatabaseOperation.shared
        
        loadDatabase()
    }
    
    func loadDatabase(){
        
        databaseOperationDelegate.loadUserDetailData(DataHold.userDetails)
        databaseOperationDelegate.loadTravelPlaceDetailData(DataHold.travelPlaceDetails)
    }
    
    func getAllPlaceDetail() -> [TravelPlaceDetail]{
        var allPlaceDetails = databaseOperationDelegate.getAllPlacesDetails()
        
        for detailIndex in 0 ..< allPlaceDetails.count {
            //if placeDetails have no local images, fetch url from remote
            if allPlaceDetails[detailIndex].images.count == 0{
                if let images =  DataHold.getImagesList(placeId: allPlaceDetails[detailIndex].placeId){
                    allPlaceDetails[detailIndex].images = images
                }
            }
        }
        return allPlaceDetails
    }
    
    
    func addToWishList(placeId : String){
        databaseOperationDelegate.addToWishList(placeId: placeId, userId: GeneralUtils.getUserId())
    }
    
    func removeFromWishList(placeId : String){
        databaseOperationDelegate.removeFromWishList(placeId: placeId, userId: GeneralUtils.getUserId())
    }
    
    func isImageAvailableLocal(imageUrl : String) -> Bool{
        databaseOperationDelegate.getImageLocalUrl(imageUrl: imageUrl)
    }
    
    func addImageUrl(imageUrl : String){
        databaseOperationDelegate.addImageUrl(imageUrl : imageUrl)
    }
    
    func fetchImage(
        from imageUrl : String,
        completionHander : @escaping (_ imageData : Data?)->()
    ) {
        

                
        if isImageAvailableLocal(imageUrl: imageUrl), let imageLocalUrl = getImageDirUrl(for: imageUrl),
           FileManager.default.fileExists(atPath: imageLocalUrl.path){
            
            let loadedImageData = FetchableImageHelper.loadLocalImage(from: imageLocalUrl.path)
    
            completionHander(loadedImageData)
            
        }else{
            guard let url = URL(string: imageUrl)
                else {
                    completionHander(nil)
                    return
                }
            
            Task.init {
                if let imageData = await FetchableImageHelper.downloadImage(from: url) {
                    
                    if let imageLocalUrl = self.getImageDirUrl(for: imageUrl){
                        
                        FileManager.default.createFile(atPath: imageLocalUrl.path, contents: imageData)
                        
                        DispatchQueue.main.async {
                            self.addImageUrl(imageUrl: imageUrl)
                        }

    
                    }
                    
                    completionHander(imageData)
                }
            }
            
        }
        
    }
    
    
    func getImageDirUrl(for imageUrl : String) -> URL? {
        

        let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

        guard let imageName = FetchableImageHelper.getImageName(from: imageUrl) else{return nil}
        
        let imageDirURL = docDir.appendingPathComponent(imageName)
                
        return imageDirURL
        
    }
        
}

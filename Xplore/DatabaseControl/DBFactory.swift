import UIKit

final class DBFactory{
    static func getPlaceDatabaseController() -> PlaceDBController{
        return DatabaseController.shared
    }
    
    static func getDatabaseController(imageCollectionView : ImagesDisplayCollectionView) -> FetchableImage {
        return DatabaseController.shared
    }
}

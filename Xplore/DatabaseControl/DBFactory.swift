import UIKit

final class DBFactory{
    static func getExploreDatabaseController() -> ExploreDBController{
        return DatabaseController.shared
    }
    
    static func getDatabaseController(imageCollectionView : ImagesDisplayCollectionView) -> FetchableImage {
        return DatabaseController.shared
    }
}

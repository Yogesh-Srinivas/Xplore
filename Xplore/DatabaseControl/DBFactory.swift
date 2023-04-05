import UIKit

final class DBFactory{
    static func getExploreDatabaseController() -> ExploreDBController{
        return DatabaseController()
    }
    
}

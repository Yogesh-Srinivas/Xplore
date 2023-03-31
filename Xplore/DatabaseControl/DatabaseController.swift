import Foundation

class DatabaseController{
    let databaseOperationDelegate : DatabaseOperation
    
    init(){
        self.databaseOperationDelegate = DatabaseOperation.shared
        
        initializeDatabase()
    }
    
    func initializeDatabase(){
        
        databaseOperationDelegate.initializeDatabase()
        databaseOperationDelegate.loadUserDetailData(DataHold.userDetails)
//        databaseOperationDelegate.loadTravelPlaceDetailData(DataHold.travelPlaceDetails)
    }
}

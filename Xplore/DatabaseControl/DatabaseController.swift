import Foundation

final class DatabaseController{
    let databaseOperationDelegate : DatabaseOperation
    
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
}

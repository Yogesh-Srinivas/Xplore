import Foundation

class DatabaseController{
    let databaseOperationDelegate : DatabaseOperationDelegate
    
    init(){
        self.databaseOperationDelegate = DatabaseOperation()
    }
}

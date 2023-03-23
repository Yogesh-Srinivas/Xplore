import Foundation
import SQLite3

class DatabaseOperation : DatabaseOperationDelegate{
    var database : OpaquePointer?
    
    init(){
        database = openDatabase()
    }
    
    func initializeDatabase(){
        createUserDetailTable()
        createTravelPlaceDetailTable()
        createPlaceAmenitiesTable()
        createReviewTable()
        createRatingTable()
        createLocationTable()
        createPricingTable()
        createPlaceAvailabilityTable()
        createBookedTripsTable()
        createWishListTable()
        createCurrencyTable()
        createPlaceImagesTable()
        //this is a comment
    }
    
    private func openDatabase() -> OpaquePointer?{
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("Xplore.sqlite")
        
        print(filePath)
        
        var db: OpaquePointer? = nil
        if sqlite3_open(filePath.path, &db) != SQLITE_OK
        {
            debugPrint("can't open database")
            return nil
        }
        
        return db
    }
    
    private func createUserDetailTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS UserDetail(userId TEXT PRIMARY KEY, userName TEXT NOT NULL, email TEXT NOT NULL, mobile TEXT NOT NULL, password TEXT NOT NULL);"
        
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(database, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) != SQLITE_DONE
            {
                debugPrint("UserDetail Table could not be created.")
            }
            
        }else {
                print("CREATE TABLE statement for User Detail could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    private func createTravelPlaceDetailTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS TravelPlaceDetail(placeId TEXT PRIMARY KEY, placeName TEXT NOT NULL, description TEXT NOT NULL, hostId TEXT NOT NULL, numberOfRooms INTEGER NOT NULL, numberOfBeds INTEGER NOT NULL, numberOfBedrooms INTEGER NOT NULL, numberOfBathrooms INTEGER NOT NULL, numberOfPeopleAccomodate INTEGER NOT NULL, isPlaceAvailable INTEGER DEFAULT 1 NOT NULL);"
        
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(database, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) != SQLITE_DONE
            {
                debugPrint("TravelPlaceDetail Table could not be created.")
            }
            
        }else {
                print("CREATE TABLE statement for TravelPlaceDetail could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
        
    }
    
    private func createPlaceAmenitiesTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS PlaceAmenities(placeId TEXT, amenity TEXT, PRIMARY KEY (placeId, amenity));"
        
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(database, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) != SQLITE_DONE
            {
                debugPrint("PlaceAmenitiesTable Table could not be created.")
            }
            
        }else {
                print("CREATE TABLE statement for PlaceAmenities could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
        
    }
    
    private func createReviewTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS Review(placeId TEXT, userId TEXT, review TEXT NOT NULL, PRIMARY KEY (placeId, userId));"
        
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(database, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) != SQLITE_DONE
            {
                debugPrint("Review Table could not be created.")
            }
            
        }else {
                print("CREATE TABLE statement for Review could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
        
    }
    
    private func createRatingTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS Rating(placeId TEXT, userId TEXT, rating INTEGER NOT NULL, PRIMARY KEY (placeId, userId));"
        
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(database, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) != SQLITE_DONE
            {
                debugPrint("Rating Table could not be created.")
            }
            
        }else {
                print("CREATE TABLE statement for Rating could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
        
    }
    
    private func createLocationTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS Location(placeId TEXT PRIMARY KEY, address TEXT NOT NULL, city TEXT NOT NULL, state TEXT NOT NULL, country INTEGER NOT NULL);"
        
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(database, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) != SQLITE_DONE
            {
                debugPrint("Location Table could not be created.")
            }
            
        }else {
                print("CREATE TABLE statement for Location could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
        
        
    }
    
    private func createPricingTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS Pricing(placeId TEXT PRIMARY KEY, pricePerNight INTEGER NOT NULL, taxPercentage REAL NOT NULL, currencyCode TEXT NOT NULL);"
        
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(database, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) != SQLITE_DONE
            {
                debugPrint("Pricing Table could not be created.")
            }
            
        }else {
                print("CREATE TABLE statement for Pricing could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    private func createPlaceAvailabilityTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS PlaceAvailability(placeId TEXT PRIMARY KEY, bookedDate TEXT NOT NULL);"
        
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(database, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) != SQLITE_DONE
            {
                debugPrint("PlaceAvailability Table could not be created.")
            }
            
        }else {
                print("CREATE TABLE statement for PlaceAvailability could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    private func createBookedTripsTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS BookedTrips(placeId TEXT, userId TEXT, bookedDateFrom TEXT NOT NULL, bookedDateTo TEXT NOT NULL, PRIMARY KEY(placeId, userId));"
        
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(database, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) != SQLITE_DONE
            {
                debugPrint("BookedTrips Table could not be created.")
            }
            
        }else {
                print("CREATE TABLE statement for BookedTrips could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    private func createWishListTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS WishList(placeId TEXT, userId TEXT, PRIMARY KEY (placeId, userId));"
        
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(database, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) != SQLITE_DONE
            {
                debugPrint("WishList Table could not be created.")
            }
            
        }else {
                print("CREATE TABLE statement for WishList could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    private func createCurrencyTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS Currency(currencyName TEXT NOT NULL, currencyCode TEXT PRIMARY KEY, currencyValue REAL NOT NULL);"
        
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(database, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) != SQLITE_DONE
            {
                debugPrint("Currency Table could not be created.")
            }
            
        }else {
                print("CREATE TABLE statement for Currency could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    private func createPlaceImagesTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS PlaceImages(placeId TEXT, imageUrl TEXT, PRIMARY KEY (placeId, imageUrl));"
        
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(database, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) != SQLITE_DONE
            {
                debugPrint("PlaceImages Tabel could not be created.")
            }
            
        }else {
                print("CREATE TABLE statement for PlaceImages could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
}



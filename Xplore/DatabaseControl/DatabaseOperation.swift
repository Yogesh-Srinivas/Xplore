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
    }
    
    private func openDatabase() -> OpaquePointer?{
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("Xplore.sqlite")
                
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
        let createTableString = "CREATE TABLE IF NOT EXISTS Rating(placeId TEXT, userId TEXT, rating REAL NOT NULL, PRIMARY KEY (placeId, userId));"
        
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
        let createTableString = "CREATE TABLE IF NOT EXISTS Location(placeId TEXT PRIMARY KEY, address TEXT NOT NULL, city TEXT NOT NULL, state TEXT NOT NULL, country TEXT NOT NULL);"
        
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
        let createTableString = "CREATE TABLE IF NOT EXISTS BookedTrips(placeId TEXT, userId TEXT, bookedDateFrom TEXT NOT NULL, bookedDateTo TEXT NOT NULL,pricePerNight INTEGER NOT NULL, taxPercentage REAL NOT NULL, currencyCode TEXT NOT NULL,isVisited INTEGER DEFAULT 0,PRIMARY KEY(placeId, userId));"
        
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
    
    
    func loadUserDetailData(_ userDetails : [UserDetail]) {
        let insertStatementString = "INSERT INTO UserDetail(userId,userName,email,mobile,password) VALUES (?,?,?,?,?);"
        var insertStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(database, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            
            for detail in userDetails {
                sqlite3_bind_text(insertStatement, 1, (detail.userId as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 2, (detail.userName as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 3, (detail.email as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, (detail.mobile as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 5, (detail.password as NSString).utf8String, -1, nil)
                
                let result = sqlite3_step(insertStatement)
                if result != SQLITE_DONE {
                    print("Could not insert a row : stmt[ \(insertStatementString) ]")
                }
                sqlite3_reset(insertStatement)
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func loadTravelPlaceDetailData(_ travelPlaceDetail : [TravelPlaceDetail]){
        for detail in travelPlaceDetail {
            let review = detail.review
            let amenities = detail.amenities
            let location = detail.location
            let images = detail.images
            let rating = detail.rating
            let pricing = detail.price
            
            let insertStatementString = "INSERT INTO TravelPlaceDetail(placeId,placeName,description,hostId,numberOfRooms,numberOfBeds,numberOfBedrooms,numberOfBathrooms,numberOfPeopleAccomodate,isPlaceAvailable) VALUES (?,?,?,?,?,?,?,?,?,?);"
            var insertStatement: OpaquePointer? = nil
            
            if sqlite3_prepare_v2(database, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_text(insertStatement, 1, (detail.placeId as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 2, (detail.placeName as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 3, (detail.description as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, (detail.hostId as NSString).utf8String, -1, nil)
                sqlite3_bind_int(insertStatement, 5, Int32(detail.noOfRooms))
                sqlite3_bind_int(insertStatement, 6, Int32(detail.noOfBeds))
                sqlite3_bind_int(insertStatement, 7, Int32(detail.noOfBedRooms))
                sqlite3_bind_int(insertStatement, 8, Int32(detail.noOfBathRooms))
                sqlite3_bind_int(insertStatement, 9, Int32(detail.noOfPeopleAccomodate))
                sqlite3_bind_int(insertStatement, 10, Int32(detail.isAvailable ? 1 : 0))

                let result = sqlite3_step(insertStatement)
                if result != SQLITE_DONE {
                    print("Could not insert a row : stmt[ \(insertStatementString) ]")
                }
                sqlite3_reset(insertStatement)
            } else {
                print("INSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
            
            
            loadReviewDetail(placeId: detail.placeId, reviews: review)
            loadRatingDetail(placeId: detail.placeId, ratings: rating)
            loadAmenitiesDetail(placeId: detail.placeId, amenities: amenities)
            loadLocationDetail(placeId: detail.placeId, location: location)
            loadImageDetail(placeId: detail.placeId, imageUrls: images)
            loadPriceDetail(placeId: detail.placeId, price: pricing)

        }
    }
    
    private func loadReviewDetail(placeId : String ,reviews : [Review]){
        
        for review in reviews{
            let insertStatementString = "INSERT INTO Review(placeId,userId,review) VALUES (?,?,?);"
            var insertStatement: OpaquePointer? = nil
            
            if sqlite3_prepare_v2(database, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_text(insertStatement, 1, (placeId as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 2, (review.userID as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 3, (review.review as NSString).utf8String, -1, nil)
                
                let result = sqlite3_step(insertStatement)
                if result != SQLITE_DONE {
                    print("Could not insert a row : stmt[ \(insertStatementString) ]")
                }
                sqlite3_reset(insertStatement)
                
            } else {
                print("INSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
        }
    }
    private func loadRatingDetail(placeId : String ,ratings : [Rating]){
        for rating in ratings {
            let insertStatementString = "INSERT INTO Rating(placeId,userId,rating) VALUES (?,?,?);"
            var insertStatement: OpaquePointer? = nil
            
            if sqlite3_prepare_v2(database, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_text(insertStatement, 1, (placeId as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 2, (rating.userID as NSString).utf8String, -1, nil)
                sqlite3_bind_double(insertStatement, 3, rating.rating)
                
                
                let result = sqlite3_step(insertStatement)
                if result != SQLITE_DONE {
                    print("Could not insert a row : stmt[ \(insertStatementString) ]")
                }
                sqlite3_reset(insertStatement)
                
            } else {
                print("INSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
        }
        
    }
    
    private func loadAmenitiesDetail(placeId : String ,amenities : [Amenity]){
        for amenity in amenities {
            let insertStatementString = "INSERT INTO PlaceAmenities(placeId,amenity) VALUES (?,?);"
            var insertStatement: OpaquePointer? = nil
            
            if sqlite3_prepare_v2(database, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_text(insertStatement, 1, (placeId as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 2, (amenity.rawValue as NSString).utf8String, -1, nil)
               
                let result = sqlite3_step(insertStatement)
                if result != SQLITE_DONE {
                    print("Could not insert a row : stmt[ \(insertStatementString) ]")
                }
                sqlite3_reset(insertStatement)
                
            } else {
                print("INSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
        }
        
    }
    
    private func loadLocationDetail(placeId : String ,location : Location){
        let insertStatementString = "INSERT INTO Location(placeId,address,city,state,country) VALUES (?,?,?,?,?);"
        
        var insertStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(database, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (placeId as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (location.address as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (location.city as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (location.state as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, (location.country as NSString).utf8String, -1, nil)
            
            let result = sqlite3_step(insertStatement)
            if result != SQLITE_DONE {
                print("Could not insert a row : stmt[ \(insertStatementString) ]")
            }
            sqlite3_reset(insertStatement)
            
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    private func loadPriceDetail(placeId : String, price : Price){
        let insertStatementString = "INSERT INTO Pricing(placeId,pricePerNight,taxPercentage,currencyCode) VALUES (?,?,?,?);"
        
        var insertStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(database, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (placeId as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 2, Int32(price.pricePerNight))
            sqlite3_bind_double(insertStatement, 3, price.taxPercentage)
            sqlite3_bind_text(insertStatement, 4, (price.currencyCode as NSString).utf8String, -1, nil)
            
            let result = sqlite3_step(insertStatement)
            if result != SQLITE_DONE {
                print("Could not insert a row : stmt[ \(insertStatementString) ]")
            }
            sqlite3_reset(insertStatement)
            
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }

    
    private func loadImageDetail(placeId : String ,imageUrls : [String]){
        //TODO: need to upload Images to filemanager
        
    }
}



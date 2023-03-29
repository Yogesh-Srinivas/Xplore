import Foundation
import SQLite3
import UIKit

class DatabaseOperation : DatabaseOperationDelegate{
    var database : OpaquePointer?
    
    static let shared = DatabaseOperation()
    
    private init(){
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
        
        createTable(queryString: createTableString, tableName: "UserDetail")
    }
    
    
    private func createTravelPlaceDetailTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS TravelPlaceDetail(placeId TEXT PRIMARY KEY, placeName TEXT NOT NULL, description TEXT NOT NULL, hostId TEXT NOT NULL, numberOfRooms INTEGER NOT NULL, numberOfBeds INTEGER NOT NULL, numberOfBedrooms INTEGER NOT NULL, numberOfBathrooms INTEGER NOT NULL, numberOfPeopleAccomodate INTEGER NOT NULL, isPlaceAvailable INTEGER DEFAULT 1 NOT NULL);"
        
        createTable(queryString: createTableString, tableName: "TravelPlaceDetail")
        
    }
    
    private func createPlaceAmenitiesTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS PlaceAmenities(placeId TEXT, amenity TEXT, PRIMARY KEY (placeId, amenity));"
        
        createTable(queryString: createTableString, tableName: "PlaceAmenities")
        
    }
    
    private func createReviewTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS Review(placeId TEXT, userId TEXT, review TEXT NOT NULL, PRIMARY KEY (placeId, userId));"
        
        createTable(queryString: createTableString, tableName: "Review")

        
    }
    
    private func createRatingTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS Rating(placeId TEXT, userId TEXT, rating REAL NOT NULL, PRIMARY KEY (placeId, userId));"
        
        createTable(queryString: createTableString, tableName: "Rating")

        
    }
    
    private func createLocationTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS Location(placeId TEXT PRIMARY KEY, address TEXT NOT NULL, city TEXT NOT NULL, state TEXT NOT NULL, country TEXT NOT NULL);"
        
        createTable(queryString: createTableString, tableName: "Location")

        
    }
    
    private func createPricingTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS Pricing(placeId TEXT PRIMARY KEY, pricePerNight INTEGER NOT NULL, taxPercentage REAL NOT NULL, currencyCode TEXT NOT NULL);"
        
        createTable(queryString: createTableString, tableName: "Pricing")

    }
    
    private func createPlaceAvailabilityTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS PlaceAvailability(placeId TEXT PRIMARY KEY, bookedDate TEXT NOT NULL);"
        
        createTable(queryString: createTableString, tableName: "PlaceAvailability")

    }
    
    private func createBookedTripsTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS BookedTrips(placeId TEXT, userId TEXT, bookedDateFrom TEXT NOT NULL, bookedDateTo TEXT NOT NULL,pricePerNight INTEGER NOT NULL, taxPercentage REAL NOT NULL, currencyCode TEXT NOT NULL,isVisited INTEGER DEFAULT 0,PRIMARY KEY(placeId, userId));"
        
        createTable(queryString: createTableString, tableName: "BookedTrips")

    }
    
    private func createWishListTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS WishList(placeId TEXT, userId TEXT, PRIMARY KEY (placeId, userId));"
        
        createTable(queryString: createTableString, tableName: "WishList")

    }
    
    private func createCurrencyTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS Currency(currencyName TEXT NOT NULL, currencyCode TEXT PRIMARY KEY, currencyValue REAL NOT NULL);"
        
        createTable(queryString: createTableString, tableName: "Currency")
    }
    
    private func createPlaceImagesTable(){
        let createTableString = "CREATE TABLE IF NOT EXISTS PlaceImages(placeId TEXT, imageUrl TEXT, PRIMARY KEY (placeId, imageUrl));"
        
        createTable(queryString: createTableString, tableName: "PlaceImages")

    }
    
    private func createTable(queryString : String,tableName : String ){
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(database, queryString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) != SQLITE_DONE
            {
                print("\(tableName) Table could not be created.")
            }
            
        }else {
                print("CREATE TABLE statement for \(tableName) could not be prepared.")
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
            let insertStatementString = "INSERT INTO TravelPlaceDetail(placeId,placeName,description,hostId,numberOfRooms,numberOfBeds,numberOfBedrooms,numberOfBathrooms,numberOfPeopleAccomodate,isPlaceAvailable) VALUES (?,?,?,?,?,?,?,?,?,?);"
            var insertStatement: OpaquePointer? = nil
            
            if sqlite3_prepare_v2(database, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                for detail in travelPlaceDetail {
                    let review = detail.reviewDetail
                    let amenities = detail.amenities
                    let location = detail.location
                    let images = detail.images
                    let rating = detail.rating
                    let pricing = detail.price
                    
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
                    
                    
                    loadReviewDetail(placeId: detail.placeId, reviews: review)
                    loadRatingDetail(placeId: detail.placeId, ratings: rating)
                    loadAmenitiesDetail(placeId: detail.placeId, amenities: amenities)
                    loadLocationDetail(placeId: detail.placeId, location: location)
                    getImagesFromUrl(placeId: detail.placeId, imageUrls: images)
                    loadPriceDetail(placeId: detail.placeId, price: pricing)

                }
            } else {
                print("INSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
    }
    
    
    private func loadReviewDetail(placeId : String ,reviews : [Review]){
        let insertStatementString = "INSERT INTO Review(placeId,userId,review) VALUES (?,?,?);"
        var insertStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(database, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            for review in reviews{
                sqlite3_bind_text(insertStatement, 1, (placeId as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 2, (review.userID as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 3, (review.review as NSString).utf8String, -1, nil)
                
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
    private func loadRatingDetail(placeId : String ,ratings : [Rating]){
        let insertStatementString = "INSERT INTO Rating(placeId,userId,rating) VALUES (?,?,?);"
        var insertStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(database, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            for rating in ratings {
                sqlite3_bind_text(insertStatement, 1, (placeId as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 2, (rating.userID as NSString).utf8String, -1, nil)
                sqlite3_bind_double(insertStatement, 3, rating.rating)
                
                
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
        
    
    
    private func loadAmenitiesDetail(placeId : String ,amenities : [Amenity]){
        let insertStatementString = "INSERT INTO PlaceAmenities(placeId,amenity) VALUES (?,?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(database, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            for amenity in amenities {
                
                sqlite3_bind_text(insertStatement, 1, (placeId as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 2, (amenity.rawValue as NSString).utf8String, -1, nil)
                
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
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }

    private func loadImageDetail(placeId : String , imageDirPath : String){
        let insertStatementString = "INSERT INTO PlaceImages(placeId,imageUrl) VALUES (?,?);"
        
        var insertStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(database, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (placeId as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (imageDirPath as NSString).utf8String, -1, nil)
            let result = sqlite3_step(insertStatement)
            if result != SQLITE_DONE {
                print("Could not insert a row : stmt[ \(insertStatementString) ]")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
        
    }
    
    private func getImagesFromUrl(placeId : String ,imageUrls : [String]){
        DispatchQueue.global().async { [placeId] in
            for url in imageUrls{
                if let imageUrl = URL(string: url){
                    if let imageData = try? Data(contentsOf: imageUrl){
                        let uniqueImageName = GeneralUtils.generateRandomImageName()
                        let docDir = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                        let imageDirURL = docDir.appendingPathComponent("\(uniqueImageName).png")
                        try! imageData.write(to: imageDirURL)
                        
                        let imageDirPath = imageDirURL.path
                        
                        weak var weakSelf = self
                        weakSelf?.loadImageDetail(placeId: placeId, imageDirPath: imageDirPath)
                                                
                    }
                }
            }
        }
    }
}



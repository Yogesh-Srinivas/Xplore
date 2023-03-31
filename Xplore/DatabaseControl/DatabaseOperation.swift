import Foundation
import UIKit

class DatabaseOperation : DatabaseOperationDelegate{
    
    static let shared = DatabaseOperation()
    
    let xploreSqliteWrapper : SqliteWrapper
    
    private init(){
        xploreSqliteWrapper = SqliteWrapper(for: "Xplore.sqlite")
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
    
    func createUserDetailTable(){
                
        xploreSqliteWrapper.create(tabel: "UserDetail", values: [
            FieldDetail(fieldName: "userId", fieldType: .TEXT, isUnique: false, isNotNull: false, defaultValue: nil),
            FieldDetail(fieldName: "userName", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "email", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "mobile", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "password", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil),
        
        ], primaryKeys: ["userId"])

    }


    private func createTravelPlaceDetailTable(){
        
    xploreSqliteWrapper.create(tabel: "TravelPlaceDetail", values: [
        FieldDetail(fieldName: "placeId", fieldType: .TEXT, isUnique: false, isNotNull: false, defaultValue: nil),
        FieldDetail(fieldName: "placeName", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil),
        FieldDetail(fieldName: "description", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil),
        FieldDetail(fieldName: "hostId", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil),
        FieldDetail(fieldName: "password", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil),
        FieldDetail(fieldName: "numberOfRooms", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil),
        FieldDetail(fieldName: "numberOfBeds", fieldType: .INTEGER, isUnique: false, isNotNull: true, defaultValue: nil),
        FieldDetail(fieldName: "numberOfBedrooms", fieldType: .INTEGER, isUnique: false, isNotNull: true, defaultValue: nil),
        FieldDetail(fieldName: "numberOfBathrooms", fieldType: .INTEGER, isUnique: false, isNotNull: true, defaultValue: nil),
        FieldDetail(fieldName: "numberOfPeopleAccomodate", fieldType: .INTEGER, isUnique: false, isNotNull: true, defaultValue: nil),
        FieldDetail(fieldName: "isPlaceAvailable", fieldType: .INTEGER, isUnique: false, isNotNull: true, defaultValue: "1"),
    
    ], primaryKeys: ["placeId"])


    }

    private func createPlaceAmenitiesTable(){
        xploreSqliteWrapper.create(tabel: "PlaceAmenities", values: [
            FieldDetail(fieldName: "placeId", fieldType: .TEXT, isUnique: false, isNotNull: false, defaultValue: nil),
            FieldDetail(fieldName: "amenity", fieldType: .TEXT, isUnique: false, isNotNull: false, defaultValue: nil)
            ],
            primaryKeys: ["placeId","amenity"]
        )



    }

    private func createReviewTable(){
    xploreSqliteWrapper.create(tabel: "Review", values: [
        FieldDetail(fieldName: "placeId", fieldType: .TEXT, isUnique: false, isNotNull: false, defaultValue: nil),
        FieldDetail(fieldName: "userId", fieldType: .TEXT, isUnique: false, isNotNull: false, defaultValue: nil),
        FieldDetail(fieldName: "review", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil)
        ],
        primaryKeys: ["placeId","userId"]
    )
    }

    private func createRatingTable(){

        xploreSqliteWrapper.create(tabel: "Rating", values: [
            FieldDetail(fieldName: "placeId", fieldType: .TEXT, isUnique: false, isNotNull: false, defaultValue: nil),
            FieldDetail(fieldName: "userId", fieldType: .TEXT, isUnique: false, isNotNull: false, defaultValue: nil),
            FieldDetail(fieldName: "rating", fieldType: .REAL, isUnique: false, isNotNull: true, defaultValue: nil)
            ],
            primaryKeys: ["placeId","userId"]
        )

    }

    private func createLocationTable(){

        xploreSqliteWrapper.create(tabel: "Location",
            values: [
            FieldDetail(fieldName: "placeId", fieldType: .TEXT, isUnique: false, isNotNull: false, defaultValue: nil),
            FieldDetail(fieldName: "address", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "city", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "state", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "country", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil)
            ],
            primaryKeys: ["placeId"]
        )


    }

    private func createPricingTable(){

        xploreSqliteWrapper.create(tabel: "Pricing", values: [
            FieldDetail(fieldName: "placeId", fieldType: .TEXT, isUnique: false, isNotNull: false, defaultValue: nil),
            FieldDetail(fieldName: "pricePerNight", fieldType: .INTEGER, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "taxPercentage", fieldType: .REAL, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "currencyCode", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil)
            ],
            primaryKeys: ["placeId"]
        )

    }

    private func createPlaceAvailabilityTable(){

        xploreSqliteWrapper.create(tabel: "PlaceAvailability", values: [
            FieldDetail(fieldName: "placeId", fieldType: .TEXT, isUnique: false, isNotNull: false, defaultValue: nil),
            FieldDetail(fieldName: "bookedDate", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil)
            ],
            primaryKeys: ["placeId"]
        )
    }

    private func createBookedTripsTable(){

        xploreSqliteWrapper.create(tabel: "BookedTrips", values: [
            FieldDetail(fieldName: "placeId", fieldType: .TEXT, isUnique: false, isNotNull: false, defaultValue: nil),
            FieldDetail(fieldName: "userId", fieldType: .TEXT, isUnique: false, isNotNull: false, defaultValue: nil),
            FieldDetail(fieldName: "bookedDateFrom", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "bookedDateTo", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "pricePerDay", fieldType: .INTEGER, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "taxPercentage", fieldType: .REAL, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "currencyCode", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "isVisited", fieldType: .INTEGER, isUnique: false, isNotNull: true, defaultValue: "0")
            ],
            primaryKeys: ["placeId","userId"]
        )

    }

    private func createWishListTable(){

        xploreSqliteWrapper.create(tabel: "WishList", values: [
            FieldDetail(fieldName: "placeId", fieldType: .TEXT, isUnique: false, isNotNull: false, defaultValue: nil),
            FieldDetail(fieldName: "userId", fieldType: .TEXT, isUnique: false, isNotNull: false, defaultValue: nil)
            ],
            primaryKeys: ["placeId","userId"]
        )

    }

    private func createCurrencyTable(){
        
        xploreSqliteWrapper.create(tabel: "Currency", values: [
            FieldDetail(fieldName: "currencyName", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "currencyCode", fieldType: .TEXT, isUnique: false, isNotNull: false, defaultValue: nil),
            FieldDetail(fieldName: "currencyValue", fieldType: .REAL, isUnique: false, isNotNull: true, defaultValue: nil)
            ],
            primaryKeys: ["currencyCode"]
        )
    }

    private func createPlaceImagesTable(){

        xploreSqliteWrapper.create(tabel: "PlaceImages", values: [
            FieldDetail(fieldName: "placeId", fieldType: .TEXT, isUnique: false, isNotNull: false, defaultValue: nil),
            FieldDetail(fieldName: "imageUrl", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil)
            ],
            primaryKeys: ["placeId","imageUrl"]
        )

    }

    func loadUserDetailData(_ userDetails : [UserDetail]) {
        
        for userDetail in userDetails {
            xploreSqliteWrapper.insert(into: "UserDetail", values: [
                FieldWithValue(fieldName: "userId", fieldType: .TEXT, fieldValue: userDetail.userId),
                FieldWithValue(fieldName: "userName", fieldType: .TEXT, fieldValue: userDetail.userId),
                FieldWithValue(fieldName: "email", fieldType: .TEXT, fieldValue: userDetail.email),
                FieldWithValue(fieldName: "mobile", fieldType: .TEXT, fieldValue: userDetail.mobile),
                FieldWithValue(fieldName: "password", fieldType: .TEXT, fieldValue: userDetail.password)
            ]
            )
        }
    }

//    func loadTravelPlaceDetailData(_ travelPlaceDetail : [TravelPlaceDetail]){
//            let insertStatementString = "INSERT INTO TravelPlaceDetail(placeId,placeName,description,hostId,numberOfRooms,numberOfBeds,numberOfBedrooms,numberOfBathrooms,numberOfPeopleAccomodate,isPlaceAvailable) VALUES (?,?,?,?,?,?,?,?,?,?);"
//            var insertStatement: OpaquePointer? = nil
//
//            if sqlite3_prepare_v2(database, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
//                for detail in travelPlaceDetail {
//                    let review = detail.reviewDetail
//                    let amenities = detail.amenities
//                    let location = detail.location
//                    let images = detail.images
//                    let rating = detail.ratingDetail
//                    let pricing = detail.price
//
//                    sqlite3_bind_text(insertStatement, 1, (detail.placeId as NSString).utf8String, -1, nil)
//                    sqlite3_bind_text(insertStatement, 2, (detail.placeName as NSString).utf8String, -1, nil)
//                    sqlite3_bind_text(insertStatement, 3, (detail.description as NSString).utf8String, -1, nil)
//                    sqlite3_bind_text(insertStatement, 4, (detail.hostId as NSString).utf8String, -1, nil)
//                    sqlite3_bind_int(insertStatement, 5, Int32(detail.noOfRooms))
//                    sqlite3_bind_int(insertStatement, 6, Int32(detail.noOfBeds))
//                    sqlite3_bind_int(insertStatement, 7, Int32(detail.noOfBedRooms))
//                    sqlite3_bind_int(insertStatement, 8, Int32(detail.noOfBathRooms))
//                    sqlite3_bind_int(insertStatement, 9, Int32(detail.noOfPeopleAccomodate))
//                    sqlite3_bind_int(insertStatement, 10, Int32(detail.isAvailable ? 1 : 0))
//
//                    let result = sqlite3_step(insertStatement)
//                    if result != SQLITE_DONE {
//                        print("Could not insert a row : stmt[ \(insertStatementString) ]")
//                    }
//                    sqlite3_reset(insertStatement)
//
//
//                    loadReviewDetail(placeId: detail.placeId, reviews: review)
//                    loadRatingDetail(placeId: detail.placeId, ratings: rating)
//                    loadAmenitiesDetail(placeId: detail.placeId, amenities: amenities)
//                    loadLocationDetail(placeId: detail.placeId, location: location)
//                    getImagesFromUrl(placeId: detail.placeId, imageUrls: images)
//                    loadPriceDetail(placeId: detail.placeId, price: pricing)
//
//                }
//            } else {
//                print("INSERT statement could not be prepared.")
//            }
//            sqlite3_finalize(insertStatement)
//    }
//
//
//    private func loadReviewDetail(placeId : String ,reviews : [Review]){
//        let insertStatementString = "INSERT INTO Review(placeId,userId,review) VALUES (?,?,?);"
//        var insertStatement: OpaquePointer? = nil
//
//        if sqlite3_prepare_v2(database, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
//            for review in reviews{
//                sqlite3_bind_text(insertStatement, 1, (placeId as NSString).utf8String, -1, nil)
//                sqlite3_bind_text(insertStatement, 2, (review.userID as NSString).utf8String, -1, nil)
//                sqlite3_bind_text(insertStatement, 3, (review.review as NSString).utf8String, -1, nil)
//
//                let result = sqlite3_step(insertStatement)
//                if result != SQLITE_DONE {
//                    print("Could not insert a row : stmt[ \(insertStatementString) ]")
//                }
//                sqlite3_reset(insertStatement)
//            }
//        } else {
//            print("INSERT statement could not be prepared.")
//        }
//        sqlite3_finalize(insertStatement)
//
//    }
//    private func loadRatingDetail(placeId : String ,ratings : [Rating]){
//        let insertStatementString = "INSERT INTO Rating(placeId,userId,rating) VALUES (?,?,?);"
//        var insertStatement: OpaquePointer? = nil
//
//        if sqlite3_prepare_v2(database, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
//            for rating in ratings {
//                sqlite3_bind_text(insertStatement, 1, (placeId as NSString).utf8String, -1, nil)
//                sqlite3_bind_text(insertStatement, 2, (rating.userID as NSString).utf8String, -1, nil)
//                sqlite3_bind_double(insertStatement, 3, rating.rating)
//
//
//                let result = sqlite3_step(insertStatement)
//                if result != SQLITE_DONE {
//                    print("Could not insert a row : stmt[ \(insertStatementString) ]")
//                }
//                sqlite3_reset(insertStatement)
//            }
//
//        } else {
//            print("INSERT statement could not be prepared.")
//        }
//        sqlite3_finalize(insertStatement)
//    }
//
//
//
//    private func loadAmenitiesDetail(placeId : String ,amenities : [Amenity]){
//        let insertStatementString = "INSERT INTO PlaceAmenities(placeId,amenity) VALUES (?,?);"
//        var insertStatement: OpaquePointer? = nil
//        if sqlite3_prepare_v2(database, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
//            for amenity in amenities {
//
//                sqlite3_bind_text(insertStatement, 1, (placeId as NSString).utf8String, -1, nil)
//                sqlite3_bind_text(insertStatement, 2, (amenity.rawValue as NSString).utf8String, -1, nil)
//
//                let result = sqlite3_step(insertStatement)
//                if result != SQLITE_DONE {
//                    print("Could not insert a row : stmt[ \(insertStatementString) ]")
//                }
//                sqlite3_reset(insertStatement)
//            }
//
//        } else {
//            print("INSERT statement could not be prepared.")
//        }
//        sqlite3_finalize(insertStatement)
//
//    }
//
//    private func loadLocationDetail(placeId : String ,location : Location){
//        let insertStatementString = "INSERT INTO Location(placeId,address,city,state,country) VALUES (?,?,?,?,?);"
//
//        var insertStatement: OpaquePointer? = nil
//
//        if sqlite3_prepare_v2(database, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
//            sqlite3_bind_text(insertStatement, 1, (placeId as NSString).utf8String, -1, nil)
//            sqlite3_bind_text(insertStatement, 2, (location.address as NSString).utf8String, -1, nil)
//            sqlite3_bind_text(insertStatement, 3, (location.city as NSString).utf8String, -1, nil)
//            sqlite3_bind_text(insertStatement, 4, (location.state as NSString).utf8String, -1, nil)
//            sqlite3_bind_text(insertStatement, 5, (location.country as NSString).utf8String, -1, nil)
//
//            let result = sqlite3_step(insertStatement)
//            if result != SQLITE_DONE {
//                print("Could not insert a row : stmt[ \(insertStatementString) ]")
//            }
//        } else {
//            print("INSERT statement could not be prepared.")
//        }
//        sqlite3_finalize(insertStatement)
//    }
//
//    private func loadPriceDetail(placeId : String, price : Price){
//        let insertStatementString = "INSERT INTO Pricing(placeId,pricePerNight,taxPercentage,currencyCode) VALUES (?,?,?,?);"
//
//        var insertStatement: OpaquePointer? = nil
//
//        if sqlite3_prepare_v2(database, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
//            sqlite3_bind_text(insertStatement, 1, (placeId as NSString).utf8String, -1, nil)
//            sqlite3_bind_int(insertStatement, 2, Int32(price.pricePerNight))
//            sqlite3_bind_double(insertStatement, 3, price.taxPercentage)
//            sqlite3_bind_text(insertStatement, 4, (price.currencyCode as NSString).utf8String, -1, nil)
//
//            let result = sqlite3_step(insertStatement)
//            if result != SQLITE_DONE {
//                print("Could not insert a row : stmt[ \(insertStatementString) ]")
//            }
//        } else {
//            print("INSERT statement could not be prepared.")
//        }
//        sqlite3_finalize(insertStatement)
//    }
//
//    private func loadImageDetail(placeId : String , imageDirPath : String){
//        let insertStatementString = "INSERT INTO PlaceImages(placeId,imageUrl) VALUES (?,?);"
//
//        var insertStatement: OpaquePointer? = nil
//
//        if sqlite3_prepare_v2(database, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
//            sqlite3_bind_text(insertStatement, 1, (placeId as NSString).utf8String, -1, nil)
//            sqlite3_bind_text(insertStatement, 2, (imageDirPath as NSString).utf8String, -1, nil)
//            let result = sqlite3_step(insertStatement)
//            if result != SQLITE_DONE {
//                print("Could not insert a row : stmt[ \(insertStatementString) ]")
//            }
//        } else {
//            print("INSERT statement could not be prepared.")
//        }
//        sqlite3_finalize(insertStatement)
//
//    }
//
//    private func getImagesFromUrl(placeId : String ,imageUrls : [String]){
//        DispatchQueue.global().async { [placeId] in
//            for url in imageUrls{
//                if let imageUrl = URL(string: url){
//                    if let imageData = try? Data(contentsOf: imageUrl){
//                        let uniqueImageName = GeneralUtils.generateRandomImageName()
//                        let docDir = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//                        let imageDirURL = docDir.appendingPathComponent("\(uniqueImageName).png")
//                        try! imageData.write(to: imageDirURL)
//
//                        let imageDirPath = imageDirURL.path
//
//                        weak var weakSelf = self
//                        weakSelf?.loadImageDetail(placeId: placeId, imageDirPath: imageDirPath)
//
//                    }
//                }
//            }
//        }
//    }
}



import Foundation
import UIKit

final class DatabaseOperation : DatabaseOperationDelegate{
    
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
        FieldDetail(fieldName: "numberOfRooms", fieldType: .INTEGER, isUnique: false, isNotNull: true, defaultValue: nil),
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
            FieldDetail(fieldName: "pricePerDay", fieldType: .INTEGER, isUnique: false, isNotNull: true, defaultValue: nil),
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

    func loadTravelPlaceDetailData(_ travelPlaceDetail : [TravelPlaceDetail]){
        for placedetail in travelPlaceDetail {
            xploreSqliteWrapper.insert(into: "TravelPlaceDetail", values: [
                FieldWithValue(fieldName: "placeId", fieldType: .TEXT, fieldValue: placedetail.placeId),
                FieldWithValue(fieldName: "placeName", fieldType: .TEXT, fieldValue: placedetail.placeName),
                FieldWithValue(fieldName: "description", fieldType: .TEXT, fieldValue: placedetail.description),
                FieldWithValue(fieldName: "hostId", fieldType: .TEXT, fieldValue: placedetail.hostId),
                FieldWithValue(fieldName: "numberOfRooms", fieldType: .INTEGER, fieldValue: String(placedetail.noOfRooms)),
                FieldWithValue(fieldName: "numberOfBeds", fieldType: .INTEGER, fieldValue: String(placedetail.noOfBeds)),
                FieldWithValue(fieldName: "numberOfBedrooms", fieldType: .INTEGER, fieldValue: String(placedetail.noOfBedRooms)),
                FieldWithValue(fieldName: "numberOfBathrooms", fieldType: .INTEGER, fieldValue: String(placedetail.noOfBathRooms)),
                FieldWithValue(fieldName: "numberOfPeopleAccomodate", fieldType: .INTEGER, fieldValue: String(placedetail.noOfPeopleAccomodate)),
                FieldWithValue(fieldName: "isPlaceAvailable", fieldType: .INTEGER, fieldValue: String(placedetail.isAvailable ? 1 : 0))
            ])
            
            
            
            loadRatingDetail(placeId: placedetail.placeId, ratings: placedetail.ratingDetail)
            loadReviewDetail(placeId: placedetail.placeId, reviews: placedetail.reviewDetail)
            loadLocationDetail(placeId: placedetail.placeId, location: placedetail.location)
            loadAmenitiesDetail(placeId: placedetail.placeId, amenities: placedetail.amenities)
            loadPriceDetail(placeId: placedetail.placeId, price: placedetail.price)
        }
      
    }


    private func loadReviewDetail(placeId : String ,reviews : [Review]){
        for review in reviews {
            xploreSqliteWrapper.insert(into: "Review", values: [
                FieldWithValue(fieldName: "placeId", fieldType: .TEXT, fieldValue: placeId),
                FieldWithValue(fieldName: "userId", fieldType: .TEXT, fieldValue: review.userID),
                FieldWithValue(fieldName: "review", fieldType: .TEXT, fieldValue: review.review)
            ])
        }

    }
    private func loadRatingDetail(placeId : String ,ratings : [Rating]){
        for rating in ratings {
            xploreSqliteWrapper.insert(into: "Rating", values: [
                FieldWithValue(fieldName: "placeId", fieldType: .TEXT, fieldValue: placeId),
                FieldWithValue(fieldName: "userId", fieldType: .TEXT, fieldValue: rating.userID),
                FieldWithValue(fieldName: "rating", fieldType: .REAL, fieldValue: String(rating.rating))
            ])
        }
    }



    private func loadAmenitiesDetail(placeId : String ,amenities : [Amenity]){
        for amenitiy in amenities {
            xploreSqliteWrapper.insert(into: "PlaceAmenities", values: [
                FieldWithValue(fieldName: "placeId", fieldType: .TEXT, fieldValue: placeId),
                FieldWithValue(fieldName: "amenity", fieldType: .TEXT, fieldValue: amenitiy.rawValue)
            ])
        }
    }

    private func loadLocationDetail(placeId : String ,location : Location){
       
        xploreSqliteWrapper.insert(into: "Location", values: [
            FieldWithValue(fieldName: "placeId", fieldType: .TEXT, fieldValue: placeId),
            FieldWithValue(fieldName: "address", fieldType: .TEXT, fieldValue: location.address),
            FieldWithValue(fieldName: "city", fieldType: .TEXT, fieldValue: location.city),
            FieldWithValue(fieldName: "state", fieldType: .TEXT, fieldValue: location.state),
            FieldWithValue(fieldName: "country", fieldType: .TEXT, fieldValue: location.country)
        ])
        
    }

    private func loadPriceDetail(placeId : String, price : Price){
        
        xploreSqliteWrapper.insert(into: "Pricing", values: [
            FieldWithValue(fieldName: "placeId", fieldType: .TEXT, fieldValue: placeId),
            FieldWithValue(fieldName: "pricePerDay", fieldType: .INTEGER, fieldValue: String(price.pricePerDay)),
            FieldWithValue(fieldName: "taxPercentage", fieldType: .REAL, fieldValue: String(price.taxPercentage)),
            FieldWithValue(fieldName: "currencyCode", fieldType: .TEXT, fieldValue: price.currencyCode)
        ])
       
        
        let result = xploreSqliteWrapper.select(
            fields: nil,
            from: "Rating",
            where: [
                QueryCondition(
                    lhs: "placeId",
                    condition: .EQUAL_TO,
                    rhs: "PD1101",
                    rhsType: .TEXT)
            ]
        )
//        print(result)
       
    }
    
    
    func getAllPlacesDetails() -> [TravelPlaceDetail]{
        var travelPlaceDetails : [TravelPlaceDetail] = []
        
        
        let resultPlaceDetails = xploreSqliteWrapper.select(fields : nil, from: "TravelPlaceDetail", where: nil)
        
        for resultPlaceDetail in resultPlaceDetails{
            let parsedPlaceDetail = resultParser(fields: resultPlaceDetail)
            
            let hostId = parsedPlaceDetail["hostId"] as! String
            let isPlaceAvailable = parsedPlaceDetail["isPlaceAvailable"] as! Int == 0 ? false : true
            let description = parsedPlaceDetail["description"] as! String
            let numberOfRooms = parsedPlaceDetail["numberOfRooms"] as! Int
            let numberOfBeds = parsedPlaceDetail["numberOfBeds"] as! Int
            let numberOfBedrooms = parsedPlaceDetail["numberOfBedrooms"] as! Int
            let numberOfBathrooms = parsedPlaceDetail["numberOfBathrooms"] as! Int
            let numberOfPeopleAccomodate = parsedPlaceDetail["numberOfPeopleAccomodate"] as! Int
            let placeName = parsedPlaceDetail["placeName"] as! String
            let placeId = parsedPlaceDetail["placeId"] as! String
            let price = getPriceDetail(placeId: placeId)
            let location = getLocationDetail(placeId: placeId)
            
            travelPlaceDetails.append(TravelPlaceDetail(
                placeId: placeId,
                placeName: placeName,
                description: description,
                hostId: hostId,
                noOfRooms: numberOfRooms,
                noOfBedRooms: numberOfBedrooms,
                noOfBathRooms: numberOfBathrooms,
                noOfBeds: numberOfBeds,
                noOfPeopleAccomodate: numberOfPeopleAccomodate,
                isAvailable: isPlaceAvailable,
                price: price,
                reviewDetail: [],
                ratingDetail: [],
                amenities: [],
                location: location,
                images: []
            ))
        }
        return travelPlaceDetails
    }
    
    func getPriceDetail(placeId : String) -> Price {
        let priceDetailsResult = resultParser(
            fields: xploreSqliteWrapper.select(fields : nil, from: "Pricing", where: [QueryCondition(lhs: "placeId", condition: .EQUAL_TO, rhs: placeId, rhsType: .TEXT)])[0]
            )
        
        let pricePerDay = priceDetailsResult["pricePerDay"] as! Int
        let taxPercentage = priceDetailsResult["taxPercentage"] as! Double
        let currencyCode = priceDetailsResult["currencyCode"] as! String
        
        return Price(pricePerDay: pricePerDay, taxPercentage: taxPercentage, currencyCode: currencyCode)
    }
    func getLocationDetail(placeId : String) -> Location{
        let loactionDetailsResult = resultParser(
            fields: xploreSqliteWrapper.select(fields : nil, from: "Location", where: [QueryCondition(lhs: "placeId", condition: .EQUAL_TO, rhs: placeId, rhsType: .TEXT)])[0]
            )
        
        let address = loactionDetailsResult["address"] as! String
        let city = loactionDetailsResult["city"] as! String
        let state = loactionDetailsResult["state"] as! String
        let country = loactionDetailsResult["country"] as! String
        
        return Location(city: city, state: state, country: country, address: address)
    }
    
    private func resultParser(fields : [FieldWithValue<Any>]) -> [String : Any]{
        var resultDict : [String : Any] = [:]
        for field in fields{
            resultDict[field.fieldName] = field.fieldValue
        }
        return resultDict
    }

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



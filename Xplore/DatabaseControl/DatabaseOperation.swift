import Foundation
import UIKit

final class DatabaseOperation : DatabaseOperationDelegate{
    
    static let shared = DatabaseOperation()
    
    let xploreSqliteWrapper : SqliteWrapper
    
    private init(){
        xploreSqliteWrapper = SqliteWrapper(for: "Xplore.sqlite")
        initializeDatabase()
    }
    
    private func initializeDatabase(){
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
        createCurrencyPreferenceTable()
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
            FieldDetail(fieldName: "pricePerDay", fieldType: .REAL, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "taxPercentage", fieldType: .REAL, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "currencyCode", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil)
            ],
            primaryKeys: ["placeId"]
        )

    }

    private func createPlaceAvailabilityTable(){

        xploreSqliteWrapper.create(tabel: "PlaceAvailability", values: [
            FieldDetail(fieldName: "placeId", fieldType: .TEXT, isUnique: false, isNotNull: false, defaultValue: nil),
            FieldDetail(fieldName: "bookedDate", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "reservationId", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil)
            ],
            primaryKeys: ["placeId","bookedDate"]
        )
    }

    private func createBookedTripsTable(){

        xploreSqliteWrapper.create(tabel: "BookedTrips", values: [
            FieldDetail(fieldName: "reservationId", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "placeId", fieldType: .TEXT, isUnique: false, isNotNull: false, defaultValue: nil),
            FieldDetail(fieldName: "userId", fieldType: .TEXT, isUnique: false, isNotNull: false, defaultValue: nil),
            FieldDetail(fieldName: "bookedDateFrom", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "bookedDateTo", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "pricePerDay", fieldType: .REAL, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "taxPercentage", fieldType: .REAL, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "currencyCode", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "cleaningFee", fieldType: .REAL, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "serviceFee", fieldType: .REAL, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "numberOfGuests", fieldType: .INTEGER, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "numberOfRooms", fieldType: .INTEGER, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "isVisited", fieldType: .INTEGER, isUnique: false, isNotNull: true, defaultValue: "0")
            ],
            primaryKeys: ["reservationId"]
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
            FieldDetail(fieldName: "imageUrl", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil)
            ],
            primaryKeys: ["imageUrl"]
        )

    }
    
    private func createCurrencyPreferenceTable(){
        xploreSqliteWrapper.create(tabel: "CurrencyPreference", values: [
            FieldDetail(fieldName: "userId", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil),
            FieldDetail(fieldName: "currencyCode", fieldType: .TEXT, isUnique: false, isNotNull: true, defaultValue: nil)
            ],
            primaryKeys: ["userId"]
        )
    }

    func loadUserDetailData(_ userDetails : [UserDetail]) {
        
        for userDetail in userDetails {
            xploreSqliteWrapper.insert(into: "UserDetail", values: [
                FieldWithValue(fieldName: "userId", fieldType: .TEXT, fieldValue: userDetail.userId),
                FieldWithValue(fieldName: "userName", fieldType: .TEXT, fieldValue: userDetail.userName),
                FieldWithValue(fieldName: "email", fieldType: .TEXT, fieldValue: userDetail.email),
                FieldWithValue(fieldName: "mobile", fieldType: .TEXT, fieldValue: userDetail.mobile),
                FieldWithValue(fieldName: "password", fieldType: .TEXT, fieldValue: userDetail.password ?? "")
            ]
            )
            
        }
    }
    
    
    func loadCurrencyPreference(currencyPreferences : [(String,String)]){
        for currencyPreference in currencyPreferences {
            let userId = currencyPreference.0
            let currencyCode = currencyPreference.1
            self.setCurrencyPreference(userId: userId, currencyCode: currencyCode)
        }
    }
    func loadCurrencyDetails(_ currencyList : [Currency]){
        for currency in currencyList {
            xploreSqliteWrapper.insert(into: "Currency", values: [
                FieldWithValue(fieldName: "currencyName", fieldType: .TEXT, fieldValue: currency.currencyName),
                FieldWithValue(fieldName: "currencyCode", fieldType: .TEXT, fieldValue: currency.currencyCode),
                FieldWithValue(fieldName: "currencyValue", fieldType: .REAL, fieldValue: String(currency.currencyValue))
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
            FieldWithValue(fieldName: "pricePerDay", fieldType: .REAL, fieldValue: String(price.pricePerDay)),
            FieldWithValue(fieldName: "taxPercentage", fieldType: .REAL, fieldValue: String(price.taxPercentage)),
            FieldWithValue(fieldName: "currencyCode", fieldType: .TEXT, fieldValue: price.currencyCode)
        ])
       
       
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
            let isWishListed = isPlaceWishListed(placeId: placeId, userId: GeneralUtils.getUserId())
            let amenities = getAmenitiesDetail(placeId: placeId)
            
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
                reviewDetail: getReviewDetail(placeId: placeId),
                ratingDetail: getRatingDetail(placeId: placeId),
                amenities: amenities,
                location: location,
                images: [],
                isWishListed: isWishListed
            ))
            
        }
        return travelPlaceDetails
    }
    
    func getBookedTripDetails(userId : String) -> [BookedTrip]{
        var bookedTrips : [BookedTrip] = []
        
        let resultBookedTrip = xploreSqliteWrapper.select(fields: nil, from: "BookedTrips", where: [QueryCondition(lhs: "userId", condition: .EQUAL_TO, rhs: userId, rhsType: .TEXT)])
        
        for trip in resultBookedTrip {
            let parsedResult = resultParser(fields: trip)
            
            let placeId = parsedResult["placeId"] as! String
            let bookedDateFromString = parsedResult["bookedDateFrom"] as! String
            let bookedDateToString = parsedResult["bookedDateTo"] as! String
            let numberOfGuests = parsedResult["numberOfGuests"] as! Int
            let numberOfRooms = parsedResult["numberOfRooms"] as! Int
            let isVisited = parsedResult["isVisited"] as! Int == 0 ? false : true
            let pricePerDay = (parsedResult["pricePerDay"] as! Double).round(to: 2)
            let taxPercentage = (parsedResult["taxPercentage"] as! Double).round(to: 2)
            let currencyCode = parsedResult["currencyCode"] as! String
            let cleaningFee = (parsedResult["cleaningFee"] as! Double).round(to: 2)
            let serviceFee = (parsedResult["serviceFee"] as! Double).round(to: 2)
            let reservationId = parsedResult["reservationId"] as! String
            
            if let bookedDateFromCompontent = GeneralUtils.convertDateStringToComponent(dateString: bookedDateFromString) {
                
                var bookedDateToComponent : DateComponents?
                
                if  bookedDateFromString == bookedDateToString {
                    bookedDateToComponent = nil
                }else if let bookedDateTo = GeneralUtils.convertDateStringToComponent(dateString: bookedDateToString)  {
                    bookedDateToComponent = bookedDateTo
                }
                
                
                bookedTrips.append(
                    BookedTrip(
                        userId: userId,
                        placeId: placeId,
                        BookedDateFrom: bookedDateFromCompontent,
                        BookedDateTo: bookedDateToComponent,
                        pricePerDay: pricePerDay,
                        taxPercentage: taxPercentage,
                        currencyCode: currencyCode,
                        isVisited: isVisited,
                        numberOfGuests: numberOfGuests,
                        cleaningFee: cleaningFee,
                        serviceFee: serviceFee,
                        reservationId: reservationId,
                        numberOfrooms: numberOfRooms
                    )
                )
            }
        }
        return bookedTrips
    }
    
    func getTravelPlaceDetail(placeId : String) -> TravelPlaceDetail?{
        let resultPlaceDetail = xploreSqliteWrapper.select(fields : nil, from: "TravelPlaceDetail", where: [QueryCondition(lhs: "placeId", condition: .EQUAL_TO, rhs: placeId, rhsType: .TEXT)])
        
        if resultPlaceDetail.count > 0 {
            
            let parsedPlaceDetail = resultParser(fields: resultPlaceDetail[0])
            
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
            let isWishListed = isPlaceWishListed(placeId: placeId, userId: GeneralUtils.getUserId())
            let amenities = getAmenitiesDetail(placeId: placeId)
            
            return TravelPlaceDetail(
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
                reviewDetail: getReviewDetail(placeId: placeId),
                ratingDetail: getRatingDetail(placeId: placeId),
                amenities: amenities,
                location: location,
                images: [],
                isWishListed: isWishListed
            )
        }
        
        return nil
    }
    
    func getPriceDetail(placeId : String) -> Price {
        let priceDetailsResult = resultParser(
            fields: xploreSqliteWrapper.select(fields : nil, from: "Pricing", where: [QueryCondition(lhs: "placeId", condition: .EQUAL_TO, rhs: placeId, rhsType: .TEXT)])[0]
            )
        
        let pricePerDay = (priceDetailsResult["pricePerDay"] as! Double).round(to: 2)
        let taxPercentage = (priceDetailsResult["taxPercentage"] as! Double).round(to: 2)
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
    
    func getAmenitiesDetail(placeId : String) -> [Amenity]{
        var amenitiesList : [Amenity] = []
        
        let amenitiesDetailsResult = xploreSqliteWrapper.select(fields : nil, from: "PlaceAmenities", where: [QueryCondition(lhs: "placeId", condition: .EQUAL_TO, rhs: placeId, rhsType: .TEXT)])
            
        
        for row in amenitiesDetailsResult{
            
            let parsedRow = resultParser(fields: row)
            
            let amenity = parsedRow["amenity"] as! String
            
            if let amenity = Amenity.fromRawValue(rawValue: amenity){
                amenitiesList.append(amenity)
            }
        }
        
        return amenitiesList
    }
    
    func getReviewDetail(placeId : String) -> [Review]{
        var reviewList : [Review] = []
        
        let reviewsDetailsResult = xploreSqliteWrapper.select(fields : nil, from: "Review", where: [QueryCondition(lhs: "placeId", condition: .EQUAL_TO, rhs: placeId, rhsType: .TEXT)])
            
        
        for row in reviewsDetailsResult{
            
            let parsedRow = resultParser(fields: row)
            
            let userId = parsedRow["userId"] as! String
            let review = parsedRow["review"] as! String
            
            if let userName = getUserName(userId: userId){
                reviewList.append(Review(userID: userId, userName: userName, review: review))
            }
        }
        
        return reviewList
    }
    
    func getUserName(userId : String) -> String?{
        let queriedRow = xploreSqliteWrapper.select(fields: ["userName"], from: "UserDetail", where: [QueryCondition(lhs: "userId", condition: .EQUAL_TO, rhs: userId, rhsType: .TEXT)])
        
        if queriedRow.count == 0{
            return nil
        }
        
        let result = resultParser(fields: queriedRow[0])
        
        return result["userName"] as? String
    }
    
    func getRatingDetail(placeId : String) -> [Rating]{
        var ratingList : [Rating] = []

        let ratingDetailsResult = xploreSqliteWrapper.select(fields : nil, from: "Rating", where: [QueryCondition(lhs: "placeId", condition: .EQUAL_TO, rhs: placeId, rhsType: .TEXT)])


        for row in ratingDetailsResult{

            let parsedRow = resultParser(fields: row)
            
            let rating = (parsedRow["rating"] as! Double).round(to: 2)
            let userId = parsedRow["userId"] as! String
            
            ratingList.append(
                Rating(
                    userID: userId,
                    rating: rating
                )
            )
           
        }

        return ratingList
    }
    
    private func resultParser(fields : [FieldWithValue<Any>]) -> [String : Any]{
        var resultDict : [String : Any] = [:]
        for field in fields{
            resultDict[field.fieldName] = field.fieldValue
        }
        return resultDict
    }
    
    func isPlaceWishListed(placeId : String,userId : String) -> Bool {
    let result = xploreSqliteWrapper.select(fields : nil, from: "WishList", where: [QueryCondition(lhs: "placeId", condition: .EQUAL_TO, rhs: placeId, rhsType: .TEXT),QueryCondition(lhs: "userId", condition: .EQUAL_TO, rhs: userId, rhsType: .TEXT)
        ])
                                            
    return result.count > 0
}
    
    func addToWishList(placeId : String, userId : String){
        xploreSqliteWrapper.insert(into: "WishList", values: [FieldWithValue<String>(fieldName: "placeId", fieldType: .TEXT, fieldValue: placeId),
            FieldWithValue<String>(fieldName: "userId", fieldType: .TEXT, fieldValue: userId)])
    }
    
    func removeFromWishList(placeId : String, userId : String){
        xploreSqliteWrapper.delete(from: "WishList", where: [QueryCondition(lhs: "placeId", condition: .EQUAL_TO, rhs: placeId, rhsType: .TEXT),
            QueryCondition(lhs: "userId", condition: .EQUAL_TO, rhs: userId, rhsType: .TEXT)])
    }
    
    func getImageLocalUrl(imageUrl : String) -> Bool{
        let localUrlRows = xploreSqliteWrapper.select(fields: ["imageUrl"], from: "PlaceImages", where: [QueryCondition(lhs: "imageUrl", condition: .EQUAL_TO, rhs: imageUrl, rhsType: .TEXT)])
        if localUrlRows.count == 0{
            return false
        }
        return true
    }
    
    func addImageUrl(imageUrl : String){
        xploreSqliteWrapper.insert(into: "PlaceImages", values: [
            FieldWithValue<String>(fieldName: "imageUrl", fieldType: .TEXT, fieldValue: imageUrl)
        ])
    }
    
    func reservePlace(bookedTrip : BookedTrip){
        
        let toDate = bookedTrip.BookedDateTo ?? bookedTrip.BookedDateFrom
        if let fromDateString = bookedTrip.BookedDateFrom.date?.description,
           let toDateString = toDate.date?.description {
            
            xploreSqliteWrapper.insert(into: "BookedTrips", values: [
                FieldWithValue(fieldName: "placeId", fieldType: .TEXT, fieldValue: bookedTrip.placeId),
                FieldWithValue(fieldName: "userId", fieldType: .TEXT, fieldValue: bookedTrip.userId),
                FieldWithValue(fieldName: "bookedDateFrom", fieldType: .TEXT, fieldValue: fromDateString),
                FieldWithValue(fieldName: "bookedDateTo", fieldType: .TEXT, fieldValue: toDateString),
                FieldWithValue(fieldName: "pricePerDay", fieldType: .REAL, fieldValue: String(bookedTrip.pricePerDay)),
                FieldWithValue(fieldName: "taxPercentage", fieldType: .REAL, fieldValue: String(bookedTrip.taxPercentage)),
                FieldWithValue(fieldName: "currencyCode", fieldType: .TEXT, fieldValue: bookedTrip.currencyCode),
                FieldWithValue(fieldName: "cleaningFee", fieldType: .REAL, fieldValue: String(bookedTrip.cleaningFee)),
                FieldWithValue(fieldName: "ServiceFee", fieldType: .REAL, fieldValue: String(bookedTrip.serviceFee)),
                FieldWithValue(fieldName: "numberOfGuests", fieldType: .INTEGER, fieldValue: String(bookedTrip.numberOfGuests)),
                FieldWithValue(fieldName: "numberOfRooms", fieldType: .INTEGER, fieldValue: String(bookedTrip.numberOfrooms)),
                FieldWithValue(fieldName: "reservationId", fieldType: .TEXT, fieldValue: bookedTrip.reservationId),
                FieldWithValue(fieldName: "isVisited", fieldType: .INTEGER, fieldValue: bookedTrip.isVisited ? String(1) : String(0))
                
            ])
        }
    }
    
    func bookDates(reservationId : String, placeId : String,datesToBook : [Date]){
        
        for date in datesToBook{
            xploreSqliteWrapper.insert(into: "PlaceAvailability", values: [
                FieldWithValue(fieldName: "placeId", fieldType: .TEXT, fieldValue: placeId),
                FieldWithValue(fieldName: "bookedDate", fieldType: .TEXT, fieldValue: date.description),
                FieldWithValue(fieldName: "reservationId", fieldType: .TEXT, fieldValue: reservationId),
            ])
        }
        
    }
    
    func cancelBookedReservation(reservationId : String){
        xploreSqliteWrapper.delete(from: "BookedTrips", where: [QueryCondition(lhs: "reservationId", condition: .EQUAL_TO, rhs: reservationId, rhsType: .TEXT)])
    }
    
    func cancelPlaceAvailabilty(reservationId : String){
        xploreSqliteWrapper.delete(from: "PlaceAvailability", where: [QueryCondition(lhs: "reservationId", condition: .EQUAL_TO, rhs: reservationId, rhsType: .TEXT)])
    }
    
    func getBookedDates(of placeId : String) -> [DateComponents]{
        var bookedDates : [DateComponents] = []
        let resultDates = xploreSqliteWrapper.select(
            fields: ["bookedDate"],
            from: "PlaceAvailability",
            where: [QueryCondition(lhs: "placeId", condition: .EQUAL_TO, rhs: placeId, rhsType: .TEXT)])
        for resultDate in resultDates{
            let parsedResult = resultParser(fields: resultDate)
            
            if let bookedDateString = parsedResult["bookedDate"] as? String,
                let bookedDate = GeneralUtils.convertDateStringToComponent(dateString: bookedDateString) {
                
                    bookedDates.append(bookedDate)
            }
        }
        
        return bookedDates
    }
    
    func isUserRated(userId : String,placeId : String) -> Bool{
        let result = xploreSqliteWrapper.select(fields: nil, from: "Rating", where: [QueryCondition(lhs: "userId", condition: .EQUAL_TO, rhs: userId, rhsType: .TEXT),QueryCondition(lhs: "placeId", condition: .EQUAL_TO, rhs: placeId, rhsType: .TEXT)])
        
        if result.count == 0 {
            return false
        }
        
        return true
    }
    
    func addRating(userId : String,placeId : String,rating : Double){
        xploreSqliteWrapper.insert(into: "Rating", values: [
            FieldWithValue(fieldName: "userId", fieldType: .TEXT, fieldValue: userId),
            FieldWithValue(fieldName: "placeId", fieldType: .TEXT, fieldValue: placeId  ),
            FieldWithValue(fieldName: "rating", fieldType: .REAL, fieldValue: String(rating))
        ])
    }
    
    func addReview(userId : String,placeId : String,review : String){
        xploreSqliteWrapper.insert(into: "Review", values: [
            FieldWithValue(fieldName: "userId", fieldType: .TEXT, fieldValue: userId),
            FieldWithValue(fieldName: "placeId", fieldType: .TEXT, fieldValue: placeId  ),
            FieldWithValue(fieldName: "review", fieldType: .TEXT, fieldValue: review)
        ])
    }
    
    func isPlaceAvailable(placeId : String,datesToCheck : [Date]) -> Bool{
        
        let selectResults = xploreSqliteWrapper.select(fields: ["bookedDate"], from: "PlaceAvailability", where: [QueryCondition(lhs: "placeId", condition: .EQUAL_TO, rhs: placeId, rhsType: .TEXT)])
        
        for selectResult in selectResults {
            let parsedResult = resultParser(fields: selectResult)
            let dateString = parsedResult["bookedDate"] as! String
            if let dateCompontent = GeneralUtils.convertDateStringToComponent(dateString: dateString),let date = dateCompontent.date{
                if datesToCheck.contains(date){
                    return false
                }
            }
        }
        return true
    }
    
    func getAvailableLocations() -> [FilteredLocation]{
        var locationDetails : [FilteredLocation] = []
        let selectedResult = xploreSqliteWrapper.select(fields: ["city","state","country"], from: "Location", where: nil)
        for result in selectedResult {
            let parsedResult = resultParser(fields: result)
            
            let city = parsedResult["city"] as! String
            let state = parsedResult["state"] as! String
            let country = parsedResult["country"] as! String
            
            let location = FilteredLocation(
                country: country,
                state: state,
                city: city
            )
            
            if !isListContains(locationDetail: location, locationList: locationDetails){
                locationDetails.append(location)
            }
        }
        
        return locationDetails
    }
    
    func getCurrencyList() -> [Currency]{
        var currencyDetails : [Currency] = []
        
        let selectedResult = xploreSqliteWrapper.select(fields: ["currencyName","currencyCode","currencyValue"], from: "Currency", where: nil)
        
        for result in selectedResult {
            let parsedResult = resultParser(fields: result)
            
            let currencyName = parsedResult["currencyName"] as! String
            let currencyCode = parsedResult["currencyCode"] as! String
            let currencyValue = (parsedResult["currencyValue"] as! Double).round(to: 2)
            
            let currency = Currency(
                currencyName: currencyName,
                currencyCode: currencyCode,
                currencyValue: currencyValue)
           
            currencyDetails.append(currency)
            
        }
        
        return currencyDetails
    }
    
    func getCurrencyValue(currenyCode : String) -> Double{
        let selectedResult = xploreSqliteWrapper.select(fields: ["currencyValue"], from: "Currency", where: [QueryCondition(lhs: "currencyCode", condition: .EQUAL_TO, rhs: currenyCode, rhsType: .TEXT)])[0]
        
        let parsedResult = resultParser(fields: selectedResult)
        return (parsedResult["currencyValue"] as! Double).round(to: 2)
    }
    
    private func isListContains(locationDetail : FilteredLocation,locationList : [FilteredLocation]) -> Bool{
        for location in locationList {
            if location == locationDetail{
                return true
            }
        }
        return false
    }
    
    
    func isEmailExist(email : String) -> Bool{
        let result = xploreSqliteWrapper.select(fields: ["email"], from: "UserDetail", where: [QueryCondition(lhs: "email", condition: .EQUAL_TO, rhs: email, rhsType: .TEXT)])
        return result.count == 1 ? true : false
    }
    
    func getPassword(for email : String) -> String?{
        let result = xploreSqliteWrapper.select(fields: ["password"], from: "UserDetail", where: [QueryCondition(lhs: "email", condition: .EQUAL_TO, rhs: email, rhsType: .TEXT)])
        if result.count == 0 {
            return nil
        }
        let parsedResult = resultParser(fields: result[0])
        return parsedResult["password"] as? String
    }
    
    func getUserId(for email : String) -> String?{
        let result = xploreSqliteWrapper.select(fields: ["userId"], from: "UserDetail", where: [QueryCondition(lhs: "email", condition: .EQUAL_TO, rhs: email, rhsType: .TEXT)])
        if result.count == 0 {
            return nil
        }
        let parsedResult = resultParser(fields: result[0])
        return parsedResult["userId"] as? String
    }
    
    func getUserDetail(for userId: String) -> UserDetail {
        let result = xploreSqliteWrapper.select(fields: ["userName","email","mobile"], from: "UserDetail", where: [QueryCondition(lhs: "userId", condition: .EQUAL_TO, rhs: userId, rhsType: .TEXT)])
        
        if result.isEmpty{
            return UserDetail(
                        userId: "null",
                        userName: "null",
                        email: "null",
                        mobile: "null",
                        password: nil
                )
        }
        
        let parsedResult = resultParser(fields: result[0])
        let name = parsedResult["userName"] as? String ?? ""
        let email = parsedResult["email"] as? String ?? ""
        let mobile = parsedResult["mobile"] as? String ?? ""
            
        return UserDetail(
                userId: userId,
                userName: name,
                email: email,
                mobile: mobile,
                password: nil
        )
        
    }
    
    func setCurrencyPreference(userId : String,currencyCode : String){
        xploreSqliteWrapper.insert(into: "currencyPreference", values: [
            FieldWithValue(fieldName: "userId", fieldType: .TEXT, fieldValue: userId),
            FieldWithValue(fieldName: "currencyCode", fieldType: .TEXT, fieldValue: currencyCode),
        ])
    }
    
    func updateCurrencyPreference(userId : String,currencyCode : String){
        xploreSqliteWrapper.update(
            into: "currencyPreference",
            set: [
                FieldWithValue(
                    fieldName: "currencyCode",
                    fieldType: .TEXT,
                    fieldValue: currencyCode)
                ],
            
            where: [
                QueryCondition(
                    lhs: "userId",
                    condition: .EQUAL_TO,
                    rhs: userId,
                    rhsType: .TEXT)
            ]
        )
    }
    
    func getCurrencyPreference(userId : String) -> String{
        let result = xploreSqliteWrapper.select(fields: ["currencyCode"], from: "currencyPreference", where: [QueryCondition(lhs: "userId", condition: .EQUAL_TO, rhs: userId, rhsType: .TEXT)])
        let parsedResult = resultParser(fields: result[0])
        return parsedResult["currencyCode"] as! String
    }
    
    func signUp(accountDetail: UserDetail){
        if let password = accountDetail.password{
            xploreSqliteWrapper.insert(into: "UserDetail", values: [
                FieldWithValue(fieldName: "userId", fieldType: .TEXT, fieldValue: accountDetail.userId),
                FieldWithValue(fieldName: "userName", fieldType: .TEXT, fieldValue: accountDetail.userName),
                FieldWithValue(fieldName: "email", fieldType: .TEXT, fieldValue: accountDetail.email),
                FieldWithValue(fieldName: "mobile", fieldType: .TEXT, fieldValue: accountDetail.mobile),
                FieldWithValue(fieldName: "password", fieldType: .TEXT, fieldValue: password)
            ])
        }
    }
    
    func isUserIdExist(userId : String) -> Bool{
        let result = xploreSqliteWrapper.select(fields: ["userId"], from: "UserDetail", where: [QueryCondition(lhs: "userId", condition: .EQUAL_TO, rhs: userId, rhsType: .TEXT)])
        if result.count == 0{
            return false
        }
        return true
    }
    
}



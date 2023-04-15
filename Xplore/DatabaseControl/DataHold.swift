import Foundation

class DataHold{
    static let userDetails : [UserDetail] = getUserDetail()
    static let travelPlaceDetails : [TravelPlaceDetail] = getTravelPlaceDetails()
    
    
    static let bookedTrips = getBookedTrips()
    
    static private func getBookedTrips() -> [BookedTrip]{
        var bookedTrips : [BookedTrip] = []
        
        let fromDate = DateComponents(calendar: .current,timeZone: .current,era: 1,year: 2023,month: 4, day: 12)
        let toDate = DateComponents(calendar: .current,timeZone: .current,era: 1,year: 2023,month: 5, day: 10)
        
        bookedTrips.append(
            BookedTrip(
                userId: GeneralUtils.getUserId(),
                placeId: "PD1101",
                BookedDateFrom: fromDate,
                BookedDateTo: toDate,
                pricePerDay: 14500,
                taxPercentage: 12.5,
                currencyCode: "INR",
                isVisited: true,
                numberOfGuests: 5,
                cleaningFee: 550,
                serviceFee: 1000,
                reservationId: "ABCDEFGHIJ"
            )
        )
        
        bookedTrips.append(
            BookedTrip(
                userId: GeneralUtils.getUserId(),
                placeId: "PD1102",
                BookedDateFrom: fromDate,
                BookedDateTo: toDate,
                pricePerDay: 14500,
                taxPercentage: 12.5,
                currencyCode: "INR",
                isVisited: false,
                numberOfGuests: 5,
                cleaningFee: 550,
                serviceFee: 1000,
                reservationId: "JIHGFEDCBA"
            )
        )
        
        return bookedTrips
    }
    
    static private func getUserDetail() -> [UserDetail]{
        var userDetails : [UserDetail] = []
        
        userDetails.append(
            UserDetail(
                userId: "UD1101",
                userName: "Johny",
                email: "john@gmail.com",
                mobile: "+91987654321",
                password: "123"
            )
        )
        
        userDetails.append(
            UserDetail(
                userId: "UD1102",
                userName: "Yogi",
                email: "yogi@gmail.com",
                mobile: "+91987654332",
                password: "123"
            )
        )
        
        userDetails.append(
            UserDetail(
                userId: "UD1103",
                userName: "Avi",
                email: "avi@gmail.com",
                mobile: "+91987654323",
                password: "123"
            )
        )
        
        userDetails.append(
            UserDetail(
                userId: "UD1104",
                userName: "DD",
                email: "dd@gmail.com",
                mobile: "+91987654324",
                password: "123"
            )
        )
        
        userDetails.append(
            UserDetail(
                userId: "UD1104",
                userName: "Nithis",
                email: "natty@gmail.com",
                mobile: "+91987654324",
                password: "123"
            )
        )
        
        userDetails.append(
            UserDetail(
                userId: "UD1105",
                userName: "Surya",
                email: "surya@gmail.com",
                mobile: "+91987654325",
                password: "123"
            )
        )
        
        userDetails.append(
            UserDetail(
                userId: "UD1106",
                userName: "Arnab Shandy",
                email: "arnab.s@gmail.com",
                mobile: "+91987654326",
                password: "123"
            )
        )
        
        return userDetails
    }
    
    static private func getTravelPlaceDetails() -> [TravelPlaceDetail]{
        var travelPlaceDetails : [TravelPlaceDetail] = []
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1101",
                placeName: "tree The Taj Restraunt with Sea View",
                description: "This upscale contemporary Japanese dining room in a hotel serves classics, sushi and rare sakes.",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "INR"),
                reviewDetail: [
                    Review(userID: "UD1108", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1103", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1104", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.I wouldn’t recommend hosting this guest. The guest broke the locks of the off-limit storage area of the house, which was explicitly stated in the welcome book that the storage room was not for guest use.Guests disrespected our Airbnb rules by throwing a house party and having five additional visitors stay in the Airbnb. When we issued an additional cleaning fee for the mess, the guest left a one-star review. Do not host this guest."),
                    Review(userID: "UD1105", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1106", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1107", userName: "Yogi", review: "Nice Place Must Visit.")
                ],
                ratingDetail: [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,
                            Amenity.CarbonMonoxide_Alarm,
                            Amenity.First_Aid_Kit,
                            Amenity.Fire_Extinguisher,
                            Amenity.Pool,
                            Amenity.Free_Parking,
                            Amenity.Pets_Allowed,
                            Amenity.Smoke_Alarm
                           ],
                location: Location(city: "Chennai", state: "TN", country: "India", address: "23/24 big map street"),
                images: [
                    "https://cdn.pixabay.com/photo/2020/04/17/12/28/pool-5055009_1280.jpg",
                    "https://cdn.pixabay.com/photo/2016/04/15/11/45/hotel-1330841__480.jpg",
                    "https://cdn.pixabay.com/photo/2013/10/12/18/05/villa-194671__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/03/30/00/24/villa-2186906__480.jpg",
                    "https://cdn.pixabay.com/photo/2019/10/17/02/39/villa-4555818__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/03/05/09/51/home-1237469__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/04/18/12/57/residence-2238987__480.jpg",
                    "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823__480.jpg",
                    "https://cdn.pixabay.com/photo/2015/06/19/21/24/avenue-815297__480.jpg"
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1102",
                placeName: "ocean The Hotel Madeer Restraunt The New Exp",
                description: "This upscale contemporary Japanese dining room in a hotel serves classics, sushi and rare sakes.",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "USD"),
                reviewDetail: [Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.")],
                ratingDetail : [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,Amenity.CarbonMonoxide_Alarm,Amenity.First_Aid_Kit],
                location: Location(city: "Chennai", state: "Kerala", country: "India", address: "475, Raily watson street, Vadakalaur"),
                images: [
                    "https://cdn.pixabay.com/photo/2016/11/29/04/19/ocean-1867285__480.jpg",
                    "https://cdn.pixabay.com/photo/2018/06/13/18/20/waves-3473335__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/09/18/03/28/travel-1677347__480.jpg",
                    "https://cdn.pixabay.com/photo/2020/03/21/20/03/real-estate-4955087__480.jpg",
                    "https://cdn.pixabay.com/photo/2020/03/21/20/03/real-estate-4955086__480.jpg",
                    "https://cdn.pixabay.com/photo/2015/01/15/10/55/villa-600176__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/01/07/17/48/interior-1961070__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/08/26/15/06/home-1622401__480.jpg",
                    "https://cdn.pixabay.com/photo/2014/08/11/21/40/bedroom-416062__480.jpg"
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1103",
                placeName: "fire Taj Falaknuma Palace, Hyderabad",
                description: "Undoubtedly, Taj Falaknuma Palace makes its place among the most noted 7-star hotels in India and abroad with its world-class appeal, facilities, service and so on.",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "INR"),
                reviewDetail: [
                    Review(userID: "UD1108", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1103", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1104", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.I wouldn’t recommend hosting this guest. The guest broke the locks of the off-limit storage area of the house, which was explicitly stated in the welcome book that the storage room was not for guest use.Guests disrespected our Airbnb rules by throwing a house party and having five additional visitors stay in the Airbnb. When we issued an additional cleaning fee for the mess, the guest left a one-star review. Do not host this guest."),
                    Review(userID: "UD1105", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1106", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1107", userName: "Yogi", review: "Nice Place Must Visit.")
                ],
                ratingDetail: [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,
                            Amenity.CarbonMonoxide_Alarm,
                            Amenity.First_Aid_Kit,
                            Amenity.Fire_Extinguisher,
                            Amenity.Pool,
                            Amenity.Free_Parking,
                            Amenity.Pets_Allowed,
                            Amenity.Smoke_Alarm
                           ],
                location: Location(city: "Chennai", state: "TN", country: "India", address: "23/24 big map street"),
                images: [
                    "https://cdn.pixabay.com/photo/2017/04/30/15/12/apocalypse-2273069__480.jpg",
                    "https://cdn.pixabay.com/photo/2018/11/03/22/24/fire-3792951__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/11/24/21/49/bali-2975787__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/04/15/11/45/hotel-1330841__480.jpg",
                    "https://cdn.pixabay.com/photo/2012/11/21/10/24/building-66789__480.jpg",
                    "https://cdn.pixabay.com/photo/2014/07/21/19/20/lobby-398845__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/03/28/09/34/bedroom-1285156__480.jpg",
                    
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1104",
                placeName: " wind The Taj Restraunt with Sea View",
                description: "This upscale contemporary Japanese dining room in a hotel serves classics, sushi and rare sakes.",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "INR"),
                reviewDetail: [
                    Review(userID: "UD1108", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1103", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1104", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.I wouldn’t recommend hosting this guest. The guest broke the locks of the off-limit storage area of the house, which was explicitly stated in the welcome book that the storage room was not for guest use.Guests disrespected our Airbnb rules by throwing a house party and having five additional visitors stay in the Airbnb. When we issued an additional cleaning fee for the mess, the guest left a one-star review. Do not host this guest."),
                    Review(userID: "UD1105", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1106", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1107", userName: "Yogi", review: "Nice Place Must Visit.")
                ],
                ratingDetail: [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,
                            Amenity.CarbonMonoxide_Alarm,
                            Amenity.First_Aid_Kit,
                            Amenity.Fire_Extinguisher,
                            Amenity.Pool,
                            Amenity.Free_Parking,
                            Amenity.Pets_Allowed,
                            Amenity.Smoke_Alarm
                           ],
                location: Location(city: "Chennai", state: "TN", country: "India", address: "23/24 big map street"),
                images: [
                    "https://cdn.pixabay.com/photo/2014/09/27/17/35/dandelion-463928__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/02/27/08/50/cyclone-2102397__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/10/18/09/02/hotel-1749602__480.jpg",
                    "https://cdn.pixabay.com/photo/2019/08/19/13/58/bed-4416515__480.jpg",
                    "https://cdn.pixabay.com/photo/2020/10/18/09/16/bedroom-5664221__480.jpg",
                    "https://cdn.pixabay.com/photo/2019/05/28/00/15/indoors-4234071__480.jpg",
                    "https://cdn.pixabay.com/photo/2020/10/18/09/16/bedroom-5664221__480.jpg",
                    "https://cdn.pixabay.com/photo/2023/03/29/10/27/hotel-7885138__480.jpg"
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1105",
                placeName: "sun The Taj Restraunt with Sea View",
                description: "This upscale contemporary Japanese dining room in a hotel serves classics, sushi and rare sakes.",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "INR"),
                reviewDetail: [
                    Review(userID: "UD1108", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1103", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1104", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.I wouldn’t recommend hosting this guest. The guest broke the locks of the off-limit storage area of the house, which was explicitly stated in the welcome book that the storage room was not for guest use.Guests disrespected our Airbnb rules by throwing a house party and having five additional visitors stay in the Airbnb. When we issued an additional cleaning fee for the mess, the guest left a one-star review. Do not host this guest."),
                    Review(userID: "UD1105", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1106", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1107", userName: "Yogi", review: "Nice Place Must Visit.")
                ],
                ratingDetail: [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,
                            Amenity.CarbonMonoxide_Alarm,
                            Amenity.First_Aid_Kit,
                            Amenity.Fire_Extinguisher,
                            Amenity.Pool,
                            Amenity.Free_Parking,
                            Amenity.Pets_Allowed,
                            Amenity.Smoke_Alarm
                           ],
                location: Location(city: "Chennai", state: "TN", country: "India", address: "23/24 big map street"),
                images: [
                    "https://cdn.pixabay.com/photo/2016/07/02/12/21/eclipse-1492818__480.jpg",
                    "https://cdn.pixabay.com/photo/2014/03/26/17/50/sunset-298850__480.jpg",
                    "https://cdn.pixabay.com/photo/2021/12/11/07/59/hotel-6862159__480.jpg",
                    "https://cdn.pixabay.com/photo/2021/08/27/01/33/bedroom-6577523__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/06/10/01/05/hotel-room-1447201__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/01/14/12/48/hotel-1979406__480.jpg",
                    "https://cdn.pixabay.com/photo/2013/07/19/00/18/water-165219__480.jpg"
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1106",
                placeName: "moon The Taj Restraunt with Sea View",
                description: "This upscale contemporary Japanese dining room in a hotel serves classics, sushi and rare sakes.",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "INR"),
                reviewDetail: [
                    Review(userID: "UD1108", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1103", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1104", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.I wouldn’t recommend hosting this guest. The guest broke the locks of the off-limit storage area of the house, which was explicitly stated in the welcome book that the storage room was not for guest use.Guests disrespected our Airbnb rules by throwing a house party and having five additional visitors stay in the Airbnb. When we issued an additional cleaning fee for the mess, the guest left a one-star review. Do not host this guest."),
                    Review(userID: "UD1105", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1106", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1107", userName: "Yogi", review: "Nice Place Must Visit.")
                ],
                ratingDetail: [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,
                            Amenity.CarbonMonoxide_Alarm,
                            Amenity.First_Aid_Kit,
                            Amenity.Fire_Extinguisher,
                            Amenity.Pool,
                            Amenity.Free_Parking,
                            Amenity.Pets_Allowed,
                            Amenity.Smoke_Alarm
                           ],
                location: Location(city: "Chennai", state: "TN", country: "India", address: "23/24 big map street"),
                images: [
                    "https://cdn.pixabay.com/photo/2016/11/25/23/15/moon-1859616__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/11/25/23/15/moon-1859616__480.jpg",
                    "https://cdn.pixabay.com/photo/2018/02/24/17/17/window-3178666__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/09/18/03/28/travel-1677347__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/05/31/10/23/manor-house-2359884__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/03/09/06/30/pool-2128578__480.jpg",
                    "https://cdn.pixabay.com/photo/2015/06/12/12/10/castle-park-806854__480.jpg"
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1107",
                placeName: "tree The Taj Restraunt with Sea View",
                description: "This upscale contemporary Japanese dining room in a hotel serves classics, sushi and rare sakes.",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "INR"),
                reviewDetail: [
                    Review(userID: "UD1108", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1103", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1104", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.I wouldn’t recommend hosting this guest. The guest broke the locks of the off-limit storage area of the house, which was explicitly stated in the welcome book that the storage room was not for guest use.Guests disrespected our Airbnb rules by throwing a house party and having five additional visitors stay in the Airbnb. When we issued an additional cleaning fee for the mess, the guest left a one-star review. Do not host this guest."),
                    Review(userID: "UD1105", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1106", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1107", userName: "Yogi", review: "Nice Place Must Visit.")
                ],
                ratingDetail: [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,
                            Amenity.CarbonMonoxide_Alarm,
                            Amenity.First_Aid_Kit,
                            Amenity.Fire_Extinguisher,
                            Amenity.Pool,
                            Amenity.Free_Parking,
                            Amenity.Pets_Allowed,
                            Amenity.Smoke_Alarm
                           ],
                location: Location(city: "Chennai", state: "TN", country: "India", address: "23/24 big map street"),
                images: [
                    "https://cdn.pixabay.com/photo/2020/04/17/12/28/pool-5055009_1280.jpg",
                    "https://cdn.pixabay.com/photo/2016/04/15/11/45/hotel-1330841__480.jpg",
                    "https://cdn.pixabay.com/photo/2013/10/12/18/05/villa-194671__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/03/30/00/24/villa-2186906__480.jpg",
                    "https://cdn.pixabay.com/photo/2019/10/17/02/39/villa-4555818__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/03/05/09/51/home-1237469__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/04/18/12/57/residence-2238987__480.jpg",
                    "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823__480.jpg",
                    "https://cdn.pixabay.com/photo/2015/06/19/21/24/avenue-815297__480.jpg"
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1108",
                placeName: "ocean The Hotel Madeer Restraunt The New Exp",
                description: "This upscale contemporary Japanese dining room in a hotel serves classics, sushi and rare sakes.",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "USD"),
                reviewDetail: [Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.")],
                ratingDetail : [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,Amenity.CarbonMonoxide_Alarm,Amenity.First_Aid_Kit],
                location: Location(city: "Chennai", state: "Kerala", country: "India", address: "475, Raily watson street, Vadakalaur"),
                images: [
                    "https://cdn.pixabay.com/photo/2016/11/29/04/19/ocean-1867285__480.jpg",
                    "https://cdn.pixabay.com/photo/2018/06/13/18/20/waves-3473335__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/09/18/03/28/travel-1677347__480.jpg",
                    "https://cdn.pixabay.com/photo/2020/03/21/20/03/real-estate-4955087__480.jpg",
                    "https://cdn.pixabay.com/photo/2020/03/21/20/03/real-estate-4955086__480.jpg",
                    "https://cdn.pixabay.com/photo/2015/01/15/10/55/villa-600176__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/01/07/17/48/interior-1961070__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/08/26/15/06/home-1622401__480.jpg",
                    "https://cdn.pixabay.com/photo/2014/08/11/21/40/bedroom-416062__480.jpg"
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1109",
                placeName: "fire Taj Falaknuma Palace, Hyderabad",
                description: "Undoubtedly, Taj Falaknuma Palace makes its place among the most noted 7-star hotels in India and abroad with its world-class appeal, facilities, service and so on.",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "INR"),
                reviewDetail: [
                    Review(userID: "UD1108", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1103", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1104", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.I wouldn’t recommend hosting this guest. The guest broke the locks of the off-limit storage area of the house, which was explicitly stated in the welcome book that the storage room was not for guest use.Guests disrespected our Airbnb rules by throwing a house party and having five additional visitors stay in the Airbnb. When we issued an additional cleaning fee for the mess, the guest left a one-star review. Do not host this guest."),
                    Review(userID: "UD1105", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1106", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1107", userName: "Yogi", review: "Nice Place Must Visit.")
                ],
                ratingDetail: [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,
                            Amenity.CarbonMonoxide_Alarm,
                            Amenity.First_Aid_Kit,
                            Amenity.Fire_Extinguisher,
                            Amenity.Pool,
                            Amenity.Free_Parking,
                            Amenity.Pets_Allowed,
                            Amenity.Smoke_Alarm
                           ],
                location: Location(city: "Chennai", state: "TN", country: "India", address: "23/24 big map street"),
                images: [
                    "https://cdn.pixabay.com/photo/2017/04/30/15/12/apocalypse-2273069__480.jpg",
                    "https://cdn.pixabay.com/photo/2018/11/03/22/24/fire-3792951__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/11/24/21/49/bali-2975787__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/04/15/11/45/hotel-1330841__480.jpg",
                    "https://cdn.pixabay.com/photo/2012/11/21/10/24/building-66789__480.jpg",
                    "https://cdn.pixabay.com/photo/2014/07/21/19/20/lobby-398845__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/03/28/09/34/bedroom-1285156__480.jpg",
                    
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1110",
                placeName: " wind The Taj Restraunt with Sea View",
                description: "This upscale contemporary Japanese dining room in a hotel serves classics, sushi and rare sakes.",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "INR"),
                reviewDetail: [
                    Review(userID: "UD1108", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1103", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1104", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.I wouldn’t recommend hosting this guest. The guest broke the locks of the off-limit storage area of the house, which was explicitly stated in the welcome book that the storage room was not for guest use.Guests disrespected our Airbnb rules by throwing a house party and having five additional visitors stay in the Airbnb. When we issued an additional cleaning fee for the mess, the guest left a one-star review. Do not host this guest."),
                    Review(userID: "UD1105", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1106", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1107", userName: "Yogi", review: "Nice Place Must Visit.")
                ],
                ratingDetail: [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,
                            Amenity.CarbonMonoxide_Alarm,
                            Amenity.First_Aid_Kit,
                            Amenity.Fire_Extinguisher,
                            Amenity.Pool,
                            Amenity.Free_Parking,
                            Amenity.Pets_Allowed,
                            Amenity.Smoke_Alarm
                           ],
                location: Location(city: "Chennai", state: "TN", country: "India", address: "23/24 big map street"),
                images: [
                    "https://cdn.pixabay.com/photo/2014/09/27/17/35/dandelion-463928__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/02/27/08/50/cyclone-2102397__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/10/18/09/02/hotel-1749602__480.jpg",
                    "https://cdn.pixabay.com/photo/2019/08/19/13/58/bed-4416515__480.jpg",
                    "https://cdn.pixabay.com/photo/2020/10/18/09/16/bedroom-5664221__480.jpg",
                    "https://cdn.pixabay.com/photo/2019/05/28/00/15/indoors-4234071__480.jpg",
                    "https://cdn.pixabay.com/photo/2020/10/18/09/16/bedroom-5664221__480.jpg",
                    "https://cdn.pixabay.com/photo/2023/03/29/10/27/hotel-7885138__480.jpg"
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1111",
                placeName: "sun The Taj Restraunt with Sea View",
                description: "This upscale contemporary Japanese dining room in a hotel serves classics, sushi and rare sakes.",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "INR"),
                reviewDetail: [
                    Review(userID: "UD1108", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1103", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1104", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.I wouldn’t recommend hosting this guest. The guest broke the locks of the off-limit storage area of the house, which was explicitly stated in the welcome book that the storage room was not for guest use.Guests disrespected our Airbnb rules by throwing a house party and having five additional visitors stay in the Airbnb. When we issued an additional cleaning fee for the mess, the guest left a one-star review. Do not host this guest."),
                    Review(userID: "UD1105", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1106", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1107", userName: "Yogi", review: "Nice Place Must Visit.")
                ],
                ratingDetail: [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,
                            Amenity.CarbonMonoxide_Alarm,
                            Amenity.First_Aid_Kit,
                            Amenity.Fire_Extinguisher,
                            Amenity.Pool,
                            Amenity.Free_Parking,
                            Amenity.Pets_Allowed,
                            Amenity.Smoke_Alarm
                           ],
                location: Location(city: "Chennai", state: "TN", country: "India", address: "23/24 big map street"),
                images: [
                    "https://cdn.pixabay.com/photo/2016/07/02/12/21/eclipse-1492818__480.jpg",
                    "https://cdn.pixabay.com/photo/2014/03/26/17/50/sunset-298850__480.jpg",
                    "https://cdn.pixabay.com/photo/2021/12/11/07/59/hotel-6862159__480.jpg",
                    "https://cdn.pixabay.com/photo/2021/08/27/01/33/bedroom-6577523__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/06/10/01/05/hotel-room-1447201__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/01/14/12/48/hotel-1979406__480.jpg",
                    "https://cdn.pixabay.com/photo/2013/07/19/00/18/water-165219__480.jpg"
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1112",
                placeName: "moon The Taj Restraunt with Sea View",
                description: "This upscale contemporary Japanese dining room in a hotel serves classics, sushi and rare sakes.",
                hostId: "UD1103",
                noOfRooms: 10,
                noOfBedRooms: 3,
                noOfBathRooms: 2,
                noOfBeds: 4,
                noOfPeopleAccomodate: 12,
                isAvailable: true,
                price: Price(pricePerDay: 20000, taxPercentage: 12.0, currencyCode: "INR"),
                reviewDetail: [
                    Review(userID: "UD1108", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1103", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1104", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.I wouldn’t recommend hosting this guest. The guest broke the locks of the off-limit storage area of the house, which was explicitly stated in the welcome book that the storage room was not for guest use.Guests disrespected our Airbnb rules by throwing a house party and having five additional visitors stay in the Airbnb. When we issued an additional cleaning fee for the mess, the guest left a one-star review. Do not host this guest."),
                    Review(userID: "UD1105", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1106", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1107", userName: "Yogi", review: "Nice Place Must Visit.")
                ],
                ratingDetail: [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,
                            Amenity.CarbonMonoxide_Alarm,
                            Amenity.First_Aid_Kit,
                            Amenity.Fire_Extinguisher,
                            Amenity.Pool,
                            Amenity.Free_Parking,
                            Amenity.Pets_Allowed,
                            Amenity.Smoke_Alarm
                           ],
                location: Location(city: "Chennai", state: "TN", country: "India", address: "23/24 big map street"),
                images: [
                    "https://cdn.pixabay.com/photo/2016/11/25/23/15/moon-1859616__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/11/25/23/15/moon-1859616__480.jpg",
                    "https://cdn.pixabay.com/photo/2018/02/24/17/17/window-3178666__480.jpg",
                    "https://cdn.pixabay.com/photo/2016/09/18/03/28/travel-1677347__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/05/31/10/23/manor-house-2359884__480.jpg",
                    "https://cdn.pixabay.com/photo/2017/03/09/06/30/pool-2128578__480.jpg",
                    "https://cdn.pixabay.com/photo/2015/06/12/12/10/castle-park-806854__480.jpg"
                ],
                isWishListed: true
            )
        )
        
        return travelPlaceDetails
    }
    
    static func getImagesList(placeId : String) -> [String]?{
        for detail in travelPlaceDetails {
            if detail.placeId == placeId{
                return detail.images
            }
        }
        return nil
    }
}


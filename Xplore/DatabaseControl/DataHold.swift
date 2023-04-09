import Foundation

class DataHold{
    static let userDetails : [UserDetail] = getUserDetail()
    static let travelPlaceDetails : [TravelPlaceDetail] = getTravelPlaceDetails()
    
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
                placeName: "The Taj Restraunt with Sea View",
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
                    Review(userID: "UD1101", userName: "Yogi", review: "Nice Place Must Visit.I wouldn’t recommend hosting this guest. The guest broke the locks of the off-limit storage area of the house, which was explicitly stated in the welcome book that the storage room was not for guest use.Guests disrespected our Airbnb rules by throwing a house party and having five additional visitors stay in the Airbnb. When we issued an additional cleaning fee for the mess, the guest left a one-star review. Do not host this guest."),
                    Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1103", userName: "Yogi", review: "Nice Place Must Visit."),
                    Review(userID: "UD1104", userName: "Yogi", review: "Nice Place Must Visit."),
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
                    "https://cdn.pixabay.com/photo/2017/04/18/12/57/residence-2238987__480.jpg"
                ],
                isWishListed: true
            )
        )
        
        travelPlaceDetails.append(
            TravelPlaceDetail(
                placeId: "PD1102",
                placeName: "The Hotel Madeer Restraunt The New Exp",
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

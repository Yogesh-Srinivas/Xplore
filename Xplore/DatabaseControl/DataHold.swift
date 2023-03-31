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
                reviewDetail: [Review(userID: "UD1102", userName: "Yogi", review: "Nice Place Must Visit.")],
                ratingDetail: [Rating(userID: "1102", rating: 5.0)],
                amenities: [Amenity.Air_Conditioning,Amenity.CarbonMonoxide_Alarm,Amenity.First_Aid_Kit],
                location: Location(city: "Chennai", state: "TN", country: "India", address: "23/24 big map street"),
                images: ["https://cdn.pixabay.com/photo/2020/04/17/12/28/pool-5055009_1280.jpg","https://cdn.pixabay.com/photo/2020/04/17/12/28/pool-5055009_1280.jpg"]
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
                images: ["https://cdn.pixabay.com/photo/2020/04/17/12/28/pool-5055009_1280.jpg","https://cdn.pixabay.com/photo/2020/04/17/12/28/pool-5055009_1280.jpg"]
            )
        )
        
        return travelPlaceDetails
    }
}

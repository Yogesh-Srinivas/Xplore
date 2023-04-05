import UIKit

struct TravelPlaceDetail {
    let placeId : String
    var placeName : String
    var description : String
    let hostId : String
    var noOfRooms : Int
    var noOfBedRooms : Int
    var noOfBathRooms : Int
    var noOfBeds : Int
    var noOfPeopleAccomodate : Int
    var isAvailable : Bool
    var price : Price
    var reviewDetail : [Review]
    var ratingDetail : [Rating]
    var placeRating : Double{
        var sumOfRating = 0
        for rating in ratingDetail{
            sumOfRating += Int(rating.rating)
        }
        if ratingDetail.count == 0{
            return 0
        }
        return Double(sumOfRating / ratingDetail.count)
    }
    var amenities : [Amenity]
    let location : Location
    var images : [String]
    var isWishListed : Bool
}


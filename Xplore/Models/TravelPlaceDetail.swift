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
    var review : [Review]
    var rating : [Rating]
    var amenities : [Amenity]
    let location : Location
    var images : [String]
}


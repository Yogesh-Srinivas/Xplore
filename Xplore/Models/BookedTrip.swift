import Foundation

struct BookedTrip{
    let userId : String
    let placeId : String
    let BookedDateFrom : Date
    let BookedDateTo : Date
    let pricePerNight : Int
    let taxPercentage : Double
    let currencyCode : String
    var isVisited : Bool
}


import Foundation

struct BookedTrip{
    let userId : String
    let placeId : String
    let BookedDateFrom : DateComponents
    let BookedDateTo : DateComponents?
    let pricePerNight : Int
    let taxPercentage : Double
    let currencyCode : String
    var isVisited : Bool
}


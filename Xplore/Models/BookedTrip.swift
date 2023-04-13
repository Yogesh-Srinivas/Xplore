import Foundation

struct BookedTrip{
    let userId : String
    let placeId : String
    let BookedDateFrom : DateComponents
    let BookedDateTo : DateComponents?
    let pricePerDay : Int
    let taxPercentage : Double
    let currencyCode : String
    var isVisited : Bool
    let numberOfGuests : Int
    let cleaningFee : Int
    let serviceFee : Int
    var numberOfDays : Int {
        let fromDate = BookedDateFrom
        if let toDate = BookedDateTo,
           let numberOfDays = GeneralUtils.getNumberOfDays(from: fromDate, to: toDate){
            return numberOfDays
        }else{
            return 1
        }
    }
    var actualPrice : Int {
        return numberOfDays * pricePerDay
    }
    var taxes : Int {
        return Int(Double(actualPrice) * taxPercentage * 0.01)
    }
    var totalPrice : Int {
        return actualPrice + taxes
    }
}


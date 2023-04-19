import Foundation

struct BookedTrip{
    let userId : String
    let placeId : String
    let BookedDateFrom : DateComponents
    let BookedDateTo : DateComponents?
    var pricePerDay : Double
    var taxPercentage : Double
    var currencyCode : String
    var isVisited : Bool
    let numberOfGuests : Int
    var cleaningFee : Double
    var serviceFee : Double
    let reservationId : String
    var numberOfDays : Int {
        let fromDate = BookedDateFrom
        if let toDate = BookedDateTo,
           let numberOfDays = GeneralUtils.getNumberOfDays(from: fromDate, to: toDate){
            return numberOfDays
        }else{
            return 1
        }
    }
    var actualPrice : Double {
        return (Double(numberOfDays) * pricePerDay).round(to: 2)
    }
    var taxes : Double {
        return (Double(actualPrice) * taxPercentage * 0.01).round(to: 2)
    }
    var totalPrice : Double {
        return (actualPrice + taxes).round(to: 2)
    }
}


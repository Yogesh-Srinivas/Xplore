import Foundation

protocol DatabaseOperationDelegate {
    func loadUserDetailData(_ userDetails : [UserDetail])
    func loadTravelPlaceDetailData(_ travelPlaceDetail : [TravelPlaceDetail])
    func getAllPlacesDetails() -> [TravelPlaceDetail]
    func getTravelPlaceDetail(placeId : String) -> TravelPlaceDetail?
    func addToWishList(placeId : String, userId : String)
    func removeFromWishList(placeId : String, userId : String)
    func getImageLocalUrl(imageUrl : String) -> Bool
    func addImageUrl(imageUrl : String)
    func reservePlace(placeId : String,userId : String, fromDate : DateComponents,toDate : DateComponents?,pricePerDay : Int,tax : Double, currencyCode : String,cleaningFee : Int, serviceFee : Int,numberOfGuests : Int)
    func bookDates(placeId : String,datesToBook : [Date])
    func getBookedTripDetails(userId : String) -> [BookedTrip]
}

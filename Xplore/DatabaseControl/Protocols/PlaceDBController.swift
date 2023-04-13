import Foundation

protocol PlaceDBController{
    func getAllPlaceDetail() -> [TravelPlaceDetail]
    func getbookedTripDetail() -> [BookedTrip]
    func getPlaceDetail(placeId : String) -> TravelPlaceDetail?
    func addToWishList(placeId : String)
    func removeFromWishList(placeId : String)
    func reservePlace(placeId : String,fromDate : DateComponents,toDate : DateComponents?,pricePerDay : Int,tax : Double, currencyCode : String,numberOfGuests : Int)
}

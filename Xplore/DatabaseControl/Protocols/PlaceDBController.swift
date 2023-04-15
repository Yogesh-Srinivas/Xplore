import Foundation

protocol PlaceDBController{
    func getAllPlaceDetail() -> [TravelPlaceDetail]
    func getbookedTripDetail() -> [BookedTrip]
    func getPlaceDetail(placeId : String) -> TravelPlaceDetail?
    func addToWishList(placeId : String)
    func removeFromWishList(placeId : String)
    func reservePlace(tripDetails : BookedTrip)
    func cancelReservation(reservationId : String)
    func addRating(placeId : String,rating : Double)
    func addReview(placeId : String,review : String)
    func isUserRated(placeId : String) -> Bool
    func getReviews(placeId : String) -> [Review]
}

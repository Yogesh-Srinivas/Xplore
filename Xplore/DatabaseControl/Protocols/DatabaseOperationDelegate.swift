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
    func reservePlace(bookedTrip : BookedTrip)
    func bookDates(reservationId : String, placeId : String,datesToBook : [Date])
    func getBookedTripDetails(userId : String) -> [BookedTrip]
    func cancelBookedReservation(reservationId : String)
    func cancelPlaceAvailabilty(reservationId : String)
    func addRating(userId : String,placeId : String,rating : Double)
    func addReview(userId : String,placeId : String,review : String)
    func isUserRated(userId : String,placeId : String) -> Bool
    func getReviewDetail(placeId : String) -> [Review]
}

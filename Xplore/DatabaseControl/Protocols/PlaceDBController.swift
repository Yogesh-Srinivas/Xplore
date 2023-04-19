import Foundation

protocol PlaceDBController{
    func getAllPlaceDetail() -> [TravelPlaceDetail]
    func getbookedTripDetail() -> [BookedTrip]
    func getPlaceDetail(placeId : String) -> TravelPlaceDetail?
    func getAvailableLocations() -> [FilteredLocation]
    func getCurrencyList() -> [Currency]
    func getReviews(placeId : String) -> [Review]

    func addToWishList(placeId : String)
    func removeFromWishList(placeId : String)
    func reservePlace(tripDetails : BookedTrip)
    func cancelReservation(reservationId : String)
    func addRating(placeId : String,rating : Double)
    func addReview(placeId : String,review : String)
    func isUserRated(placeId : String) -> Bool
    func isPlaceAvailable(placeId : String,fromDate : DateComponents,toDate : DateComponents?) -> Bool
    func updateCurrencyPreference(currencyCode : String)
    func getHostDetail(hostId : String) -> UserDetail
    func isWishListed(placeId : String) -> Bool
    func getImageData(for imageUrl : String) -> Data?
    func getBookedDates(of placeId : String) -> [DateComponents]
}

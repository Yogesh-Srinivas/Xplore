import Foundation

protocol DatabaseOperationDelegate {
    
    func loadUserDetailData(_ userDetails : [UserDetail])
    func loadTravelPlaceDetailData(_ travelPlaceDetail : [TravelPlaceDetail])
    func loadCurrencyDetails(_ currencyList : [Currency])
    func loadCurrencyPreference(currencyPreferences : [(String,String)])
    
    func getAllPlacesDetails() -> [TravelPlaceDetail]
    func getTravelPlaceDetail(placeId : String) -> TravelPlaceDetail?
    func getAvailableLocations() -> [FilteredLocation]
    func getCurrencyList() -> [Currency]
    func getCurrencyValue(currenyCode : String) -> Double
    func getImageLocalUrl(imageUrl : String) -> Bool
    func getBookedTripDetails(userId : String) -> [BookedTrip]
    func getReviewDetail(placeId : String) -> [Review]
    
    func addToWishList(placeId : String, userId : String)
    func removeFromWishList(placeId : String, userId : String)
    func addImageUrl(imageUrl : String)
    func reservePlace(bookedTrip : BookedTrip)
    func bookDates(reservationId : String, placeId : String,datesToBook : [Date])
    func cancelBookedReservation(reservationId : String)
    func cancelPlaceAvailabilty(reservationId : String)
    func addRating(userId : String,placeId : String,rating : Double)
    func addReview(userId : String,placeId : String,review : String)
    func isUserRated(userId : String,placeId : String) -> Bool
    func isPlaceAvailable(placeId : String,datesToCheck : [Date]) -> Bool
    func isEmailExist(email : String)->Bool
    func getPassword(for email : String) -> String?
    func getUserId(for email : String) -> String?
    func getUserDetail(for userId : String) -> UserDetail
    func setCurrencyPreference(userId : String,currencyCode : String)
    func updateCurrencyPreference(userId : String,currencyCode : String)
    func getCurrencyPreference(userId : String) -> String
    func signUp(accountDetail : UserDetail)
    func isUserIdExist(userId : String) -> Bool
}

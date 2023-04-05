
protocol DatabaseOperationDelegate {
    func initializeDatabase()
    func loadUserDetailData(_ userDetails : [UserDetail])
    func loadTravelPlaceDetailData(_ travelPlaceDetail : [TravelPlaceDetail])
    func getAllPlacesDetails() -> [TravelPlaceDetail]
    func addToWishList(placeId : String, userId : String)
    func removeFromWishList(placeId : String, userId : String)

}

protocol ExploreDBController{
    func getAllPlaceDetail() -> [TravelPlaceDetail]
    func addToWishList(placeId : String)
    func removeFromWishList(placeId : String)
}

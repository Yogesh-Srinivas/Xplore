import Foundation
import UIKit
import SystemConfiguration

final class DatabaseController : PlaceDBController,FetchableImage,SessionDBController,UtilDBController{
    
    
    let databaseOperationDelegate : DatabaseOperationDelegate
    
    static let shared = DatabaseController()
    
    private init(){
        self.databaseOperationDelegate = DatabaseOperation.shared
        loadDatabase()
    }
    
    func loadDatabase(){
        
        databaseOperationDelegate.loadUserDetailData(DataHold.userDetails)
        databaseOperationDelegate.loadTravelPlaceDetailData(DataHold.travelPlaceDetails)
        databaseOperationDelegate.loadCurrencyDetails(DataHold.currencyList)
        databaseOperationDelegate.loadCurrencyPreference(currencyPreferences: DataHold.currencyPreference)
        
        for bookedDates in DataHold.bookedTrips{
            reservePlace(tripDetails: bookedDates)
        }
        
    }
    
    func getAllPlaceDetail() -> [TravelPlaceDetail]{
        var allPlaceDetails = databaseOperationDelegate.getAllPlacesDetails()
        
        for detailIndex in 0 ..< allPlaceDetails.count {
            //if placeDetails have no local images, fetch url from remote
            if allPlaceDetails[detailIndex].images.count == 0{
                if let images =  DataHold.getImagesList(placeId: allPlaceDetails[detailIndex].placeId){
                    allPlaceDetails[detailIndex].images = images
                }
            }
        }
        return allPlaceDetails
    }
    
    
    func addToWishList(placeId : String){
        databaseOperationDelegate.addToWishList(placeId: placeId, userId: GeneralUtils.getUserId())
    }
    
    func removeFromWishList(placeId : String){
        databaseOperationDelegate.removeFromWishList(placeId: placeId, userId: GeneralUtils.getUserId())
    }
    
    func isImageAvailableLocal(imageUrl : String) -> Bool{
        databaseOperationDelegate.getImageLocalUrl(imageUrl: imageUrl)
    }
    
    func addImageUrl(imageUrl : String){
        databaseOperationDelegate.addImageUrl(imageUrl : imageUrl)
    }
    
    func reservePlace(tripDetails : BookedTrip){
        databaseOperationDelegate.reservePlace(bookedTrip: tripDetails)
        
        bookPlace(reservationId : tripDetails.reservationId, placeId: tripDetails.placeId, fromDate: tripDetails.BookedDateFrom, toDate: tripDetails.BookedDateTo)
    }
    
    func cancelReservation(reservationId : String){
        databaseOperationDelegate.cancelPlaceAvailabilty(reservationId : reservationId)
        databaseOperationDelegate.cancelBookedReservation(reservationId: reservationId)
    }
    
    private func bookPlace(reservationId : String, placeId : String,fromDate : DateComponents,toDate : DateComponents?){
        
        var datesToBook : [Date] = []
        
        if let toDate = toDate{
            datesToBook = GeneralUtils.getDatesBetween(startDate: fromDate.date, endDate: toDate.date)
        }else{
            datesToBook.append(fromDate.date!)
        }
        
        databaseOperationDelegate.bookDates(reservationId: reservationId, placeId: placeId, datesToBook: datesToBook)
    }
    
    func getbookedTripDetail() -> [BookedTrip]{
        return databaseOperationDelegate.getBookedTripDetails(userId: GeneralUtils.getUserId())
    }
    
    func getPlaceDetail(placeId : String) -> TravelPlaceDetail?{
        if var placeDetail =  databaseOperationDelegate.getTravelPlaceDetail(placeId: placeId),let images = DataHold.getImagesList(placeId: placeId){

            placeDetail.images = images
            return placeDetail
            
        }
        return nil
        
    }
    
    func addRating(placeId : String,rating : Double){
        databaseOperationDelegate.addRating(userId: GeneralUtils.getUserId(), placeId: placeId, rating: rating)
    }
    func addReview(placeId : String,review : String){
        databaseOperationDelegate.addReview(userId: GeneralUtils.getUserId(), placeId: placeId, review: review)
    }
    func isUserRated(placeId : String) -> Bool{
        databaseOperationDelegate.isUserRated(userId: GeneralUtils.getUserId(), placeId: placeId)
    }
    
    func getReviews(placeId : String) -> [Review]{
        databaseOperationDelegate.getReviewDetail(placeId: placeId)
    }
    
    func isPlaceAvailable(placeId : String,fromDate : DateComponents,toDate : DateComponents?) -> Bool{
        
        var datesToCheck : [Date] = []
        
        if let toDate = toDate{
            datesToCheck.append(contentsOf:
                            GeneralUtils.getDatesBetween(
                                startDate: fromDate.date!,
                                endDate: toDate.date!)
                                )
        }else{
            datesToCheck.append(fromDate.date!)
        }
        
        return databaseOperationDelegate.isPlaceAvailable(placeId: placeId, datesToCheck: datesToCheck)
    }
    
    func getAvailableLocations() -> [FilteredLocation]{
        return databaseOperationDelegate.getAvailableLocations()
    }
    
    func getCurrencyValue(currenyCode : String) -> Double{
        return databaseOperationDelegate.getCurrencyValue(currenyCode: currenyCode)
    }
    
    func getCurrencyList() -> [Currency]{
        return databaseOperationDelegate.getCurrencyList()
    }

    
    func fetchImage(
        from imageUrl : String,
        completionHander : @escaping (_ imageData : Data?)->()
    ) {
        

                
        if isImageAvailableLocal(imageUrl: imageUrl), let imageLocalUrl = getImageDirUrl(for: imageUrl),
           FileManager.default.fileExists(atPath: imageLocalUrl.path){
            
            let loadedImageData = FetchableImageHelper.loadLocalImage(from: imageLocalUrl.path)
    
            completionHander(loadedImageData)
            
        }else{
            guard let url = URL(string: imageUrl)
                else {
                    completionHander(nil)
                    return
                }
            
            Task.init {
                if let imageData = await FetchableImageHelper.downloadImage(from: url) {
                    
                    if let imageLocalUrl = self.getImageDirUrl(for: imageUrl){
                        
                        FileManager.default.createFile(atPath: imageLocalUrl.path, contents: imageData)
                        
                        DispatchQueue.main.async {
                            self.addImageUrl(imageUrl: imageUrl)
                        }
    
                    }
                    
                    completionHander(imageData)
                }
            }
            
        }
        
    }
    
    
    func getImageDirUrl(for imageUrl : String) -> URL? {
        
        let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

        guard let imageName = FetchableImageHelper.getImageName(from: imageUrl) else{return nil}
        
        let imageDirURL = docDir.appendingPathComponent(imageName)
                
        return imageDirURL
        
    }
     
    func getImageData(for imageUrl : String) -> Data?{
        if  isImageAvailableLocal(imageUrl: imageUrl),
            let dirUrl = getImageDirUrl(for: imageUrl){
            if let data = FetchableImageHelper.loadLocalImage(from: dirUrl.path){
                return data
            }
        }
        return nil
    }
    
    func isEmailExist(email: String) -> Bool {
        databaseOperationDelegate.isEmailExist(email: email)
    }
    
    func validateLogin(email : String,password : String) -> String?{
        
        if !databaseOperationDelegate.isEmailExist(email: email){
            return nil
        }
        
        if let actualPassword = databaseOperationDelegate.getPassword(for: email){
            if actualPassword == password{
                return databaseOperationDelegate.getUserId(for: email)
            }else{
                return nil
            }
        }
        
        return nil
    }
    
    func getUserDetail() -> UserDetail {
        return databaseOperationDelegate.getUserDetail(for : GeneralUtils.getUserId())
    }
    
    func updateCurrencyPreference(currencyCode : String){
        databaseOperationDelegate.updateCurrencyPreference(userId: GeneralUtils.getUserId(), currencyCode: currencyCode)
    }
    
    func getCurrencyPreference() -> String{
        return databaseOperationDelegate.getCurrencyPreference(userId: GeneralUtils.getUserId())
    }
    
    func setCurrencyPreference(userId : String,currencyCode : String){
        databaseOperationDelegate.setCurrencyPreference(userId: userId, currencyCode: currencyCode)
    }
    
    func signUp(userName : String,email : String,mobile : String,password : String) -> String{
        let userId = GeneralUtils.generateUserId()
        let userDetail = UserDetail(
            userId: userId,
            userName: userName,
            email: email,
            mobile: mobile,
            password: password)
        databaseOperationDelegate.signUp(accountDetail: userDetail)
        databaseOperationDelegate.setCurrencyPreference(userId: userId, currencyCode: "USD")
        return userId
    }
    func isUserIdExist(userId : String) -> Bool{
        return databaseOperationDelegate.isUserIdExist(userId : userId)
    }
    
    func getHostDetail(hostId: String) -> UserDetail {
        return databaseOperationDelegate.getUserDetail(for: hostId)
    }
    
    func isWishListed(placeId: String) -> Bool {
        return databaseOperationDelegate.isPlaceWishListed(placeId: placeId, userId: GeneralUtils.getUserId())
    }
    func getBookedDates(of placeId : String) -> [DateComponents]{
        return databaseOperationDelegate.getBookedDates(of: placeId)
    }
    
    func getRatingDetail(placeId : String) -> [Rating]{
        return databaseOperationDelegate.getRatingDetail(placeId: placeId)
    }
}

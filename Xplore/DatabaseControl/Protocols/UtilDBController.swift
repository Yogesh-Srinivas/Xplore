protocol UtilDBController {
    func getCurrencyValue(currenyCode : String) -> Double
    func getCurrencyPreference() -> String
    func isUserIdExist(userId : String) -> Bool
}

protocol SessionDBController{
    func isEmailExist(email : String) -> Bool
    func validateLogin(email : String,password : String) -> String?
    func getUserDetail() -> UserDetail
    func setCurrencyPreference(userId : String,currencyCode : String)
    func signUp(userName : String,email : String,mobile : String,password : String) -> String
}

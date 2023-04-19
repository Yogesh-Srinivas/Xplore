import Foundation
class Authenticator{
    
    enum LoginAuthResponse{
        case EmailPasswordMismatch
        case AuthSuccess
    }
    static let databaseController : SessionDBController = DatabaseController.shared
    
    static func authenticateLogin(email : String,password : String)->LoginAuthResponse{
        
        if let userId = databaseController.validateLogin(email: email, password: password){
            UserDefaults.standard.setValue(userId, forKey: "userId")
            
            return LoginAuthResponse.AuthSuccess
        }else{
            return LoginAuthResponse.EmailPasswordMismatch
        }
    }
    
    static func isEmailExist(email :String) -> Bool{
        return databaseController.isEmailExist(email: email)
    }
    
    static func signUp(userName : String,email : String,mobile : String,password : String){
        let userId = databaseController.signUp(
            userName: userName,
            email: email,
            mobile: mobile,
            password: password)
        UserDefaults.standard.setValue(userId, forKey: "userId")
            
    }
}

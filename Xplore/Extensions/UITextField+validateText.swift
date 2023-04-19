import UIKit
extension UITextField{
    func validateText(for validatorType: ValidatorType) -> Bool{
        switch validatorType{
        case .Email:
            let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
            return emailPredicate.evaluate(with: self.text)
        case .Mobile:
            let mobileFormat = "^\\d{10}$"
            let mobilePredicate = NSPredicate(format:"SELF MATCHES %@", mobileFormat)
            return mobilePredicate.evaluate(with: self.text)
        case .Name:
            let nameFormat = "^([A-Za-z]{1,}\\s{0,1}){1,3}$"
            let namePredicate = NSPredicate(format:"SELF MATCHES %@", nameFormat)
            return namePredicate.evaluate(with: self.text)
        case .Password:
            let passwordFormat = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])[A-Za-z0-9]{6,16}$"
            let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordFormat)
            return passwordPredicate.evaluate(with: self.text)
        }
    }
}

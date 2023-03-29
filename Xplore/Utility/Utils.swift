import Foundation
import UIKit

class Utils{
    static func generateRandomImageName() -> String {
        let uniqueId = UUID().uuidString
        let randomName = "Image_" + uniqueId
        return randomName
    }
    
    static func showAlertMessage(message : String, viewController : UIViewController , durationInSeconds : Double){
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)

        viewController.present(alert, animated: true)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + durationInSeconds) {
            alert.dismiss(animated: true)
        }
    }
    
}

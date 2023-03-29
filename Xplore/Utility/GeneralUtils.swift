import Foundation

class GeneralUtils{
    static func generateRandomImageName() -> String {
        let uniqueId = UUID().uuidString
        let randomName = "Image_" + uniqueId
        return randomName
    }
    
    
}

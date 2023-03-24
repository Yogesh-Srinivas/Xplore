import Foundation

class Utils{
    static func generateRandomImageName() -> String {
        let uniqueId = UUID().uuidString
        let randomName = "Image_" + uniqueId
        return randomName
    }
}

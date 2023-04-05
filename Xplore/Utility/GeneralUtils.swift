import Foundation

class GeneralUtils{
    static func generateRandomImageName() -> String {
        let uniqueId = UUID().uuidString
        let randomName = "Image_" + uniqueId
        return randomName
    }
    static func getUserId() -> String {
        return "UD1101"
    }
    static func getMonthInString(month : Int) -> String{
        let monthList = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec",]
        return monthList[month-1]
    }
    
}

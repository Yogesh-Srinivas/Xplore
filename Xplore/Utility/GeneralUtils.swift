import Foundation

struct GeneralUtils{
    static var utilDBController : UtilDBController = DatabaseController.shared
    
    static func generateRandomImageName() -> String {
        let uniqueId = UUID().uuidString
        let randomName = "Image_" + uniqueId
        return randomName
    }
    
    static func getUserId() -> String {
        return UserDefaults.standard.string(forKey: "userId") ?? ""
    }
    
    static func generateUserId() -> String{
        var randomNum = "UD"+String(Int.random(in: 1000...9999))
        while utilDBController.isUserIdExist(userId : randomNum){
            randomNum = "UD"+String(Int.random(in: 1000...9999))
        }
        return randomNum
    }
    
    static func getCurrentCurrency() -> String{
        return utilDBController.getCurrencyPreference()
    }
    
    static func getMonthInString(month : Int) -> String{
        let monthList = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec",]
        return monthList[month-1]
    }
    static func getNumberOfDays(from fromDateComponent : DateComponents,to toDateComponent : DateComponents?) -> Int?{
        
        if let fromDate =  Calendar.current.date(from: fromDateComponent),let toDateComponent = toDateComponent,let toDate =  Calendar.current.date(from: toDateComponent){
            if let numberOfDays = Calendar.current.dateComponents([.day], from: fromDate, to: toDate).day {
                return numberOfDays + 1
            }
        }
        
        return nil
    }
    
    static func getDatesBetween(startDate: Date?, endDate: Date?) -> [Date] {
        var dates : [Date] = []
        
        if let startDate = startDate,let endDate = endDate{
            var currentDate = startDate
            
            while currentDate <= endDate {
                dates.append(currentDate)
                currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
            }
        }
        return dates
    }
    
    static func convertDateStringToComponent(dateString : String) -> DateComponents?{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        
        if let date = dateFormatter.date(from: dateString) {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
            return components
        }
        return nil
    }
    static func generateReservationUniqueID() -> String {
      
        let uuid = UUID().uuidString.replacingOccurrences(of: "-", with: "")
        let randomIndex = Int(arc4random_uniform(UInt32(uuid.count - 10)))
        let startIndex = uuid.index(uuid.startIndex, offsetBy: randomIndex)
        let endIndex = uuid.index(startIndex, offsetBy: 10)
        
        return String(uuid[startIndex..<endIndex]).uppercased()

    }
    
    static func convertCurrency(of amount: Double,from fromCurrencyCode : String,to toCurrencyCode : String) -> Double{
        let fromCurrencyValue = utilDBController.getCurrencyValue(currenyCode: fromCurrencyCode)
        let toCurrencyValue = utilDBController.getCurrencyValue(currenyCode: toCurrencyCode)
        return ((amount / fromCurrencyValue) * toCurrencyValue).round(to: 2)
    }

}

import Foundation

struct GeneralUtils{
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
    static func getNumberOfDays(from fromDateComponent : DateComponents,to toDateComponent : DateComponents?) -> Int?{
        if let fromDate = fromDateComponent.date,let toDateComponent = toDateComponent,let toDate = toDateComponent.date{
            let numberOfDays = Calendar.current.dateComponents([.day], from: fromDate, to: toDate).day
            return numberOfDays
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

}

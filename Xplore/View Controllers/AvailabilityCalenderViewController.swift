import UIKit

class AvailabilityCalenderViewController: UIViewController {
    private let NUMBER_OF_SECONDS_IN_A_YEAR = 31536000
    lazy private var calendarView = {
        let calendar = UICalendarView()
        return calendar
    }()
    private var selctedDates : [DateComponents] = []
    
    var bookedDates : [DateComponents] = [
        DateComponents(era: 1, year: 2023,month: 4,day: 11),
        DateComponents(era: 1, year: 2023,month: 4,day: 12),
        DateComponents(era: 1, year: 2023,month: 4,day: 13),

    ]
    
    let headerLabel = UILabel()
    let footerLabel = UILabel()
    let saveButton = {
        let button = UIButton()
        return button

    }()
    let footerView = UIView()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sample coloring
        headerLabel.backgroundColor = .systemPink
        footerView.backgroundColor = .systemPink
        saveButton.backgroundColor = .gray
        saveButton.setTitle("Save", for: .normal)

        
        view.addSubview(headerLabel)
        view.addSubview(footerView)
        footerView.addSubview(saveButton)
        footerView.addSubview(footerLabel)
        view.addSubview(calendarView)
        
        
        setupCalendar()
        setupHeaderLabel()
        setupFooterView()
    }
    
    func setupCalendar(){
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            calendarView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
            calendarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            calendarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            calendarView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor,multiplier: 0.8)
        
        ])
        
        calendarView.delegate = self
        calendarView.backgroundColor = .systemBackground
        calendarView.calendar = Calendar(identifier: .gregorian)
        calendarView.calendar.locale = .current
        
        calendarView.availableDateRange = DateInterval(start: .now, end: Date(timeIntervalSinceNow: TimeInterval(NUMBER_OF_SECONDS_IN_A_YEAR / 2)))
        calendarView.fontDesign = .monospaced
        
        calendarView.selectionBehavior = UICalendarSelectionMultiDate(delegate: self)
        
        setupBookedDatesCalender()
    }
    
    func setupBookedDatesCalender(){
        for bookedDateIndex in 0..<self.bookedDates.count{
            self.bookedDates[bookedDateIndex].calendar = calendarView.calendar
        }
    }
    
    func setupHeaderLabel(){
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headerLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor,multiplier: 0.1)
            
        ])
    }
    
    func setupFooterView(){
        footerView.translatesAutoresizingMaskIntoConstraints = false
        footerLabel.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            footerView.topAnchor.constraint(equalTo: calendarView.bottomAnchor),
            footerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            footerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
            
        ])
        
        NSLayoutConstraint.activate([
            footerLabel.topAnchor.constraint(equalTo: footerView.topAnchor),
            footerLabel.leadingAnchor.constraint(equalTo: footerView.leadingAnchor),
            footerLabel.bottomAnchor.constraint(equalTo: footerView.bottomAnchor),
            footerLabel.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor,multiplier: 0.6)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: footerView.topAnchor),
            saveButton.trailingAnchor.constraint(equalTo: footerView.trailingAnchor),
            saveButton.bottomAnchor.constraint(equalTo: footerView.bottomAnchor),
            saveButton.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor,multiplier: 0.4)
        ])
    }
}


extension AvailabilityCalenderViewController : UICalendarViewDelegate,UICalendarSelectionMultiDateDelegate{
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didSelectDate dateComponents: DateComponents) {
        
        let selectedDatesInCalender = selection.selectedDates

        if(selectedDatesInCalender.count == 2){
            var newSelectedDatesList : [DateComponents] = []
            let startDate = selectedDatesInCalender[0].date! < dateComponents.date! ? selectedDatesInCalender[0].date : dateComponents.date
            
            let endDate = selectedDatesInCalender[0].date! > dateComponents.date! ? selectedDatesInCalender[0].date : dateComponents.date
            
            
            
            if let startDate = startDate , let endDate = endDate{
                
                var tempDate = startDate
                while tempDate <= endDate{
                    let currentYearOfTempDate = calendarView.calendar.component(.year, from: tempDate)
                    let currentMonthOfTempDate  = calendarView.calendar.component(.month, from: tempDate)
                    let  currentDayOfTempDate  = calendarView.calendar.component(.day, from: tempDate)
                    
                    let newDateComponent = DateComponents(
                        calendar: dateComponents.calendar,
                        era: dateComponents.era,
                        year: currentYearOfTempDate,
                        month: currentMonthOfTempDate,
                        day: currentDayOfTempDate
                    )
                    
                    //If Select date Range contains any Booked dates
                    if(self.bookedDates.contains(newDateComponent)){
                        selection.setSelectedDates([], animated: true)
                        
                        self.selctedDates = []
                        Utils.showAlertMessage(message:  "Some Dates are already Booked ", viewController: self, durationInSeconds: 3)
                        
                        return
                    }
                    
                    newSelectedDatesList.append(newDateComponent)
                    
                    tempDate = calendarView.calendar.date(byAdding: .day, value: 1, to: tempDate)!
                }
            }
            
            selection.setSelectedDates(newSelectedDatesList, animated: true)
            self.selctedDates = newSelectedDatesList
            return
        }else if(!self.selctedDates.contains(dateComponents)){
            selection.setSelectedDates([dateComponents], animated: true)
        }
        self.selctedDates = [dateComponents]
        
    }
   
    
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didDeselectDate dateComponents: DateComponents) {
        selection.selectedDates = [dateComponents]
        self.selctedDates = [dateComponents]
    }
    
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, canSelectDate dateComponents: DateComponents) -> Bool {
        if self.bookedDates.contains(dateComponents) {
            return false
        }
        return true
    }
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        print("\(String(describing: dateComponents?.date))")
    }
    
    
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        if self.bookedDates.contains(dateComponents) {
            return .image(UIImage(systemName: "lock.fill"),color: .systemGray,size: .large)
        }
        return nil

    }
    
    
}


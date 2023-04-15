import UIKit

class CustomCalenderViewController: UIViewController {
    
    lazy var calendarView = {
        let calendar = UICalendarView()
        return calendar
    }()
    
    var selectedDates : [DateComponents] = []{
        didSet{
            saveButton.backgroundColor = selectedDates.count > 0 ? .systemPink : .systemGray
        }
    }
    
    var bookedDates : [DateComponents] = [
        DateComponents(era: 1, year: 2023,month: 4,day: 11),
        DateComponents(era: 1, year: 2023,month: 4,day: 12),
        DateComponents(era: 1, year: 2023,month: 4,day: 13),

    ]
   
    let headerView = UIView()
    
    lazy var cancelButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.tintColor = .label
        button.addTarget(self, action: #selector(cancelButtonOnTapAction), for: .touchDown)
        return button
    }()
    
    lazy var saveButton = {
        let button = UIButton()
        return button

    }()
    
    let footerView = UIView()

   
    let completionHandler : (DateComponents,DateComponents?)->()
    
    init(completionHandler: @escaping (_ fromDate : DateComponents,_ toDate : DateComponents?)->()){
        self.completionHandler = completionHandler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sample coloring
        headerView.backgroundColor = .systemBackground
        footerView.backgroundColor = .systemBackground
        saveButton.backgroundColor = .systemGray
        saveButton.setTitle("Save", for: .normal)
        self.view.backgroundColor = .systemBackground
        
        view.addSubview(headerView)
        headerView.addSubview(cancelButton)
        
        view.addSubview(footerView)
        footerView.addSubview(saveButton)
        view.addSubview(calendarView)
        
        
        setupCalendar()
        setupHeaderView()
        setupFooterView()
    }
    
    func setupCalendar(){
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            calendarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            calendarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            calendarView.topAnchor.constraint(equalTo: headerView.bottomAnchor)
        
        ])
        
        calendarView.delegate = self
        calendarView.backgroundColor = .systemBackground
        calendarView.calendar = Calendar(identifier: .gregorian)
        calendarView.calendar.locale = .current
        
        calendarView.availableDateRange = DateInterval(start: .now, end: Date(timeIntervalSinceNow: TimeInterval(Constants.NUMBER_OF_SECONDS_IN_A_YEAR / 2)))
        calendarView.fontDesign = .monospaced
        
        calendarView.selectionBehavior = UICalendarSelectionMultiDate(delegate: self)
        
        setupBookedDatesCalender()
    }
    
    func setupBookedDatesCalender(){
        for bookedDateIndex in 0..<self.bookedDates.count{
            self.bookedDates[bookedDateIndex].calendar = calendarView.calendar
        }
    }
    
    func setupHeaderView(){
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 60)
            
        ])
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: headerView.topAnchor,constant: 20),
            cancelButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant: 15),
            cancelButton.heightAnchor.constraint(equalToConstant: 20),
            cancelButton.widthAnchor.constraint(equalToConstant: 20),
        ])

    }
    
    func setupFooterView(){
        footerView.translatesAutoresizingMaskIntoConstraints = false
       
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            footerView.topAnchor.constraint(equalTo: calendarView.bottomAnchor),
            footerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            footerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
            
        ])
        
       
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: footerView.topAnchor,constant: 10),
            saveButton.trailingAnchor.constraint(equalTo: footerView.trailingAnchor,constant: -20),
            saveButton.bottomAnchor.constraint(equalTo: footerView.bottomAnchor,constant: -10),
            saveButton.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor,multiplier: 0.4)
        ])
        saveButton.layer.cornerRadius = 10
        
        saveButton.addTarget(self, action: #selector(saveButtonOnTapAction), for: .touchDown)
        
        
    }
    
    @objc private func saveButtonOnTapAction(){
        if selectedDates.count == 1{
            completionHandler(selectedDates[0],nil)
            dismiss(animated: true)
        }else if selectedDates.count > 1{
            completionHandler(selectedDates[0],selectedDates[selectedDates.count-1])
            dismiss(animated: true)
        }else{
            UIUtils.showAlertMessage(message: "Need to select atleast one Day", viewController: self, durationInSeconds: 2)
        }
    }
    
    @objc private func cancelButtonOnTapAction(){
        self.dismiss(animated: true)
    }
    
}


extension CustomCalenderViewController :UICalendarViewDelegate, UICalendarSelectionMultiDateDelegate {
    
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
                        
                        self.selectedDates = []
                        UIUtils.showAlertMessage(message:  "Some Dates are already Booked ", viewController: self, durationInSeconds: 1.5)
                        
                        return
                    }
                    
                    newSelectedDatesList.append(newDateComponent)
                    
                    tempDate = calendarView.calendar.date(byAdding: .day, value: 1, to: tempDate)!
                }
            }
            
            selection.setSelectedDates(newSelectedDatesList, animated: true)
            self.selectedDates = newSelectedDatesList
            return
        }else if(!self.selectedDates.contains(dateComponents)){
            selection.setSelectedDates([dateComponents], animated: true)
        }
        self.selectedDates = [dateComponents]
        
    }
   
    
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didDeselectDate dateComponents: DateComponents) {
        selection.selectedDates = [dateComponents]
        self.selectedDates = [dateComponents]
    }
    
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, canSelectDate dateComponents: DateComponents) -> Bool {
        if self.bookedDates.contains(dateComponents) {
            return false
        }
        return true
    }
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
    }
    
    
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        if self.bookedDates.contains(dateComponents) {
            return .image(UIImage(systemName: "lock.fill"),color: .systemGray,size: .large)
        }
        return nil

    }
    
    
}


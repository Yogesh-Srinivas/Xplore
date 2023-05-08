import UIKit

class AvailabilityCalenderViewController: CustomCalenderViewController {

    
    let headerLabel = {
        let label = UILabel()
        label.text = "choose your dates"
        return label
    }()
    
    let footerLabel = UILabel()
    
    override var selectedDates : [DateComponents] {
        didSet{
            
            headerLabel.text = "\(selectedDates.count) days in \(districtName)"
            
            footerLabel.text = "\(currencyCode) \((pricePerDay * Double(selectedDates.count)).round(to: 2))"
            
            saveButton.backgroundColor = selectedDates.count > 0 ? .systemPink : .systemGray4
            saveButton.isEnabled = selectedDates.count > 0 ? true : false
            
        }
    }
    
    let districtName : String
    let pricePerDay : Double
    let currencyCode : String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        footerView.addSubview(footerLabel)
        headerView.addSubview(headerLabel)
        
        setupFooterLabel()
        setupHeaderLabel()
    }
    
    init(districtName : String,pricePerDay : Double,currencyCode : String,bookedDates : [DateComponents],completionHandler: @escaping (_ fromDate : DateComponents,_ toDate : DateComponents?)->()){
        self.districtName = districtName
        self.pricePerDay = pricePerDay
        self.currencyCode = currencyCode
        super.init(completionHandler: completionHandler)
        
        loadBookedDates(bookedDates: bookedDates)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadBookedDates(bookedDates : [DateComponents]){
        for bookedDate in bookedDates{
            super.bookedDates.append( DateComponents(
                era: 1,
                year: bookedDate.year,
                month: bookedDate.month,
                day: bookedDate.day))
        }
        
    }
    
    func setSelectedDates(selectedDates : [DateComponents]){
        
        selectionBehaviour.selectedDates = []
        
        for selectedDate in selectedDates {
            var selectedDate = selectedDate
            selectedDate.calendar = calendarView.calendar
            selectionBehaviour.selectedDates.append(selectedDate)
        }
    }
    
    func setupHeaderLabel(){
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            headerLabel.leadingAnchor.constraint(equalTo: cancelButton.trailingAnchor,constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20)

        ])
        
        headerLabel.configPrimaryRegularStyle()
        headerLabel.textAlignment = .center
    }
    
    func setupFooterLabel(){
        footerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            footerLabel.topAnchor.constraint(equalTo: footerView.topAnchor),
            footerLabel.leadingAnchor.constraint(equalTo: footerView.leadingAnchor,constant: 20),
            footerLabel.bottomAnchor.constraint(equalTo: footerView.bottomAnchor)
        ])
        
        footerLabel.configSecondaryStyle()
    }
    

}

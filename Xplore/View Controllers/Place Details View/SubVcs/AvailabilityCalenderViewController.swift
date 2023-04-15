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
            
            footerLabel.text = "\(currencyCode) \(pricePerDay * selectedDates.count)"
            
            saveButton.backgroundColor = selectedDates.count > 0 ? .systemPink : .systemGray
            
        }
    }
    
    let districtName : String
    let pricePerDay : Int
    let currencyCode : String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        footerView.addSubview(footerLabel)
        headerView.addSubview(headerLabel)
        
        setupFooterLabel()
        setupHeaderLabel()
    }
    
    init(districtName : String,pricePerDay : Int,currencyCode : String,completionHandler: @escaping (_ fromDate : DateComponents,_ toDate : DateComponents?)->()){
        self.districtName = districtName
        self.pricePerDay = pricePerDay
        self.currencyCode = currencyCode
        super.init(completionHandler: completionHandler)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            footerLabel.bottomAnchor.constraint(equalTo: footerView.bottomAnchor),
//            footerLabel.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor,multiplier: 0.6)
        ])
        
        footerLabel.configSecondaryStyle()
    }
    

}

import UIKit

class ReservationViewController : UITableViewController {
    struct TripDetails{
        let placeName : String
        let dates : String
        let numberOfGuestes : Int
        let rating : Double
        let numberOfRating : Int
        var guestes : String {
            return String(numberOfGuestes)+" guests"
        }
    }
    
    struct PriceDetails{
        let pricePerDay : Int
        let cleaningFee : Int
        let serviceFee : Int
        let taxPercentage : Double
        let numberOfDays : Int
        let currencyCode : String
        
        var totalPrice : Int{
            return actualPrice + taxes + cleaningFee + serviceFee
        }
        var taxes : Int{
            return Int(Double(pricePerDay) * Double(numberOfDays) * taxPercentage)
        }
        var actualPrice : Int{
            return pricePerDay * numberOfDays
        }
    }
    
    let tripDetails = TripDetails(placeName : "Willow way - A Dream Wooden cottage in Himalayas",dates: "1-6 Apr", numberOfGuestes: 1,rating: 4.5,numberOfRating: 7)
    let priceDetails = PriceDetails(pricePerDay: 12000, cleaningFee: 600, serviceFee: 1500, taxPercentage: 12.5, numberOfDays: 3, currencyCode: "INR")
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(LabelWithButtonViewTableViewCell.self, forCellReuseIdentifier: String(describing: LabelWithButtonViewTableViewCell.self))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ReservationDetailCell")
    
    }
    
    private func configTripDetailsCell(_ rowIndex : Int,_ config : inout UIListContentConfiguration){
        if rowIndex == 0{
            config.secondaryText = self.tripDetails.dates
            config.text = "Dates"
        }else{
            config.secondaryText = self.tripDetails.guestes
            config.text = "Guests"
        }
        
    }
    private func configPriceDetailsCell(_ rowIndex : Int,_ config : inout UIListContentConfiguration){
        
        
        if rowIndex == 0{
            config.text = String(priceDetails.pricePerDay)+" x "+String(priceDetails.numberOfDays)
            config.secondaryText = String(priceDetails.actualPrice)
        }else if rowIndex == 1{
            config.text = "Cleaning Fee"
            config.secondaryText = String(priceDetails.cleaningFee)
        }else if rowIndex == 2{
            config.text = "Service Fee"
            config.secondaryText = String(priceDetails.serviceFee)
        }else if rowIndex == 3{
            config.text = "Taxes"
            config.secondaryText = String(priceDetails.taxes)
        }else if rowIndex == 4{
            
            config.text = "Total (\(priceDetails.currencyCode))"
            config.textProperties.font = .systemFont(ofSize: 19, weight: .bold)
            
            config.secondaryText = String(priceDetails.totalPrice)
            config.secondaryTextProperties.font = .systemFont(ofSize: 19, weight: .bold)
        }
        
    }
    private func configGroundRuleDetailsCell(_ config : inout UIListContentConfiguration){
        config.text = "We ask every guest to rember a few simple things about what makes a great guest.\n\n\(Constants.BULLETING_POINT) Follow the house rules\n\(Constants.BULLETING_POINT) Treat your Host's home like your own"
    }
    private func configHeaderCell(_ config : inout UIListContentConfiguration){
        config.image = UIImage(named: "test")
        config.imageProperties.reservedLayoutSize = CGSize(width: 150, height: 125)
        config.imageProperties.maximumSize = CGSize(width: 170, height: 125)
        config.imageProperties.cornerRadius = 15
        
        config.secondaryText = "\(Constants.RATING_STAR) \(tripDetails.rating) (\(tripDetails.numberOfRating))"
       
        config.text = tripDetails.placeName
        config.textProperties.font = .systemFont(ofSize: 19)
    }
    private func configFooterCell(_ footerCell : inout LabelWithButtonViewTableViewCell){
        footerCell.contentLabel.text = "By selecting the below button I agree to the Host's House Rules,Ground rules for guest and I'm responsible for the damage."
        
        footerCell.bottomButton.setTitle("Confirm and Reserve", for: .normal)
        
        //sample coloring
        footerCell.bottomButton.backgroundColor = .systemPink
    }

    
}

extension ReservationViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 1:
            return 2
        case 2:
            return 5
        default:
            return 1
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let defaultCell = tableView.dequeueReusableCell(withIdentifier: "ReservationDetailCell", for: indexPath)
        var config = UIListContentConfiguration.valueCell()
        
        switch indexPath.section{
            case 0:
                configHeaderCell(&config)
            case 1:
                configTripDetailsCell(indexPath.row,&config)
            case 2:
                configPriceDetailsCell(indexPath.row,&config)
            case 3:
                configGroundRuleDetailsCell(&config)
            default:
                var customCell = tableView.dequeueReusableCell(withIdentifier: String(describing: LabelWithButtonViewTableViewCell.self), for: indexPath) as! LabelWithButtonViewTableViewCell
                configFooterCell(&customCell)
                return customCell
        }
        
        defaultCell.contentConfiguration = config
        return defaultCell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 1:
            return "Your Trip"
        case 2:
            return "Price Details (\(priceDetails.currencyCode))"
        case 3:
            return "Ground Rules"
        default:
            return nil
        }
    }
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        nil
    }
    
    
}



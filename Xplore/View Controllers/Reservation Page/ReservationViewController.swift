import UIKit

final class ReservationViewController : UITableViewController {
    private struct TripDetails{
        let placeId : String
        let placeName : String
        let fromDate : DateComponents
        let toDate : DateComponents?
        let dates : String
        let numberOfGuestes : Int
        let rating : Double
        let numberOfRating : Int
        let city : String
        let imageUrl : String
        var guestes : String {
            return String(numberOfGuestes)+" guests"
        }
    }
    
    private struct PriceDetails{
        let pricePerDay : Double
        let cleaningFee : Double
        let serviceFee : Double
        let taxPercentage : Double
        let numberOfDays : Int
        let currencyCode : String
        
        var totalPrice : Double{
            return (actualPrice + taxes + cleaningFee + serviceFee).round(to: 2)
        }
        var taxes : Double{
            return (Double(pricePerDay) * Double(numberOfDays) * taxPercentage / 100).round(to: 2)
        }
        var actualPrice : Double{
            return (pricePerDay * Double(numberOfDays)).round(to: 2)
        }
    }
    
    private let tripDetails : TripDetails
    private let priceDetails : PriceDetails
    private let databaseController : PlaceDBController
    var headerImage : UIImage?
    
    init(fromDate : DateComponents,toDate : DateComponents?,placeDetail : TravelPlaceDetail,databaseController : PlaceDBController,headerImage : UIImage?){
        if let headerImage = headerImage{
            self.headerImage = headerImage
        }else{
            self.headerImage = UIImage(named: "loadingImage")
        }
        var dates = "\(fromDate.day!) \(GeneralUtils.getMonthInString(month: fromDate.month!))"
        
        var numberOfDays = 1
        
        if let toDate = toDate{
            dates += " - \(toDate.day!) \(GeneralUtils.getMonthInString(month: toDate.month!))"
            
            
            if let convertedNumberOfDates = GeneralUtils.getNumberOfDays(from: fromDate, to: toDate){
                numberOfDays = convertedNumberOfDates
            }
        }
        
        
        self.tripDetails = TripDetails(
            placeId : placeDetail.placeId,
            placeName: placeDetail.placeName,
            fromDate: fromDate,
            toDate: toDate,
            dates: dates,
            numberOfGuestes: 4,
            rating: placeDetail.placeRating,
            numberOfRating: placeDetail.ratingDetail.count,
            city: placeDetail.location.city,
            imageUrl: placeDetail.images[0]
        )
        
        self.priceDetails = PriceDetails(
            pricePerDay: placeDetail.price.pricePerDay,
            cleaningFee: ControlCenter.cleaningFee,
            serviceFee: ControlCenter.serviceFee,
            taxPercentage: placeDetail.price.taxPercentage,
            numberOfDays: numberOfDays,
            currencyCode: placeDetail.price.currencyCode)
        
        self.databaseController = databaseController
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        config.image = headerImage
        config.imageProperties.reservedLayoutSize = CGSize(width: 150, height: 125)
        config.imageProperties.maximumSize = CGSize(width: 170, height: 125)
        config.imageProperties.cornerRadius = 15
        
        
        config.secondaryText =  tripDetails.numberOfRating != 0 ? "\(Constants.RATING_STAR) \(tripDetails.rating) (\(tripDetails.numberOfRating))" : "\(Constants.RATING_STAR) new"
       
        config.text = tripDetails.placeName
        config.textProperties.font = .systemFont(ofSize: 19)
        config.textProperties.numberOfLines = 4
        
    }
    
    private func configFooterCell(_ footerCell : inout LabelWithButtonViewTableViewCell){
        
        footerCell.contentLabel.text = "By selecting the below button I agree to the Host's House Rules,Ground rules for guest and I'm responsible for the damage."
        
        footerCell.bottomButton.setTitle("Confirm and Reserve", for: .normal)
        
        footerCell.bottomButton.addTarget(self, action: #selector(reserveBottonOnTapAction), for: .touchDown)
        
        //sample coloring
        footerCell.bottomButton.backgroundColor = .systemPink
        
        footerCell.isUserInteractionEnabled = true
    }
    
    @objc private func reserveBottonOnTapAction(){
        let reservationId = GeneralUtils.generateReservationUniqueID()
        
        let reservedPlaceDetail = BookedTrip(
            userId: GeneralUtils.getUserId(),
            placeId: tripDetails.placeId,
            BookedDateFrom: tripDetails.fromDate,
            BookedDateTo: tripDetails.toDate,
            pricePerDay: priceDetails.pricePerDay,
            taxPercentage: priceDetails.taxPercentage,
            currencyCode: priceDetails.currencyCode,
            isVisited: false,
            numberOfGuests: tripDetails.numberOfGuestes,
            cleaningFee: ControlCenter.cleaningFee,
            serviceFee: ControlCenter.serviceFee,
            reservationId: reservationId
        )
        
        databaseController.reservePlace(tripDetails : reservedPlaceDetail)
        
        self.navigationController?.pushViewController(
            ReservationConfirmationViewController(
                location: tripDetails.city,
                reservationCode: reservationId,
                imageUrl: tripDetails.imageUrl), animated: true)
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



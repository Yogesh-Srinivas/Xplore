
import UIKit

final class ReservationConfirmationViewController: UITableViewController {
    
    let location = "Chennai"
    
    private let loadingView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
//
//        }
        self.view.setCustomBackground()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self,forCellReuseIdentifier: "TableViewCell")
        tableView.register(ReservationConfirmCustomCell.self,forCellReuseIdentifier: "ReservationConfirmCustomCell")
        
       
    }
    private func setloadingView(){
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
    private func configCell(row : Int, config : inout UIListContentConfiguration){
        switch row{
        case 1:
            config.text = "Host Info"
            config.textProperties.configSemiPrimary()
            
            config.secondaryText = "Host Name : arul\nMobile : 3403450943\nEmail : narul@gmail.com"
            config.secondaryTextProperties.configSecondaryFadedStyle()
        case 3:
            config.text = "Address"
            config.textProperties.configSemiPrimary()
            
            config.secondaryText = "23,dfdsfdsf vdfv,\nchennai,tamil nadu,\nindia"
            config.secondaryTextProperties.configSecondaryFadedStyle()
        case 4:
            config.text = "Guestes"
            config.textProperties.configSemiPrimary()
            
            config.secondaryText = "4"
            config.secondaryTextProperties.configSecondaryFadedStyle()
        case 5:
            config.text = "Amount"
            config.textProperties.configSemiPrimary()
            
            config.secondaryText = "INR 23,4500"
            config.secondaryTextProperties.configSecondaryFadedStyle()
        case 6:
            config.text = "Reservation Code"
            config.textProperties.configSemiPrimary()
            
            config.secondaryText = "SMLVXUI"
            config.secondaryTextProperties.configSecondaryFadedStyle()
        default:
            return
        }
    }
    
    private func addDatesView(cell : UITableViewCell){
        let datesView = StackViewWithCornorLabels(frame: .zero)
        datesView.leadingLabel.text = "Wednesday,\nOCT 29,\n2017"
        datesView.leadingLabel.configSemiPrimary()
        datesView.trailingLabel.text = "Wednesday,\nOCT 29,\n2017"
        datesView.trailingLabel.configSemiPrimary()

        datesView.translatesAutoresizingMaskIntoConstraints = false
        
        cell.contentView.addSubview(datesView)
        
        NSLayoutConstraint.activate([
            datesView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor,constant: 20),
            datesView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor,constant: -20),
            datesView.topAnchor.constraint(equalTo: cell.contentView.topAnchor,constant: 20),
            datesView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor,constant: -10)
        ])
    }
    
    private func addCheersButton(cell : UITableViewCell){
        let cheersButton = UIButton()
        cheersButton.setTitle("Cheers!", for: .normal)
        cheersButton.backgroundColor = .systemPink
        cheersButton.layer.cornerRadius = 5
        cheersButton.translatesAutoresizingMaskIntoConstraints = false
        
        cell.contentView.addSubview(cheersButton)
        
        NSLayoutConstraint.activate([
            cheersButton.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor,constant: 20),
            cheersButton.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor,constant: -20),
            cheersButton.topAnchor.constraint(equalTo: cell.contentView.topAnchor,constant: 10),
            cheersButton.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor,constant: -10)
        ])
        
        cheersButton.addTarget(self, action: #selector(cheersButtonOnTapAction), for: .touchDown)
    }
    
    @objc private func cheersButtonOnTapAction(){
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension ReservationConfirmationViewController {
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReservationConfirmCustomCell", for: indexPath) as! ReservationConfirmCustomCell
            
            cell.logoImage.image = UIImage(named: "appLogoWithName")
            cell.placeImage.image = UIImage(named: "test")
            cell.primaryLabel.text = "Your reservation is confirmed."
            cell.secondaryLabel.text = "Hurray! Pack your bags, You're going to \(location)."
            cell.selectionStyle = .none
            return cell
        
        case 2:
            addDatesView(cell: cell)
        case 1,3:
            var config = UIListContentConfiguration.subtitleCell()
            configCell(row: indexPath.row, config: &config)
            cell.contentConfiguration = config
        case 7:
            addCheersButton(cell : cell)
        default:
            var config = UIListContentConfiguration.valueCell()
            configCell(row: indexPath.row, config: &config)
            cell.contentConfiguration = config

        }
        cell.selectionStyle = .none
        return cell
    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        nil
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

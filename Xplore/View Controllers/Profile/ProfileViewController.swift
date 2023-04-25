import UIKit

class ProfileViewController: UITableViewController {

    let placeDBController : PlaceDBController
    let sessionDBController : SessionDBController
    let currencyList : [Currency]
    
    let userDetail : UserDetail
    
    init(placeDBController: PlaceDBController, sessionDBController: SessionDBController) {
        self.placeDBController = placeDBController
        self.sessionDBController = sessionDBController
        self.currencyList = placeDBController.getCurrencyList()
        self.userDetail = sessionDBController.getUserDetail()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ProfileTableCell")
        self.tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProfileHeader")
        self.tableView.isScrollEnabled = false
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.tabBar.backgroundColor = .systemBackground

        
        if let contentConfiguration = (tableView.cellForRow(at: IndexPath(row: 0, section: 0))?.contentConfiguration),var parsedContentConfiguration = contentConfiguration as? UIListContentConfiguration {
            parsedContentConfiguration.secondaryText = GeneralUtils.getCurrentCurrency()
            tableView.reloadData()
        }
    }
        
    private func configTabelCell(cell : UITableViewCell,row : Int){
        
        if row != 3 {
            cell.accessoryView = UIImageView(image: UIImage(systemName: "chevron.right"))
        }
        
        cell.accessoryView?.tintColor = .label
        
        var config = UIListContentConfiguration.valueCell()
        
        switch row{
        case 0 :
            config.text = "Currency"
            config.secondaryText = GeneralUtils.getCurrentCurrency()
//        case 1 :
//            config.text = "Security"
        case 1 :
            config.text = "Terms of Service"
        case 2 :
            config.text = "Privacy Policy"
        case 3:
            config.text = "Log Out"
            config.textProperties.color = .systemRed
        default:
            break
        }
        
        config.textProperties.configSecondaryStyle()
        
        cell.contentConfiguration = config
    }

}


extension ProfileViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableCell", for: indexPath)
        
        configTabelCell(cell: cell, row: indexPath.row)
        
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let profileHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileHeader") as! ProfileHeaderView
        
        
        profileHeaderView.profileIcon.image = UIImage(systemName: "\(userDetail.email.first ?? Character("")).circle")
        profileHeaderView.userLabel.text = userDetail.email
        
        return profileHeaderView
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row{
        case 0:
            self.navigationController?.pushViewController(
                CurrencyViewController(
                       databaseController: placeDBController
                ), animated: true)
        case 1:
            let termsOfServiceVC = InformationViewController(title: "Terms of Service", content: ControlCenter.TermsOfService)
        
            self.navigationController?.pushViewController(termsOfServiceVC, animated: true)
            
            
        case 2:
            let privacyPolicyVC = InformationViewController(title: "Privacy Policy", content: ControlCenter.PrivacyPolicy)
        
            self.navigationController?.pushViewController(privacyPolicyVC, animated: true)
        case 3:
            
            let logoutAlert = UIAlertController(title: "Log Out", message: "Are you sure you want to log out?", preferredStyle: UIAlertController.Style.alert)
            
            logoutAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

            logoutAlert.addAction(UIAlertAction(title: "Logout", style: .destructive, handler: { (action: UIAlertAction!) in
                
                UserDefaults.standard.removeObject(forKey: "userId")
                self.navigationController?.setViewControllers([LoginViewController()], animated: true)
            }))

            present(logoutAlert, animated: true, completion: nil)

           
        default:
            break
        }
        
    }
}

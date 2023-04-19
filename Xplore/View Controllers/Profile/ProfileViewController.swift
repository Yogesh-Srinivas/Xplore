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
    }
        
    private func configTabelCell(cell : UITableViewCell,row : Int){
        
        if row != 4 {
            cell.accessoryView = UIImageView(image: UIImage(systemName: "chevron.right"))
        }
        
        cell.accessoryView?.tintColor = .label
        
        var config = UIListContentConfiguration.sidebarHeader()
        
        switch row{
        case 0 :
            config.text = "Currency"
        case 1 :
            config.text = "Security"
        case 2 :
            config.text = "Terms of Service"
        case 3 :
            config.text = "Privacy Policy"
        case 4:
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
        return 5
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
        case 2:
            let termsOfServiceVC = InformationViewController(title: "Terms of Service", content: ControlCenter.TermsOfService)
        
            self.navigationController?.pushViewController(termsOfServiceVC, animated: true)
            
            
        case 3:
            let privacyPolicyVC = InformationViewController(title: "Privacy Policy", content: ControlCenter.PrivacyPolicy)
        
            self.navigationController?.pushViewController(privacyPolicyVC, animated: true)
        case 4:
            UserDefaults.standard.removeObject(forKey: "userId")
            self.navigationController?.setViewControllers([LoginViewController()], animated: true)
        default:
            break
        }
        
    }
}
import UIKit

class CurrencyViewController: UITableViewController {

    var currencyList : [Currency] = [Currency(currencyName: "Rupee1", currencyCode: "INR", currencyValue: 65.5),Currency(currencyName: "Rupee2", currencyCode: "INR", currencyValue: 65.5),Currency(currencyName: "Rupee3", currencyCode: "INR", currencyValue: 65.5),Currency(currencyName: "Rupee4", currencyCode: "INR", currencyValue: 65.5),Currency(currencyName: "Rupee5", currencyCode: "INR", currencyValue: 65.5)]
    
    var selectedIndexPath : IndexPath = IndexPath(row: 0, section: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self,forCellReuseIdentifier: "CurrencyTableCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyTableCell", for: indexPath)
        
        var config = UIListContentConfiguration.subtitleCell()
        config.text = currencyList[indexPath.row].currencyName
        cell.contentConfiguration = config
        cell.tintColor = .systemPink
        cell.selectionStyle = .none
        if indexPath == selectedIndexPath{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: selectedIndexPath)?.accessoryType = .none
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        selectedIndexPath = indexPath

    }
    
    
    
    
    
}

import UIKit

class CurrencyViewController: UITableViewController {

    let databaseController : PlaceDBController
    
    var currencyList : [Currency]
    
    var selectedIndexPath : IndexPath = IndexPath(row: 0, section: 0)
    
    init(databaseController : PlaceDBController){
       
        self.databaseController = databaseController
        self.currencyList = databaseController.getCurrencyList()

        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self,forCellReuseIdentifier: "CurrencyTableCell")
        updateSelectedIndex()
    }
    
    private func updateSelectedIndex(){
        let currentCurrencyIndex = currencyList.firstIndex{
            (currency) in currency.currencyCode == GeneralUtils.getCurrentCurrency() ? true : false
        }
        selectedIndexPath = IndexPath(row: currentCurrencyIndex ?? 0, section: 0)
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
        
        let currencyText = "\(currencyList[indexPath.row].currencyCode) - \(currencyList[indexPath.row].currencyName)"
        config.text = currencyText
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
        
        databaseController.updateCurrencyPreference(currencyCode: currencyList[indexPath.row].currencyCode)
    }
    
}

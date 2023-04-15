import UIKit

class WhereSearchBarViewController: UISearchController {

    lazy var districtList = [["india":("1","2","3")],["england":("1","2","3")],["america":("1","2","3")]]
    
    lazy var countryList = ["india","england","america"]
    
    lazy var primaryDatasource = countryList
    
    let placeDetailsTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.configBackgroundTheme()
        self.searchResultsUpdater = self
        self.searchBar.placeholder = "Pick your spot"
        
        self.view.addSubview(placeDetailsTableView)
        
        placeDetailsTableView.configBackgroundTheme()
        placeDetailsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "SearchResultCell")
        placeDetailsTableView.delegate = self
        placeDetailsTableView.dataSource = self
        
        setupPlaceDetailsTableView()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        placeDetailsTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: self.searchBar.frame.height + 5).isActive = true
    }
    
    private func setupPlaceDetailsTableView(){
        placeDetailsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            placeDetailsTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            placeDetailsTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            placeDetailsTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }
    
}

extension WhereSearchBarViewController: UISearchResultsUpdating,UITableViewDelegate,UITableViewDataSource {
    
    func updateSearchResults(for searchController: UISearchController){
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell", for: indexPath)
        var config = UIListContentConfiguration.subtitleCell()
        config.text = countryList[indexPath.row]
        
        cell.contentConfiguration = config
        
        return cell
    }
    
    
}

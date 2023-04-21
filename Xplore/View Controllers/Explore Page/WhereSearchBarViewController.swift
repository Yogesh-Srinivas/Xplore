import UIKit

class WhereSearchBarViewController: UISearchController {

    
    lazy var cityList : [FilteredLocation] = []
    
    lazy var stateList : [FilteredLocation] = []
    
    lazy var countryList : [FilteredLocation] = []
    
    lazy var filteredLocationList : [FilteredLocation] = []
        
    let placeDetailsTableView = UITableView()
    
    let completionHandler : (FilteredLocation)->()
    
    init(locationDetail : [FilteredLocation],completionHandler : @escaping (FilteredLocation)->()){
        
        self.completionHandler = completionHandler
        super.init(nibName: nil, bundle: nil)
        
        loadLocationDetails(locationDetail : locationDetail)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
            placeDetailsTableView.bottomAnchor.constraint(equalTo: self.view.keyboardLayoutGuide.bottomAnchor, constant: -10),
        ])
    }
    
    private func loadLocationDetails(locationDetail : [FilteredLocation]){
        
        cityList = []
        stateList = []
        countryList = []
        filteredLocationList = []
        
        for detail in locationDetail {
            
            var countryDetail = detail
            countryDetail.state = nil
            countryDetail.city = nil
            
            if !isListContains(locationList: countryList, locationDetail: countryDetail){
                countryList.append(FilteredLocation(country: detail.country, state: nil, city: nil))
                filteredLocationList.append(FilteredLocation(country: detail.country, state: nil, city: nil))
            }
            
            var stateDetail = detail
            stateDetail.city = nil
            
            if !isListContains(locationList: stateList, locationDetail: stateDetail){
                stateList.append(FilteredLocation(country: detail.country, state: detail.state, city: nil))
                filteredLocationList.append(FilteredLocation(country: detail.country, state: detail.state, city: nil))
            }
            
        }
        
        cityList = locationDetail
        filteredLocationList = locationDetail
    }
    
    private func isListContains(locationList : [FilteredLocation],locationDetail : FilteredLocation) -> Bool{
        for list in locationList {
            if list == locationDetail{
                return true
            }
        }
        return false
    }
    
    private func filterPlaces(searchString : String?){
        
        if let searchString = searchString{
            
            let searchString = searchString.lowercased()
            
            filteredLocationList = []
            
            for location in countryList {
                if location.country.lowercased().starts(with: searchString){
                    filteredLocationList.append(location)
                }
            }
            
            for location in stateList {
                
                if let state = location.state?.lowercased(){
                    
                    let country = location.country.lowercased()
                    
                    if state.starts(with: searchString) || country.starts(with: searchString){
                        filteredLocationList.append(location)
                    }
                }
            }
            
            for location in cityList {
                
                if let city = location.city?.lowercased(),
                    let state = location.state?.lowercased(){
                    
                    let country = location.country.lowercased()
                    
                    if city.starts(with: searchString) || state.starts(with: searchString) || country.starts(with: searchString){
                        filteredLocationList.append(location)
                    }
                }
            }
            
        }else{
            loadLocationDetails(locationDetail: cityList)
        }
        
        placeDetailsTableView.reloadData()
    }
    
}

extension WhereSearchBarViewController: UISearchResultsUpdating,UITableViewDelegate,UITableViewDataSource {
    
    func updateSearchResults(for searchController: UISearchController){
        filterPlaces(searchString: searchController.searchBar.text)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredLocationList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell", for: indexPath)
        
        let locationDetail = filteredLocationList[indexPath.row]
        var config = UIListContentConfiguration.subtitleCell()
        
        var locationString = ""
        
        if let city = locationDetail.city{
            locationString = city + ", "
        }
        
        
        if let state = locationDetail.state{
            locationString += state + ", "
        }
        
        locationString += locationDetail.country
         
        config.text = locationString
        
        cell.contentConfiguration = config
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        completionHandler(filteredLocationList[indexPath.row])
        self.dismiss(animated: true)
    }
    
    
}

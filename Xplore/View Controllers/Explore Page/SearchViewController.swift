import UIKit

class SearchViewController: UIViewController {
    
    let databaseController : PlaceDBController
    let completionHandler : (DateComponents?, DateComponents?,GuestInfo,FilteredLocation?)->()
    
    lazy var contentScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var whenView = {
        let sectionedView = SectionView(frame: .zero, contentView: UIStackView(), titleText: "When")
        return sectionedView
    }()
    
    lazy var whenLabelButton = {
        let button = UIButton()
        button.setTitle("change", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.underline()
        button.titleLabel?.configSecondaryStyle()
        button.addTarget(self, action: #selector(whenButtonOnTapAction), for: .touchDown)
    
        return button
    }()
    
    lazy var customCalenderView = {
        let calenderView = CustomCalenderViewController{
                [unowned self](fromDate,toDate) in
                self.fromDate = fromDate
                self.toDate = toDate
                }
        return calenderView
    }()
    
    lazy var whenLabel = {
        let label = UILabel()
        label.text = "I'm flexible"
        label.configSemiPrimary()
        return label
    }()
    
    lazy var whoView = {
        let sectionedView = SectionView(frame: .zero, contentView: UIStackView(), titleText: "Who")
        return sectionedView
    }()
    
    lazy var adultStepperView = {
        let stepperView = CustomStepperView(frame: .zero,maxValue: 16,minValue: 1,titleText: "Adult",subTitleText: "Ages 13 or above"){
            [unowned self](value) in self.guestInfo.numberOfAdult = value
        }
        return stepperView
    }()
    
    lazy var childrenStepperView = {
        let stepperView = CustomStepperView(frame: .zero,maxValue: 12,minValue: 0,titleText: "Children",subTitleText: "Ages 2-12"){
            [unowned self](value) in self.guestInfo.numberOfChildren = value
        }
        return stepperView
    }()
    
    lazy var infantStepperView = {
        let stepperView = CustomStepperView(frame: .zero,maxValue: 5,minValue: 0,titleText: "Infants",subTitleText: "Under 2"){
            [unowned self](value) in self.guestInfo.numberOfInfant = value
        }
        return stepperView
    }()


    lazy var whereView = {
        let sectionedView = SectionView(frame: .zero, contentView: UIStackView(), titleText: "Where")
        return sectionedView
    }()
    
    lazy var whereLabelButton = {
        let button = UIButton()
        button.setTitle("change", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.underline()
        button.titleLabel?.configSecondaryStyle()
        button.addTarget(self, action: #selector(whereButtonOnTapAction), for: .touchDown)
    
        return button
    }()
    
    lazy var whereLabel = {
        let label = UILabel()
        label.text = "I'm flexible"
        label.configSemiPrimary()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    
    var fromDate : DateComponents? = nil{
        didSet{
            if let fromDate = fromDate{
                whenLabel.text = "on \(fromDate.day!) \(GeneralUtils.getMonthInString(month: fromDate.month!) )"
            }
        }
    }
    
    var toDate : DateComponents? = nil{
        didSet{
            if let fromDate = fromDate,let toDate = toDate{
                whenLabel.text = "\(fromDate.day!) \(GeneralUtils.getMonthInString(month: fromDate.month!))  to  \(toDate.day!) \(GeneralUtils.getMonthInString(month: toDate.month!))"
            }
        }
    }
    
    var guestInfo = GuestInfo(numberOfAdult: 1, numberOfChildren: 0, numberOfInfant: 0)
    
    var filteredLocation : FilteredLocation? = nil{
        didSet{
            var locationString = ""
            
            if let filteredLocation = filteredLocation{
                if let city = filteredLocation.city{
                    locationString = city + ", "
                }
                
                
                if let state = filteredLocation.state{
                    locationString += state + ", "
                }
                
                locationString += filteredLocation.country
                
                whereLabel.text = locationString
            }
        }
    }
    
    lazy var footerView = {
        let view = UIView()
        view.configBackgroundTheme()
        return view
    }()
    
    lazy var searchButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.setTitle("Search", for: .normal)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(searchButtonOnTapAction), for: .touchDown)
        button.layer.cornerRadius = 10
        button.titleLabel?.configSemiPrimary()
        button.configHighlightTheme()
        return button
    }()
    
    lazy var clearButton = {
        let button = UIButton()
        button.setTitle("clear all", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.underline()
        button.addTarget(self, action: #selector(clearButtonOnTapAction), for: .touchDown)
        button.titleLabel?.configSecondaryStyle()
        return button
    }()
    
    private let paddingView = UIView()
    
    init(databaseController : PlaceDBController,completionHandler : @escaping (DateComponents?, DateComponents?,GuestInfo,FilteredLocation?)->()){
        
        self.databaseController = databaseController
        self.completionHandler = completionHandler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.configBackgroundTheme()
        
        view.addSubview(contentScrollView)
        view.addSubview(footerView)
        contentScrollView.addSubview(whenView)
        contentScrollView.addSubview(UIUtils.getSeparator(size: 1))
        contentScrollView.addSubview(whoView)
        contentScrollView.addSubview(UIUtils.getSeparator(size: 1))
        contentScrollView.addSubview(whereView)
        contentScrollView.addSubview(paddingView)
        
        footerView.addSubview(clearButton)
        footerView.addSubview(searchButton)
        
        setupContentScrollView()
        setupWhenView()
        setupWhoView()
        setupWhereView()
        setupFooterView()
        setupPaddingView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.title = "Search"
    }
    
    private func setupPaddingView(){
        paddingView.translatesAutoresizingMaskIntoConstraints = false
      
        paddingView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        paddingView.topAnchor.constraint(equalTo: whereView.bottomAnchor, constant: 5).isActive = true
    }
    
    func setupContentScrollView(){
        
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        let scrollViewChildren = contentScrollView.subviews
        
        for childIndex in 0..<scrollViewChildren.count{
            let child = scrollViewChildren[childIndex]
            let widthPadingSize = 20.0
            child.translatesAutoresizingMaskIntoConstraints = false
            switch childIndex{
            case 0:
                NSLayoutConstraint.activate([
                    child.topAnchor.constraint(equalTo: contentScrollView.topAnchor)
                ])
            case scrollViewChildren.count - 1:
                NSLayoutConstraint.activate([
                    child.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor)
                ])
            default:
                NSLayoutConstraint.activate([
                    child.topAnchor.constraint(equalTo: scrollViewChildren[childIndex-1].bottomAnchor,constant: 20),
                    child.bottomAnchor.constraint(equalTo: scrollViewChildren[childIndex+1].topAnchor,constant: -20)
    
                ])
            }
            
            NSLayoutConstraint.activate([
                child.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: widthPadingSize),
                child.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -widthPadingSize)
            ])
        }
    
    }
    
    private func setupWhenView(){
        
        whenLabelButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            whenLabelButton.heightAnchor.constraint(equalToConstant: 45),
            whenLabelButton.widthAnchor.constraint(equalToConstant: 105)
        ])
        
        let whenContentView = whenView.contentView as! UIStackView
        whenContentView.addArrangedSubview(whenLabel)
        whenContentView.addArrangedSubview(whenLabelButton)
        
        whenContentView.axis = .horizontal
        whenContentView.distribution = .equalSpacing
    }
    
    private func setupWhoView(){
        
        let whoContentView = whoView.contentView as! UIStackView
        whoContentView.axis = .vertical
        whoContentView.spacing = 10
        
       
        
        
        whoContentView.addArrangedSubview(adultStepperView)
        whoContentView.addArrangedSubview(childrenStepperView)
        whoContentView.addArrangedSubview(infantStepperView)
    }
    
    private func setupWhereView(){
        whereLabelButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            whereLabelButton.heightAnchor.constraint(equalToConstant: 45),
            whereLabelButton.widthAnchor.constraint(equalToConstant: 105)
        ])
        
        let whereContentView = whereView.contentView as! UIStackView
        whereContentView.addArrangedSubview(whereLabel)
        whereContentView.addArrangedSubview(whereLabelButton)
        
        whereContentView.axis = .horizontal
        whereContentView.distribution = .equalSpacing
    }
    
    @objc private func whenButtonOnTapAction(){
        self.present(customCalenderView , animated: true)
    }
    
    private func setupFooterView(){

        setupClearButton()
        setupSearchButton()
                
        footerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            footerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 65)
        ])
        
        footerView.layer.shadowColor = UIColor.tertiaryLabel.cgColor
        footerView.layer.shadowRadius = 1
        footerView.layer.shadowOffset = CGSize(width: 0, height: -1)
        footerView.layer.masksToBounds = false
        footerView.layer.shadowOpacity = 1
        
    }
    
    private func setupClearButton(){
        
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            clearButton.leadingAnchor.constraint(equalTo: footerView.leadingAnchor,constant: 20),
            clearButton.topAnchor.constraint(equalTo: footerView.topAnchor,constant: 10),
            clearButton.bottomAnchor.constraint(equalTo: footerView.bottomAnchor,constant: -10)
        ])
        
    }
    
    private func setupSearchButton(){
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchButton.trailingAnchor.constraint(equalTo: footerView.trailingAnchor,constant: -20),
            searchButton.topAnchor.constraint(equalTo: footerView.topAnchor,constant: 10),
            searchButton.bottomAnchor.constraint(equalTo: footerView.bottomAnchor,constant: -10),
            searchButton.widthAnchor.constraint(equalTo: footerView.widthAnchor, multiplier: 0.3)
        ])
        
        searchButton.addTarget(self, action: #selector(searchButtonOnTapAction), for: .touchDown)
    
    }
    
    @objc private func searchButtonOnTapAction(){
        completionHandler(fromDate,toDate,guestInfo,filteredLocation)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func clearButtonOnTapAction(){
        self.fromDate = nil
        self.toDate = nil
        self.guestInfo = GuestInfo(numberOfAdult: 1, numberOfChildren: 0, numberOfInfant: 0)
        self.filteredLocation = nil
        
        whenLabel.text = "I'm flexible"
        whereLabel.text = "I'm flexible"
        
        
        adultStepperView.contentStepper.value = 1
        childrenStepperView.contentStepper.value = 0
        infantStepperView.contentStepper.value = 0
        
        adultStepperView.stepperValueLabel.text = "1"
        childrenStepperView.stepperValueLabel.text = "0"
        infantStepperView.stepperValueLabel.text = "0"
        
        customCalenderView = {
            let calenderView = CustomCalenderViewController{
                    [unowned self](fromDate,toDate) in
                    self.fromDate = fromDate
                    self.toDate = toDate
                    }
            return calenderView
        }()
    }
    
    @objc private func whereButtonOnTapAction(){
        self.present(
            WhereSearchBarViewController(
                locationDetail: databaseController.getAvailableLocations()
            ){
                [unowned self](filteredLocation) in
                self.filteredLocation = filteredLocation
            },
            animated: true
        )
    }
    

}

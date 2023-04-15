import UIKit

class SearchViewController: UIViewController {
    
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
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.configSecondaryStyle()
        button.configHighlightTheme()
        button.addTarget(self, action: #selector(whenButtonOnTapAction), for: .touchDown)
        
        button.layer.cornerRadius = 5

        return button
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


    lazy var whereView = {
        let sectionedView = SectionView(frame: .zero, contentView: UIStackView(), titleText: "Where")
        return sectionedView
    }()
    
    lazy var whereLabelButton = {
        let button = UIButton()
        button.setTitle("change", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.configSecondaryStyle()
        button.configHighlightTheme()
        button.addTarget(self, action: #selector(whereButtonOnTapAction), for: .touchDown)
        
        button.layer.cornerRadius = 5

        return button
    }()
    
    lazy var whereLabel = {
        let label = UILabel()
        label.text = "I'm flexible"
        label.configSemiPrimary()
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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.configBackgroundTheme()
        
        view.addSubview(contentScrollView)
        contentScrollView.addSubview(whenView)
        contentScrollView.addSubview(UIUtils.getSeparator(size: 1))
        contentScrollView.addSubview(whoView)
        contentScrollView.addSubview(UIUtils.getSeparator(size: 1))
        contentScrollView.addSubview(whereView)
        
        setupContentScrollView()
        setupWhenView()
        setupWhoView()
        setupWhereView()
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
        
        let adultStepperView = CustomStepperView(frame: .zero,maxValue: 16,minValue: 1,titleText: "Adult",subTitleText: "Ages 13 or above")
        let childrenStepperView = CustomStepperView(frame: .zero,maxValue: 12,minValue: 0,titleText: "Children",subTitleText: "Ages 2-12")
        let infantStepperView = CustomStepperView(frame: .zero,maxValue: 5,minValue: 0,titleText: "Infants",subTitleText: "Under 2")
        
        
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
        self.present(
            CustomCalenderViewController{
                
            [unowned self](fromDate,toDate) in
            self.fromDate = fromDate
            self.toDate = toDate
                
        }, animated: true)
    }
    
    @objc private func whereButtonOnTapAction(){
        self.present(
            WhereSearchBarViewController(
//                searchResultsController: WhereSearchResultTableViewController()
            ),
            animated: true
        )
    }
    

}

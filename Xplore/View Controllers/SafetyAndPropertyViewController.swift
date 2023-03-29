import UIKit

class SafetyAndPropertyViewController: UIViewController {
    lazy var headerView = {
        let textLabel = UILabel()
        textLabel.text = "Avoid surprises by looking over theses important details about your Host's property."
        textLabel.font = .systemFont(ofSize: 20)
        textLabel.numberOfLines = 0
        let sectionView = SectionView(frame: CGRect.zero, contentView: textLabel, titleText: "Safety & Property")
        sectionView.titleView.font = .systemFont(ofSize: 25, weight: .bold)
        return sectionView
    }()
    
    lazy var propertyInfoView = {
        SectionView(frame: CGRect.zero, contentView: UIStackView(), titleText: "Property Info")
    }()
    
    lazy var safetyDevicesView = {
        SectionView(frame: CGRect.zero, contentView: UIStackView(), titleText: "Safety devices")
    }()
    
    lazy var safetyConsiderationsView = {
        SectionView(frame: CGRect.zero, contentView: UIStackView(), titleText: "Safety Considerations")
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(headerView)
        view.addSubview(safetyConsiderationsView)
        view.addSubview(safetyDevicesView)
        view.addSubview(propertyInfoView)
        
        setupHeaderView()
        setupPropertyInfoView()
        setupSafetyConsiderationsView()
        setupSafetyDevicesView()
        
    }
    private func setupHeaderView(){
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20)
        ])
        
        
    }

    private func setupSafetyConsiderationsView(){
        safetyConsiderationsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            safetyConsiderationsView.topAnchor.constraint(equalTo: headerView.contentView.bottomAnchor,constant: 20),
            safetyConsiderationsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            safetyConsiderationsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20)
        ])
        let contentView = safetyConsiderationsView.contentView as! UIStackView
        
        let notSuitableForInfantLabel = getIconedLabel(imageSystemName: "stroller", labelText: "Not suitable for infants (under 2 years)")

        contentView.addArrangedSubview(notSuitableForInfantLabel)
        
        notSuitableForInfantLabel.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.06).isActive = true
        
        contentView.axis = .vertical
        contentView.alignment = .leading
        
        
    }
    
    private func  setupSafetyDevicesView(){
        safetyDevicesView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            safetyDevicesView.topAnchor.constraint(equalTo: safetyConsiderationsView.bottomAnchor,constant: 10),
            safetyDevicesView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            safetyDevicesView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20)
        ])
        
        let contentView = safetyDevicesView.contentView as! UIStackView
        
        let checkInLabel = getIconedLabel(imageSystemName: "clock", labelText: "Check-In: 11:00 - 19:00")
        let checkOutLabel = getIconedLabel(imageSystemName: "clock", labelText: "Check-Out before 11:00")
        let smokingLabel = getIconedLabel(imageSystemName: "wineglass", labelText: "Alcohol is not allowed")
        
        contentView.addArrangedSubview(checkInLabel)
        contentView.addArrangedSubview(checkOutLabel)
        contentView.addArrangedSubview(smokingLabel)
        
        checkInLabel.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.06).isActive = true
        checkOutLabel.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.06).isActive = true
        smokingLabel.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.06).isActive = true
        
        contentView.axis = .vertical
        contentView.alignment = .leading
    }
    
    private func setupPropertyInfoView(){
        propertyInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            propertyInfoView.topAnchor.constraint(equalTo: safetyDevicesView.bottomAnchor,constant: 10),
            propertyInfoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            propertyInfoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20)

        ])
        
        let contentView = propertyInfoView.contentView as! UIStackView
        
        let petsPropertyLabel = getIconedLabel(imageSystemName: "pawprint", labelText: "Pet(s) live on property")

        contentView.addArrangedSubview(petsPropertyLabel)
        
        petsPropertyLabel.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.06).isActive = true
        
        contentView.axis = .vertical
        contentView.alignment = .leading
        
    }
    
    
    private func getIconedLabel(imageSystemName : String,labelText : String) -> IconedLabelView{
        let iconedLabelView = IconedLabelView(frame: .zero)
        iconedLabelView.iconImageView.image = UIImage(systemName: imageSystemName)
        iconedLabelView.contentLabel.text = labelText
        return iconedLabelView
    }
}

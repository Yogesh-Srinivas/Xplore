import UIKit

class SafetyAndPropertyViewController: UIViewController {
    lazy var headerView = {
        let textLabel = UILabel()
        textLabel.text = "Avoid surprises by looking over theses important details about your Host's property."
        textLabel.configSecondaryRegularStyle()
        textLabel.numberOfLines = 0
        let sectionView = SectionView(frame: CGRect.zero, contentView: textLabel, titleText: "Safety & Property")
        sectionView.titleView.configPrimaryStyle()
        return sectionView
    }()
    
    lazy var cancelButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.tintColor = .label
        button.addTarget(self, action: #selector(cancelButtonOnTapAction), for: .touchDown)
        return button
    }()
    
    lazy var contentScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
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
        view.addSubview(cancelButton)
        view.addSubview(contentScrollView)
        contentScrollView.addSubview(headerView)
        contentScrollView.addSubview(safetyConsiderationsView)
        contentScrollView.addSubview(safetyDevicesView)
        contentScrollView.addSubview(propertyInfoView)
        
        setupCancelButton()
        setupScrollView()
        setupHeaderView()
        setupPropertyInfoView()
        setupSafetyConsiderationsView()
        setupSafetyDevicesView()
        
    }
    
    private func setupScrollView(){
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentScrollView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor,constant: 10),
            contentScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupHeaderView(){
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentScrollView.topAnchor,constant: 10),
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
        
        let notSuitableForInfantLabel = getIconedLabel(imageSystemName: "stroller", labelText: "Not suitable for infants")

        contentView.addArrangedSubview(notSuitableForInfantLabel)
                
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
                
        contentView.axis = .vertical
        contentView.alignment = .leading
        
    }
    
    
    private func getIconedLabel(imageSystemName : String,labelText : String) -> IconedLabelView{
        let iconedLabelView = IconedLabelView(frame: .zero)
        iconedLabelView.iconImageView.image = UIImage(systemName: imageSystemName)
        iconedLabelView.contentLabel.text = labelText
        iconedLabelView.contentLabel.numberOfLines = 0
        return iconedLabelView
    }
    
    private func setupCancelButton(){
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            cancelButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 15),
            cancelButton.heightAnchor.constraint(equalToConstant: 20),
            cancelButton.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    @objc private func cancelButtonOnTapAction(){
        self.dismiss(animated: true)
    }
}

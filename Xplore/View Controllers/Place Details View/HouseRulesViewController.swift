import UIKit

class HouseRulesViewController: UIViewController {
    lazy var headerView = {
        let textLabel = UILabel()
        textLabel.text = "Follow these rules to be a considerate guest and avoid any issues during your stay."
        textLabel.configSecondaryRegularStyle()
        textLabel.numberOfLines = 0
        let sectionView = SectionView(frame: CGRect.zero, contentView: textLabel, titleText: "House Rules")
        sectionView.titleView.configPrimaryStyle()
        return sectionView
    }()
    
    lazy var footerView = {
        let textLabel = UILabel()
        textLabel.text = "No loud music allowed and no Music allowed after ten.\nElectric heater and any sort of things with fire emmiting like candles are not allowed in room or permises."
        textLabel.numberOfLines = 0
        textLabel.configSecondaryRegularStyle()
        let sectionView = SectionView(frame: CGRect.zero, contentView: textLabel, titleText: "Additional Rules")
        return sectionView
    }()
    
    lazy var whoCanStayView = {
        SectionView(frame: CGRect.zero, contentView: UIStackView(), titleText: "Who can stay")
    }()
    
    lazy var whatsAllowedView = {
        SectionView(frame: CGRect.zero, contentView: UIStackView(), titleText: "What's Allowed")
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(headerView)
        view.addSubview(footerView)
        view.addSubview(whoCanStayView)
        view.addSubview(whatsAllowedView)
        
        setupHeaderView()
        setupFooterView()
        setupWhoCanStayView()
        setupWhatsAllowedView()
        
    }
    private func setupHeaderView(){
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20)
        ])
        
    }
    
    private func setupFooterView(){
        footerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            footerView.topAnchor.constraint(equalTo: whatsAllowedView.bottomAnchor,constant: 10),
            footerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            footerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
//            footerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -10)
        ])
        
    }
    
    private func setupWhoCanStayView(){
        whoCanStayView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            whoCanStayView.topAnchor.constraint(equalTo: headerView.contentView.bottomAnchor,constant: 20),
            whoCanStayView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            whoCanStayView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            whoCanStayView.bottomAnchor.constraint(equalTo: whatsAllowedView.topAnchor,constant: -10)
        ])
        let contentView = whoCanStayView.contentView as! UIStackView
        
        let petAllowedLabel = getIconedLabel(imageSystemName: "pawprint", labelText: "Pets allowed")

        contentView.addArrangedSubview(petAllowedLabel)
        
        petAllowedLabel.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.06).isActive = true
        
        contentView.axis = .vertical
        contentView.alignment = .leading
        
        
    }
    
    private func setupWhatsAllowedView(){
        whatsAllowedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            whatsAllowedView.topAnchor.constraint(equalTo: whoCanStayView.bottomAnchor,constant: 10),
            whatsAllowedView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            whatsAllowedView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
//            whatsAllowedView.bottomAnchor.constraint(equalTo: footerView.topAnchor, constant: -10)
        ])
        
        let contentView = whatsAllowedView.contentView as! UIStackView
        
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
    
    private func getIconedLabel(imageSystemName : String,labelText : String) -> IconedLabelView{
        let iconedLabelView = IconedLabelView(frame: .zero)
        iconedLabelView.iconImageView.image = UIImage(systemName: imageSystemName)
        iconedLabelView.contentLabel.text = labelText
        return iconedLabelView
    }
}

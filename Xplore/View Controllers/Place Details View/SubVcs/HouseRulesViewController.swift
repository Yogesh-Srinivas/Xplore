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
        view.addSubview(cancelButton)
        view.addSubview(contentScrollView)
        contentScrollView.addSubview(headerView)
        contentScrollView.addSubview(footerView)
        contentScrollView.addSubview(whoCanStayView)
        contentScrollView.addSubview(whatsAllowedView)
        
        setupCancelButton()
        setupScrollView()
        setupHeaderView()
        setupFooterView()
        setupWhoCanStayView()
        setupWhatsAllowedView()
        
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
            headerView.topAnchor.constraint(equalTo: contentScrollView.topAnchor),
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
                
        contentView.axis = .vertical
        contentView.alignment = .leading
        
        
    }
    
    private func setupWhatsAllowedView(){
        whatsAllowedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            whatsAllowedView.topAnchor.constraint(equalTo: whoCanStayView.bottomAnchor,constant: 10),
            whatsAllowedView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            whatsAllowedView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
        ])
        
        let contentView = whatsAllowedView.contentView as! UIStackView
        
        let checkInLabel = getIconedLabel(imageSystemName: "clock", labelText: "Check-In: 11:00 - 19:00")
        let checkOutLabel = getIconedLabel(imageSystemName: "clock", labelText: "Check-Out before 11:00")
        let smokingLabel = getIconedLabel(imageSystemName: "wineglass", labelText: "Alcohol is not allowed")
        
        contentView.addArrangedSubview(checkInLabel)
        contentView.addArrangedSubview(checkOutLabel)
        contentView.addArrangedSubview(smokingLabel)

        
        contentView.axis = .vertical
        contentView.alignment = .leading
    }
    
    private func getIconedLabel(imageSystemName : String,labelText : String) -> IconedLabelView{
        let iconedLabelView = IconedLabelView(frame: .zero)
        iconedLabelView.iconImageView.image = UIImage(systemName: imageSystemName)
        iconedLabelView.contentLabel.text = labelText
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

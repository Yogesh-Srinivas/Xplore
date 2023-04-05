import UIKit

class AmenitiesView: UIView {
    
    lazy var titleLabel = UILabel()
    lazy var amenityStackView = {
        let uiStackView = UIStackView()
        return uiStackView
    }()
    lazy var showAllAmenitiesButton = {
        let uiButton = UIButton()
        uiButton.setTitle("Show All Amenities", for: .normal)
        uiButton.setTitleColor(.label, for: .normal)
        uiButton.layer.cornerRadius = 10
        uiButton.underline()
        return uiButton
    }()
    
    var amenitiesList : [Amenity]
    var referenceViewControllerToPresent : UIViewController?
    
    init(frame: CGRect,amenitiesList : [Amenity]) {
        
        self.amenitiesList = amenitiesList
        super.init(frame: frame)
        
        self.backgroundColor = .systemBackground
        self.addSubview(titleLabel)
        self.addSubview(amenityStackView)
        
               
        setupTitleLabel()
        setupAmenityListView()
        
        if amenitiesList.count > 7{
            self.addSubview(showAllAmenitiesButton)
            setupShowAllButton()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTitleLabel(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier : 0.2),
        ])
        titleLabel.text = "What This Place Offers"
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.configPrimaryStyle()
        
    }
    private func setupAmenityListView(){
        
        for availableAmenityIndex in 0...min(6, amenitiesList.count - 1){
            
            amenityStackView.addArrangedSubview(
                IconedLabelView(frame: .zero,
                                contentText: amenitiesList[availableAmenityIndex].rawValue,
                                imageSystemName: "fork.knife"
                               )
            )
        }

        
        amenityStackView.alignment = .top
        amenityStackView.axis = .vertical
        
        amenityStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            amenityStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            amenityStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            amenityStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        
    }
    
    private func setupShowAllButton(){
        showAllAmenitiesButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            showAllAmenitiesButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            showAllAmenitiesButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            showAllAmenitiesButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            showAllAmenitiesButton.heightAnchor.constraint(equalToConstant: 40),
            showAllAmenitiesButton.topAnchor.constraint(equalTo: amenityStackView.bottomAnchor)
            
        ])
        
        showAllAmenitiesButton.addTarget(self, action: #selector(showAllButtonOnTap), for: .touchDown)
        
    }
    
    func enableShowAllButtonAction(referenceViewControllerToPresent : UIViewController){
        self.referenceViewControllerToPresent = referenceViewControllerToPresent
    }
    
    @objc private func showAllButtonOnTap(){
        referenceViewControllerToPresent?.present(AmenitiesViewController(amenitiesList: amenitiesList), animated: true)
    }
    
}


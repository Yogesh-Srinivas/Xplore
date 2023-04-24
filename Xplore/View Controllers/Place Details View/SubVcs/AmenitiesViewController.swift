import UIKit

class AmenitiesViewController: UIViewController {
        
    lazy var cancelButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.tintColor = .label
        button.addTarget(self, action: #selector(dismissViewAction), for: .touchDown)
        return button
    }()
    
    lazy var amenitiesView = SectionView(frame: .zero, contentView: UIStackView(), titleText: "What This Place Offers")
    
    lazy var contentScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = false
        return scrollView
    }()
    
    let amenitiesList : [Amenity]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(cancelButton)
        view.addSubview(contentScrollView)
        contentScrollView.addSubview(amenitiesView)
        setupScrollView()
        setupAmenityView()
        setupCancelButton()
    }
    
    init(amenitiesList: [Amenity]) {
        self.amenitiesList = amenitiesList
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCancelButton(){
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 22),
            cancelButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 15),
            cancelButton.heightAnchor.constraint(equalToConstant: 17),
            cancelButton.widthAnchor.constraint(equalToConstant: 17),
        ])
    }
    private func setupScrollView(){
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentScrollView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor,constant: 10),
            contentScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 15),
            contentScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -10),
            contentScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -3)
        ])
    }
    
    private func setupAmenityView(){
        
        let amenityStackView = amenitiesView.contentView as! UIStackView
        
        for availableAmenityIndex in 0..<amenitiesList.count{
            amenityStackView.addArrangedSubview(
                IconedLabelView(frame: .zero,
                                contentText: amenitiesList[availableAmenityIndex].rawValue,
                                imageSystemName: Amenity.getImage(for: amenitiesList[availableAmenityIndex])
                               )
            )
        }

        amenityStackView.alignment = .top
        amenityStackView.axis = .vertical
        amenityStackView.spacing = 15
        
        amenitiesView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            amenitiesView.topAnchor.constraint(equalTo: contentScrollView.topAnchor),
            amenitiesView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 15),
            amenitiesView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            amenitiesView.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor),
            
        ])
        
        
    }
    
    @objc private func dismissViewAction(){
        self.dismiss(animated: true)
    }
}


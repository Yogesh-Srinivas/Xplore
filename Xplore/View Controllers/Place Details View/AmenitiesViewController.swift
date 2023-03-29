//
//  AmenitiesViewController.swift
//  Xplore
//
//  Created by yogesh-pt6219 on 27/03/23.
//

import UIKit

class AmenitiesViewController: UIViewController {
    
    lazy var titleLabel = UILabel()
////    lazy var amenityStackView = {
//        let uiStackView = UIStackView()
//        return uiStackView
//    }()
    
    lazy var amenitiesView = SectionView(frame: .zero, contentView: UIStackView(), titleText: "What This Place Offers")
    let amenitiesList : [Amenity]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
//        view.addSubview(titleLabel)
//        view.addSubview(amenityStackView)
        
//        setupTitleLabel()
        view.addSubview(amenitiesView)
        setupAmenityView()
        
    }
    
    init(amenitiesList: [Amenity]) {
        self.amenitiesList = amenitiesList
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setupTitleLabel(){
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            titleLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor,multiplier : 0.2),
//        ])
//
//        titleLabel.text = "What This Place Offers"
//        titleLabel.font = .boldSystemFont(ofSize: 20)
//
//    }
    func setupAmenityView(){
        
        let amenityStackView = amenitiesView.contentView as! UIStackView
        
        for availableAmenityIndex in 0..<amenitiesList.count{
            amenityStackView.addArrangedSubview(
                IconedLabelView(frame: .zero,
                                contentText: amenitiesList[availableAmenityIndex].rawValue,
                                imageSystemName: "fork.knife"
                               )
            )
        }

        amenityStackView.alignment = .top
        amenityStackView.axis = .vertical
        
        amenitiesView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            amenitiesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30),
            amenitiesView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            amenitiesView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20)
        ])
        
        
    }
    
//    private func amenityDisplayCard(amenityText : String) -> UIView{
//        let amenityIcon = UIImageView(image: UIImage(systemName: "fork.knife"))
//        let amenityLabel = UILabel()
//
//        let amenityCard = UIView()
//
//        amenityCard.addSubview(amenityIcon)
//        amenityCard.addSubview(amenityLabel)
//
//        amenityIcon.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            amenityIcon.topAnchor.constraint(equalTo: amenityCard.topAnchor),
//            amenityIcon.leadingAnchor.constraint(equalTo: amenityCard.leadingAnchor),
//            amenityIcon.bottomAnchor.constraint(equalTo: amenityCard.bottomAnchor),
//            amenityIcon.widthAnchor.constraint(equalTo: amenityCard.widthAnchor, multiplier: 0.1)
//        ])
//
//        amenityLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            amenityLabel.topAnchor.constraint(equalTo: amenityCard.topAnchor),
//            amenityLabel.trailingAnchor.constraint(equalTo: amenityCard.trailingAnchor),
//            amenityLabel.bottomAnchor.constraint(equalTo: amenityCard.bottomAnchor),
//            amenityLabel.widthAnchor.constraint(equalTo: amenityCard.widthAnchor, multiplier: 0.9)
//        ])
//
//        amenityLabel.text = amenityText
//
//        return amenityCard
//    }
}


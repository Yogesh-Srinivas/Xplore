//
//  AmenitiesViewController.swift
//  Xplore
//
//  Created by yogesh-pt6219 on 27/03/23.
//

import UIKit

class AmenitiesViewController: UIViewController {
    
    lazy var titleLabel = UILabel()
    
    lazy var amenitiesView = SectionView(frame: .zero, contentView: UIStackView(), titleText: "What This Place Offers")
    let amenitiesList : [Amenity]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
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
}


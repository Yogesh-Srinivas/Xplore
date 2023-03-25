//
//  PlaceDetailedPageViewController.swift
//  Xplore
//
//  Created by yogesh-pt6219 on 24/03/23.
//

import UIKit

class PlaceDetailedPageViewController: UIViewController {
    
    lazy var toolBar = UIToolbar()
    
    lazy var wishListButton = {
        let buttonImage = UIImage(systemName: "heart")
        let button = UIButton(type: .custom)
        button.setImage(buttonImage, for: .normal)
        let barButtonItem = UIBarButtonItem(customView: button)
        return barButtonItem
    }()
    
    lazy var backButton = {
        let buttonImage = UIImage(systemName: "arrow.left")
        let button = UIButton(type: .custom)
        button.setImage(buttonImage, for: .normal)
        let barButtonItem = UIBarButtonItem(customView: button)
        return barButtonItem
    }()
        
    lazy var back = UIBarButtonItem(barButtonSystemItem: .close, target: nil, action: nil)
    
    lazy var reserverButton = UIButton()
    
    lazy var placeImagesCollectionView = PlaceDetailCardView()
    
    lazy var contentScrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        
        view.addSubview(contentScrollView)
        view.addSubview(reserverButton)
        contentScrollView.addSubview(placeImagesCollectionView)
        view.addSubview(toolBar)

        view.backgroundColor = .white
        
        setupToolBar()
        setupReserveButton()
        setupPlaceImagesCollectionView()
        setupScrollView()
        
    }
    
    func setupToolBar(){
        
        toolBar.setBackgroundImage(UIImage(), forToolbarPosition: .any, barMetrics: .default)
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toolBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolBar.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        toolBar.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: view.frame.width, height: 70))
        
        toolBar.items = [backButton,wishListButton]
        
    }
    
    func setupReserveButton(){
        
        reserverButton.setTitle("Reserve", for: .normal)
        reserverButton.backgroundColor = .systemBlue
        reserverButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reserverButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            reserverButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            reserverButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            reserverButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func setupPlaceImagesCollectionView(){
        placeImagesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            placeImagesCollectionView.topAnchor.constraint(equalTo: contentScrollView.topAnchor),
            placeImagesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            placeImagesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            placeImagesCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            placeImagesCollectionView.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor)
        ])
        
        placeImagesCollectionView.backgroundColor = .gray
    }
    
    func setupScrollView(){
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            contentScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentScrollView.bottomAnchor.constraint(equalTo: reserverButton.topAnchor)
        ])
    }

}

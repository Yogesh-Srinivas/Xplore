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
    
    lazy var flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    
    lazy var reserverButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        
        view.addSubview(toolBar)
        view.addSubview(reserverButton)
        view.backgroundColor = .white
        
        setupToolBar()
        setupReserveButton()
        
    }
    
    func setupToolBar(){
        
        toolBar.setBackgroundImage(UIImage(), forToolbarPosition: .any, barMetrics: .default)
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toolBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            toolBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            toolBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            toolBar.heightAnchor.constraint(equalToConstant: 70)
        
        ])
        toolBar.items = [backButton, flexibleSpace, wishListButton]
        
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

}

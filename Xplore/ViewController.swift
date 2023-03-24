//
//  ViewController.swift
//  Xplore
//
//  Created by yogesh-pt6219 on 22/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let _ = DatabaseController()
        
        while UserDefaults.standard.string(forKey: "imageUrl") == nil {
            print("waiting...")
        }
        let image = UIImage(contentsOfFile: UserDefaults.standard.string(forKey: "imageUrl") ?? "")
        
        let uiView = UIImageView(image: image)
        
        view.addSubview(uiView)
        view.backgroundColor = .white
        uiView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            uiView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uiView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            uiView.topAnchor.constraint(equalTo: view.topAnchor),
            uiView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
        
    }

}


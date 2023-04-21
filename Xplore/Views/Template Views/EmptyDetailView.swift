//
//  EmptyDetailView.swift
//  Xplore
//
//  Created by yogesh-pt6219 on 20/04/23.
//

import UIKit

class EmptyDetailView: UIView {
    
    let emptyImage : UIImage?
    let message : String
    
    lazy var emptyImageView = {
        let imageView = UIImageView(image: emptyImage)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var messageLabel = {
        let label = UILabel()
        label.text = message
        label.configSecondaryStyle()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    init(frame: CGRect,image : UIImage?,message : String) {
        self.emptyImage = image
        self.message = message
        
        super.init(frame: frame)
        
        self.addSubview(emptyImageView)
        self.addSubview(messageLabel)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        emptyImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emptyImageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            emptyImageView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor,constant: -30),
            emptyImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            emptyImageView.heightAnchor.constraint(equalTo: emptyImageView.widthAnchor),
        ])
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            messageLabel.topAnchor.constraint(equalTo: emptyImageView.bottomAnchor),
            messageLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6)
        ])
        
    }
}

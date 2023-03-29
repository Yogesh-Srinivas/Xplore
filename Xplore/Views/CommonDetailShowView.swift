//
//  CancellationPolicyView.swift
//  Xplore
//
//  Created by yogesh-pt6219 on 26/03/23.
//

import UIKit

class CommonDetailShowView : UIView {
    lazy var rightArrowImage = UIImageView(image: UIImage(systemName: "chevron.right"))
    lazy var titleLabel = UILabel()
    let title : String
    weak var referenceViewController : UIViewController?
    var viewControllerToPresent : UIViewController?
    
    init(frame: CGRect,title : String) {
        
        self.title = title
        super.init(frame: frame)
        
        self.addSubview(rightArrowImage)
        self.addSubview(titleLabel)
        self.backgroundColor = .systemBackground
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        titleLabel.text = title
        titleLabel.font = .boldSystemFont(ofSize: 20)
        
        rightArrowImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            rightArrowImage.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            rightArrowImage.widthAnchor.constraint(equalTo: self.heightAnchor,multiplier: 0.3),
            rightArrowImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            rightArrowImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)
        ])
                
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewOnTap)))
    }
    
    @objc private func viewOnTap(){
        referenceViewController?.present(viewControllerToPresent!, animated: true)
    }
    
    func setViewTapAction(referenceViewController : UIViewController, viewControllerToPresent : UIViewController){
        self.referenceViewController = referenceViewController
        self.viewControllerToPresent = viewControllerToPresent
    }
    
}

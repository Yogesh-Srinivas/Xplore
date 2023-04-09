//
//  StackViewWithCornorLabel.swift
//  Xplore
//
//  Created by yogesh-pt6219 on 29/03/23.
//

import UIKit

class StackViewWithCornorLabels: UIStackView {
    let leadingLabel = UILabel()
    let trailingLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackView(){

        self.addArrangedSubview(leadingLabel)
        self.addArrangedSubview(trailingLabel)
        
        self.axis = .horizontal
        self.distribution = .equalCentering
        
        leadingLabel.numberOfLines = 0
        trailingLabel.numberOfLines = 0
        
        trailingLabel.textAlignment = .right

    }
    

}

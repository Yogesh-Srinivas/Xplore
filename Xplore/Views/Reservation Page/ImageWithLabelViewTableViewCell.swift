//
//  ImageWithLabelViewTableViewCell.swift
//  Xplore
//
//  Created by yogesh-pt6219 on 29/03/23.
//

import UIKit

class ImageWithLabelViewTableViewCell: UITableViewCell {
 
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell(){
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}

//
//  SectionView.swift
//  Xplore
//
//  Created by yogesh-pt6219 on 27/03/23.
//

import UIKit

class SectionView: UIView {
    lazy var titleView = UILabel()
    var contentView : UIView
    var titleText : String{
        didSet{
            titleView.text = titleText
        }
    }
    
    init(frame: CGRect,contentView : UIView,titleText : String) {
        self.titleText = titleText
        self.contentView = contentView
        super.init(frame: frame)
        
        
        self.addSubview(titleView)
        self.addSubview(self.contentView)
        setupTitleView()
        setupContentView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTitleView(){
        titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: self.topAnchor),
            titleView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        titleView.text = titleText
        titleView.configSemiPrimary()
    }
    
    func setupContentView(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: titleView.bottomAnchor,constant: 20),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }


}

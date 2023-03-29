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
        
        trailingLabel.textAlignment = .right
    }
    
    func setStackViewContent(leadingLabelText : String,leadingLabelFontSize : CGFloat,leadingLabelFontWeight : UIFont.Weight, trailingLabelText : String,trailingLabelFontSize : CGFloat,trailingLabelFontWeight : UIFont.Weight)-> UIStackView{
        let stackView = StackViewWithCornorLabels(frame: .zero)
        
        stackView.leadingLabel.text = leadingLabelText
        stackView.leadingLabel.font = .systemFont(ofSize : leadingLabelFontSize  ,weight: leadingLabelFontWeight)
        
        stackView.trailingLabel.text = trailingLabelText
        stackView.trailingLabel.font = .systemFont(ofSize: trailingLabelFontSize,weight: trailingLabelFontWeight)
        
        return self
    }

}

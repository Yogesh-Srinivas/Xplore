import UIKit

extension UITextView{
    func configPrimaryStyle(){
        self.font = .systemFont(ofSize: 20 + ControlCenter.fontConstant, weight: .bold)
        self.textColor = .label
    }
    
    func configSecondaryStyle(){
        self.font = .systemFont(ofSize: 15 + ControlCenter.fontConstant, weight: .medium)
        self.textColor = .label
    }
    
    func configSecondaryRegularStyle(){
        self.font = .systemFont(ofSize: 15 + ControlCenter.fontConstant, weight: .regular)
        self.textColor = .label
    }
    
    func configTertiaryStyle(){
        self.font = .systemFont(ofSize: 12 + ControlCenter.fontConstant, weight: .light)
        self.textColor = .label
    }
}

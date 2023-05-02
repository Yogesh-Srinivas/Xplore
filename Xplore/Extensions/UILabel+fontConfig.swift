import UIKit

extension UILabel{
    func configTitleStyle(){
        self.font = .systemFont(ofSize: 25 + ControlCenter.fontConstant, weight: .bold)
        self.textColor = .label
    }
    
    func configHeadingStyle(){
        self.font = .systemFont(ofSize: 22 + ControlCenter.fontConstant, weight: .bold)
        self.textColor = .label
    }
    
    func configPrimaryStyle(){
        self.font = .systemFont(ofSize: 20 + ControlCenter.fontConstant, weight: .semibold)
        self.textColor = .label
    }
    
    func configPrimaryRegularStyle(){
        self.font = .systemFont(ofSize: 20 + ControlCenter.fontConstant, weight: .regular)
        self.textColor = .label
    }
    
    func configSemiPrimary(){
        self.font = .systemFont(ofSize: 17 + ControlCenter.fontConstant ,weight: .medium)
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
    
    
    
    func configSecondaryFadedStyle(){
        self.font = .systemFont(ofSize: 15 + ControlCenter.fontConstant, weight: .light)
        self.textColor = .systemGray
    }
}

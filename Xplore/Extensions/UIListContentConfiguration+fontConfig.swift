import UIKit

extension UIListContentConfiguration.TextProperties{
    
    mutating func configTitleStyle(){
        self.font = .systemFont(ofSize: 25 + ControlCenter.fontConstant, weight: .bold)
        
    }
    
    mutating func configHeadingStyle(){
        self.font = .systemFont(ofSize: 22 + ControlCenter.fontConstant, weight: .bold)
    }
    
    mutating func configPrimaryStyle(){
        self.font = .systemFont(ofSize: 20 + ControlCenter.fontConstant, weight: .bold)
        
    }
    
    mutating func configPrimaryRegularStyle(){
        self.font = .systemFont(ofSize: 20 + ControlCenter.fontConstant, weight: .medium)
        
    }
    
    mutating func configSemiPrimary(){
        self.font = .systemFont(ofSize: 17 + ControlCenter.fontConstant ,weight: .medium)
        
    }
    
    mutating func configSecondaryStyle(){
        self.font = .systemFont(ofSize: 15 + ControlCenter.fontConstant, weight: .medium)
        
    }
    
    mutating func configSecondaryRegularStyle(){
        self.font = .systemFont(ofSize: 15 + ControlCenter.fontConstant, weight: .regular)
        
    }
    
    mutating func configTertiaryStyle(){
        self.font = .systemFont(ofSize: 12 + ControlCenter.fontConstant, weight: .light)
        
    }
    
    mutating func configSecondaryFadedStyle(){
        self.font = .systemFont(ofSize: 15 + ControlCenter.fontConstant, weight: .light)
        
    }
}

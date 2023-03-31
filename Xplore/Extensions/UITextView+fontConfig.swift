import UIKit

extension UITextView{
    func configPrimaryStyle(){
        self.font = .systemFont(ofSize: 20, weight: .bold)
        self.textColor = .label
    }
    
    func configSecondaryStyle(){
        self.font = .systemFont(ofSize: 15, weight: .medium)
        self.textColor = .label
    }
    
    func configSecondaryRegularStyle(){
        self.font = .systemFont(ofSize: 15, weight: .regular)
        self.textColor = .label
    }
    
    func configTertiaryStyle(){
        self.font = .systemFont(ofSize: 12, weight: .light)
        self.textColor = .label
    }
}

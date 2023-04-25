import UIKit

extension UINavigationBar{
    func addShadow(){
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowColor = UIColor.tertiaryLabel.cgColor
        self.layer.shadowRadius = 1
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 1
    }
}

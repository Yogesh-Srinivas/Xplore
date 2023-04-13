import UIKit
extension UIButton{
    func addBorder(){
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 7
    }
}

import UIKit
extension UIButton {
    func underline() {
        guard let text = self.titleLabel?.text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        let underlineColor = self.currentTitleColor
        attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: underlineColor, range: NSRange(location: 0, length: text.count))
        
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        
        self.setAttributedTitle(attributedString, for: .normal)
    }
}

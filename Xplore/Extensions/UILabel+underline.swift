import UIKit
extension UILabel {
    func underline() {
        if let textString = self.text {
            let underLineColor: UIColor = .label

            let attributedString = NSMutableAttributedString(string: textString)
            
            attributedString.addAttribute(
                NSAttributedString.Key.underlineStyle,
                value: NSUnderlineStyle.single.rawValue,
                range: NSRange(location: 0, length: attributedString.length - 1)
            )
            
            attributedString.addAttribute(            NSAttributedString.Key.underlineColor,
                value: underLineColor,
                range: NSRange(location: 0, length: attributedString.length - 1)
            )
            
            attributedString.addAttribute(
                NSAttributedString.Key.backgroundColor,
                value: UIColor.label, range: NSRange(location: 0, length: attributedString.length - 1)
            )
            
            attributedText = attributedString
        }
    }
}

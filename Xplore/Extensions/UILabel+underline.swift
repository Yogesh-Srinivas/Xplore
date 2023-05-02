import UIKit
extension UILabel {
    func underline() {
        if let textString = self.text {
            let underLineColor: UIColor = textColor

            let attributedString = NSMutableAttributedString(string: textString)
            
            attributedString.addAttribute(
                NSAttributedString.Key.underlineStyle,
                value: NSUnderlineStyle.single.rawValue,
                range: NSRange(location: 0, length: attributedString.length)
            )
            
            attributedString.addAttribute(            NSAttributedString.Key.underlineColor,
                value: underLineColor,
                range: NSRange(location: 0, length: attributedString.length)
            )
            
            attributedText = attributedString
        }
    }
    
    func removeUnderline(){
        if let textString = self.text {

            let attributedString = NSMutableAttributedString(string: textString)
            
            attributedString.addAttribute(
                NSAttributedString.Key.underlineStyle,
                value: 0,
                range: NSRange(location: 0, length: attributedString.length)
            )
            
            attributedText = attributedString
        }
    }
}

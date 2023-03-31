import UIKit

class IconedLabelView: UIView {
    lazy var iconImageView = UIImageView()
    lazy var contentLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(iconImageView)
        self.addSubview(contentLabel)
        setupIconedLabelView()
    }
    
    convenience init(frame: CGRect,contentText:String,imageSystemName:String){
        self.init(frame: frame)
        self.iconImageView.image = UIImage(systemName: imageSystemName)
        self.contentLabel.text = contentText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupIconedLabelView(){
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            iconImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -10),
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            
        ])
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: self.topAnchor),
            contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
            contentLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor,constant: 20)
        ])
        
        iconImageView.tintColor = .label
        contentLabel.numberOfLines = 0
    }

}

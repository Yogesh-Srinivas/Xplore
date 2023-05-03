import UIKit

class HeaderImageWithTitle: UIView {
    
    lazy var headerImage = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "loadingImage")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var primaryLabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.configSecondaryStyle()
        label.contentMode = .top
        return label
    }()
    
    lazy var secondaryLabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.configSecondaryFadedStyle()
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }()
    
    lazy var tertiaryLabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.configTertiaryStyle()
        label.contentMode = .top
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(headerImage)
        self.addSubview(primaryLabel)
        self.addSubview(secondaryLabel)
        self.addSubview(tertiaryLabel)

        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerImage.topAnchor.constraint(equalTo: self.topAnchor),
            headerImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            headerImage.heightAnchor.constraint(equalTo: headerImage.widthAnchor,multiplier: 0.7),
            headerImage.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 0.45),
        ])
        
        primaryLabel.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            primaryLabel.topAnchor.constraint(equalTo: self.topAnchor),
            primaryLabel.leadingAnchor.constraint(equalTo: headerImage.trailingAnchor,constant: 10),
            primaryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            primaryLabel.bottomAnchor.constraint(lessThanOrEqualTo: secondaryLabel.topAnchor,constant: -3)
            
        ])
        
        secondaryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondaryLabel.topAnchor.constraint(equalTo: primaryLabel.bottomAnchor),
            secondaryLabel.leadingAnchor.constraint(equalTo: headerImage.trailingAnchor,constant: 10),
            secondaryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        tertiaryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tertiaryLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tertiaryLabel.leadingAnchor.constraint(equalTo: headerImage.trailingAnchor,constant: 10),
            tertiaryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
    }
}

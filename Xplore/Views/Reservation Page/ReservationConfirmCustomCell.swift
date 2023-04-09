import UIKit

class ReservationConfirmCustomCell: UITableViewCell {

    lazy var logoImage = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var primaryLabel = {
        let label = UILabel()
        label.configTitleStyle()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var secondaryLabel = {
        let label = UILabel()
        label.configSecondaryStyle()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var placeImage = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(logoImage)
        self.addSubview(primaryLabel)
        self.addSubview(secondaryLabel)
        self.addSubview(placeImage)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell(){
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        primaryLabel.translatesAutoresizingMaskIntoConstraints = false
        secondaryLabel.translatesAutoresizingMaskIntoConstraints = false
        placeImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: self.topAnchor,constant: 15),
            logoImage.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 150),
            logoImage.bottomAnchor.constraint(equalTo: primaryLabel.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            primaryLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor),
            primaryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            primaryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            primaryLabel.bottomAnchor.constraint(equalTo: secondaryLabel.topAnchor,constant: -10),
           
        ])
        
        NSLayoutConstraint.activate([
            secondaryLabel.topAnchor.constraint(equalTo: primaryLabel.bottomAnchor,constant: 10),
            secondaryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            secondaryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            secondaryLabel.bottomAnchor.constraint(equalTo: placeImage.topAnchor,constant: -15),
           
        ])
        
        NSLayoutConstraint.activate([
            placeImage.topAnchor.constraint(equalTo: secondaryLabel.bottomAnchor,constant: 15),
            placeImage.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            placeImage.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            placeImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            placeImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.3)
        ])
    }

}

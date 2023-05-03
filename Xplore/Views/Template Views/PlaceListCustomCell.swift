import UIKit

class PlaceListCustomCell: UITableViewCell {

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
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.contentMode = .top
        return label
    }()
    
    lazy var secondaryLabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .systemGray
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(headerImage)
        self.contentView.addSubview(primaryLabel)
        self.contentView.addSubview(secondaryLabel)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerImage.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            headerImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 20),
            headerImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -10),
            headerImage.widthAnchor.constraint(equalToConstant: 140),
        ])
        
        primaryLabel.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            primaryLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            primaryLabel.leadingAnchor.constraint(equalTo: headerImage.trailingAnchor,constant: 10),
            primaryLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            primaryLabel.bottomAnchor.constraint(lessThanOrEqualTo: secondaryLabel.topAnchor,constant: -3)
            
        ])
        
        secondaryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondaryLabel.topAnchor.constraint(equalTo: primaryLabel.bottomAnchor,constant: 5),
            secondaryLabel.leadingAnchor.constraint(equalTo: headerImage.trailingAnchor,constant: 10),
            secondaryLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        ])
        
    }
}

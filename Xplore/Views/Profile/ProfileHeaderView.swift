import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {

    lazy var profileIcon = {
        let imageView = UIImageView()
        imageView.tintColor = .label
        return imageView
    }()
    
    lazy var userLabel = {
        let label = UILabel()
        label.contentMode = .center
        label.adjustsFontSizeToFitWidth = true
        label.configSemiPrimary()
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(profileIcon)
        self.contentView.addSubview(userLabel)
        
        setupView()
        
    }
    
    private func setupView(){
        profileIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileIcon.widthAnchor.constraint(equalToConstant: 70),
            profileIcon.heightAnchor.constraint(equalToConstant: 70),
            profileIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
        ])
        
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            userLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            userLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            userLabel.bottomAnchor.constraint(greaterThanOrEqualTo: profileIcon.bottomAnchor),
            userLabel.leadingAnchor.constraint(equalTo: profileIcon.trailingAnchor,constant: 20),
        ])
        
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
}

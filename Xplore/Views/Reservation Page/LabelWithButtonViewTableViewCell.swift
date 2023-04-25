import UIKit

class LabelWithButtonViewTableViewCell: UITableViewCell {
    
    let bottomButton = UIButton()
    let contentLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell(){
        self.contentView.addSubview(bottomButton)
        self.contentView.addSubview(contentLabel)
        
        contentLabel.numberOfLines = 0
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -15),
            contentLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 15),
            contentLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 20),
            contentLabel.bottomAnchor.constraint(equalTo: bottomButton.topAnchor,constant: -15)
        ])
        
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -15),
            bottomButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 15),
            bottomButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -15),
            bottomButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        bottomButton.layer.cornerRadius = 10
    }
    
}

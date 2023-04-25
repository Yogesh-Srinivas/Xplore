import UIKit

class AvailabilityDetailView: UIView {

//    let headerLabel = UILabel()
    let availabilityIcon = {
        let imageView = UIImageView(image: UIImage(systemName: "calendar"))
        return imageView
    }()
    
    let contentLabel = UILabel()
    private var viewControllerToPresentOnTap : UIViewController?
    private var referenceViewControllerToPresent : UIViewController?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.addSubview(availabilityIcon)
        self.addSubview(contentLabel)
        self.backgroundColor = .systemBackground
        setupAvailabilityIcon()
        setupContentLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAvailabilityIcon(){
//        headerLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            headerLabel.topAnchor.constraint(equalTo: self.topAnchor),
//            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            headerLabel.bottomAnchor.constraint(equalTo: contentLabel.topAnchor,constant: -10)
//        ])
//        headerLabel.text = "Availability"
//        headerLabel.adjustsFontSizeToFitWidth = true
//        headerLabel.configPrimaryStyle()
        
       
        availabilityIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([

            availabilityIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            availabilityIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            availabilityIcon.heightAnchor.constraint(equalToConstant: 26),
            availabilityIcon.widthAnchor.constraint(equalToConstant: 30)
            
        ])
       
    }
    func setupContentLabel(){
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: self.topAnchor),
            contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
            contentLabel.leadingAnchor.constraint(equalTo: availabilityIcon.trailingAnchor,constant: 20),
            contentLabel.heightAnchor.constraint(greaterThanOrEqualTo: availabilityIcon.heightAnchor)
        ])
        
        contentLabel.adjustsFontSizeToFitWidth = true
        availabilityIcon.tintColor = .label
        contentLabel.numberOfLines = 0
        contentLabel.configSecondaryStyle()
    }
    func setupTapAction(currentViewController : UIViewController , viewControllerToPresentOnTap : UIViewController){
        self.viewControllerToPresentOnTap = viewControllerToPresentOnTap
        self.referenceViewControllerToPresent = currentViewController
        
        self.contentLabel.isUserInteractionEnabled = true
        self.contentLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewOnTap)))
    }
    
    @objc func viewOnTap(){
        if let viewControllerToPresentOnTap = self.viewControllerToPresentOnTap,let referenceViewControllerToPresent = self.referenceViewControllerToPresent{
            referenceViewControllerToPresent.present(viewControllerToPresentOnTap, animated: true)
        }
    }

    
}

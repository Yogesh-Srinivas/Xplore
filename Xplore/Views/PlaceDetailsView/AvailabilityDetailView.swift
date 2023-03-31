import UIKit

class AvailabilityDetailView: UIView {

    let headerLabel = UILabel()
    let contentLabel = UILabel()
    private var viewControllerToPresentOnTap : UIViewController?
    private var referenceViewControllerToPresent : UIViewController?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.addSubview(headerLabel)
        self.addSubview(contentLabel)
        self.backgroundColor = .systemBackground
        setupHeaderLabel()
        setupContentLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHeaderLabel(){
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: contentLabel.topAnchor,constant: -10)
        ])
        headerLabel.text = "Availability"
        headerLabel.adjustsFontSizeToFitWidth = true
        headerLabel.configPrimaryStyle()
       
    }
    func setupContentLabel(){
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentLabel.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier : 0.5),
        ])
        
        contentLabel.adjustsFontSizeToFitWidth = true
        
       

    }
    func setupTapAction(currentViewController : UIViewController , viewControllerToPresentOnTap : UIViewController){
        self.viewControllerToPresentOnTap = viewControllerToPresentOnTap
        self.referenceViewControllerToPresent = currentViewController
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewOnTap)))
    }
    
    @objc private func viewOnTap(){
        if let viewControllerToPresentOnTap = self.viewControllerToPresentOnTap,let referenceViewControllerToPresent = self.referenceViewControllerToPresent{
            referenceViewControllerToPresent.present(viewControllerToPresentOnTap, animated: true)

        }
    }

    
}

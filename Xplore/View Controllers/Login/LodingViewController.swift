import UIKit

class LodingViewController: UIViewController {
    
    lazy var logoImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "appLogoWithName")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var loadingLabel = {
        let label = UILabel()
        label.text = "loading..."
        label.configSecondaryStyle()
        label.textColor = .white
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(logoImageView)
        view.addSubview(loadingLabel)
        setupLoadingView()
    }
    
    private func setupLoadingView(){
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 300),
            logoImageView.widthAnchor.constraint(equalToConstant: 350)
        ])
        
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loadingLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            loadingLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20)
        ])
        
    }

}

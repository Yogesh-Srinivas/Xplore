import UIKit

class CancellationPolicyViewController: UIViewController {
    let titleView = UILabel()
    let policyContentView = UILabel()
    let labelWrapper = UIButton()
    
    lazy var cancelButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.tintColor = .label
        button.addTarget(self, action: #selector(cancelButtonOnTapAction), for: .touchDown)
        return button
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(titleView)
        view.addSubview(labelWrapper)
        view.addSubview(cancelButton)
        labelWrapper.addSubview(policyContentView)
        
        setupTitleView()
        setupPolicyContentView()
        setupCancelButton()
    }
    
    private func setupTitleView(){
        titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor),
            titleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            titleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            titleView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        
        ])
        
        titleView.text = "Cancellation Policy"
        titleView.configPrimaryStyle()
    }
    
    private func setupPolicyContentView(){
        labelWrapper.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelWrapper.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            labelWrapper.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            labelWrapper.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            labelWrapper.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
        
        
        policyContentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            policyContentView.topAnchor.constraint(equalTo: labelWrapper.topAnchor),
            policyContentView.leadingAnchor.constraint(equalTo: labelWrapper.leadingAnchor,constant: 20),
            policyContentView.trailingAnchor.constraint(equalTo: labelWrapper.trailingAnchor,constant: -20)
        
        ])
        
        policyContentView.text = ControlCenter.cancellationPolicy
        policyContentView.configSecondaryRegularStyle()
        policyContentView.numberOfLines = 0
        policyContentView.textAlignment = .justified
        labelWrapper.contentVerticalAlignment = .top
        
    }
    
    private func setupCancelButton(){
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            cancelButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 15),
            cancelButton.heightAnchor.constraint(equalToConstant: 20),
            cancelButton.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    @objc private func cancelButtonOnTapAction(){
        self.dismiss(animated: true)
    }
}

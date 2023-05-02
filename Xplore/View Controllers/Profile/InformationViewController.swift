import UIKit

class InformationViewController: UIViewController {

    lazy var contentTextView = {
        let textView = UITextView()
        textView.textAlignment = .natural
        textView.configSecondaryStyle()
        textView.isEditable = false
        textView.isFindInteractionEnabled = false
        textView.showsVerticalScrollIndicator = false
        return textView
        
    }()
    
    let navTitle : String
    
    init(title : String, content : String){
        navTitle = title
        super.init(nibName: nil, bundle: nil)
        
        contentTextView.text = content

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(contentTextView)
        self.view.configBackgroundTheme()
        setupContentTextView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.title = navTitle
    }
    
    private func setupContentTextView(){
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentTextView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            contentTextView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            contentTextView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            contentTextView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }
    
    
}

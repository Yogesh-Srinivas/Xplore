import UIKit

class LoginTemplateViewController: UIViewController {

    lazy var topIllustrationImage = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "appLogoWithName")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var titleLabel = {
        let label = UILabel()
        label.configTitleStyle()
        return label
    }()
    
    lazy var textFieldsView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = 40
        return stackView
    }()
    
    lazy var pageButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var linkLabel = {
        let labelWithButton = LabelWithButtonView(frame: .zero)
        labelWithButton.trailingButton.titleLabel?.configSecondaryRegularStyle()

        return labelWithButton
    }()
    
    private lazy var contentView = UIScrollView()
    
    private var pageButtonAction : (()->())?
    private var linkButtonAction : (()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setCustomBackground()
        self.tabBarController?.tabBar.isHidden = true
        
        view.addSubview(contentView)
        contentView.addSubview(topIllustrationImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(textFieldsView)
        contentView.addSubview(pageButton)
        contentView.addSubview(linkLabel)
    
        setupContentView()
        setupTopIllustrationImage()
        setupTitleLabel()
        setupTextFieldsView()
        setupPageButton()
        setupLinkButton()
    }
    
    
    private func setupContentView(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
        
        contentView.bounces = false
        contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(contentViewOnTapAction)))
    }
    
    private func setupTopIllustrationImage(){
        topIllustrationImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topIllustrationImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            topIllustrationImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            topIllustrationImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            topIllustrationImage.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -30),
            topIllustrationImage.heightAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.heightAnchor,multiplier: 0.13)
        ])
    }
    
    private func setupTitleLabel(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: textFieldsView.topAnchor, constant: -10),
        
        ])
    }
    
    private func setupTextFieldsView(){
        textFieldsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textFieldsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textFieldsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            textFieldsView.bottomAnchor.constraint(equalTo: pageButton.topAnchor, constant: -40),
        
        ])
    }
    
    private func setupPageButton(){
        pageButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            pageButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            pageButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        pageButton.addTarget(self, action: #selector(pageButtonOnClickAction), for: .touchDown)
    }
    
    private func setupLinkButton(){
        linkLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            linkLabel.topAnchor.constraint(equalTo: pageButton.bottomAnchor, constant: 15),
            linkLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            linkLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        
        ])
        
        linkLabel.trailingButton.addTarget(self, action: #selector(linkButtonOnClickAction), for: .touchDown)
    }
    
    func addFieldView(fieldView : UIView){
        self.textFieldsView.addArrangedSubview(fieldView)

        fieldView.translatesAutoresizingMaskIntoConstraints = false

       
        NSLayoutConstraint.activate([
            fieldView.leadingAnchor.constraint(equalTo: textFieldsView.leadingAnchor),
            fieldView.trailingAnchor.constraint(equalTo: textFieldsView.trailingAnchor),
            
        ])
        
        
    }
    
    
    func setLinkButtonAction(action : @escaping ()->()){
        self.linkButtonAction = action
    }
    
    @objc private func linkButtonOnClickAction(){
        linkButtonAction?()
    }
    
    func setPageButtonAction(action : @escaping ()->()){
        self.pageButtonAction = action
    }
    
    @objc func pageButtonOnClickAction(){
        pageButtonAction?()
    }
    
    @objc private func contentViewOnTapAction(){
        for child in self.textFieldsView.arrangedSubviews{
            (child as? CustomLoginFieldView)?.textField.resignFirstResponder()
            (child as? CustomPasswordFieldView)?.passwordTextField.resignFirstResponder()
        }
    }
    
}

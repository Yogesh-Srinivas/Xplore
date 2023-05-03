
import UIKit


final class ReservationConfirmationViewController: UITableViewController {
    
    
    lazy var loadingView = {
        let view = UIView()
        let activityIndicator = UIActivityIndicatorView(style: .large)
        view.addSubview(activityIndicator)
        view.backgroundColor = .systemGray6
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        return view
    }()
    
    let reservationCode : String
    let location : String

    init(location : String,reservationCode : String,imageUrl : String){
        self.reservationCode = reservationCode
        self.location = location
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.setCustomBackground()
        self.view.clipsToBounds = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self,forCellReuseIdentifier: "TableViewCell")
        tableView.register(ReservationConfirmCustomCell.self,forCellReuseIdentifier: "ReservationConfirmCustomCell")
        tableView.bounces = false
        tableView.separatorStyle = .none
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.view.addSubview(loadingView)
        setupLoadingView()
    }
    
    private func setupLoadingView(){
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loadingView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            loadingView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            loadingView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){[unowned self] in
            self.loadingView.removeFromSuperview()
            addConfetti()
        }
    }
    
    private func addConfetti(){
        let confettiView = ConfettiView(frame: self.view.bounds)
        confettiView.startConfetti()
        self.view.addSubview(confettiView)
        confettiView.sendSubviewToBack(tableView)
        confettiView.isUserInteractionEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            confettiView.stopConfetti()
        }
    }
    
    private func configCell(config : inout UIListContentConfiguration){
        config.text = "Reservation Code"
        config.textProperties.configSemiPrimary()
        
        config.secondaryText = reservationCode
        config.secondaryTextProperties.configSecondaryFadedStyle()
    }
    
    
    private func addCheersButton(cell : UITableViewCell){
        let cheersButton = UIButton()
        cheersButton.setTitle("Cheers!", for: .normal)
        cheersButton.backgroundColor = .systemPink
        cheersButton.layer.cornerRadius = 5
        cheersButton.translatesAutoresizingMaskIntoConstraints = false
        
        cell.contentView.addSubview(cheersButton)
        
        NSLayoutConstraint.activate([
            cheersButton.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor),
            cheersButton.topAnchor.constraint(equalTo: cell.contentView.topAnchor,constant: 10),
            cheersButton.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor,constant: -10),
            cheersButton.widthAnchor.constraint(equalToConstant: 200),
            cheersButton.heightAnchor.constraint(equalToConstant: 45)

        ])
        
        cheersButton.addTarget(self, action: #selector(cheersButtonOnTapAction), for: .touchDown)
    }
    
    @objc private func cheersButtonOnTapAction(){
        self.navigationController?.navigationBar.isHidden = false

        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension ReservationConfirmationViewController {
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReservationConfirmCustomCell", for: indexPath) as! ReservationConfirmCustomCell
            
            cell.logoImage.image = UIImage(named: "appLogoWithName")
            cell.placeImage.image = UIImage(named: "confirmImage")
            cell.primaryLabel.text = "Your reservation is confirmed."
            cell.secondaryLabel.text = "Hurray! Pack your bags, You're going to \(location)."
            cell.selectionStyle = .none
            return cell
        
        case 1:
            var config = UIListContentConfiguration.valueCell()
            configCell(config: &config)
            cell.contentConfiguration = config
        case 2:
            addCheersButton(cell : cell)
        default:
            break

        }
        cell.selectionStyle = .none
        return cell
    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        nil
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

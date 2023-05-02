
import UIKit


final class ReservationConfirmationViewController: UITableViewController {
    
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
        
        addConfitte()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func addConfitte(){
        var emitter = CAEmitterLayer()
        emitter.emitterPosition = CGPoint(x: self.view.frame.size.width / 2, y: -10)
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterSize = CGSize(width: self.view.frame.size.width, height: 2.0)
        emitter.emitterCells = generateEmitterCells()
        self.view.layer.addSublayer(emitter)
    }
    
    private func generateEmitterCells() -> [CAEmitterCell] {
    var cells:[CAEmitterCell] = [CAEmitterCell]()
    for index in 0..<16 {
        let cell = CAEmitterCell()
        cell.birthRate = 4.0
        cell.lifetime = 14.0
        cell.lifetimeRange = 0
        cell.velocity = 10.0
        cell.velocityRange = 0
        cell.emissionLongitude = CGFloat(Double.pi)
        cell.emissionRange = 0.5
        cell.spin = 3.5
        cell.spinRange = 0
        cell.color = UIColor.systemBlue.cgColor
        cell.contents
        cell.scaleRange = 0.25
        cell.scale = 0.1
        cells.append(cell)
    }
        return cells
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

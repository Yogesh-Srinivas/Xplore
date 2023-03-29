import UIKit

class ReservationViewController: UITableViewController {
    
    let titleViewWithImage = IconedLabelView(frame: .zero)
    let tripDetailCardView = SectionView(frame: .zero, contentView: UIStackView(), titleText: "Your trip")
    let priceDetailView = SectionView(frame: .zero, contentView: UIStackView(), titleText: "Price details")
    let groundRulesView = {
        SectionView(frame: .zero, contentView: UILabel(), titleText: "Ground rules")
    }()
    let confirmationView = SectionView(frame: .zero, contentView: UIView(), titleText: "")
    let confirmButton = UIButton()
        
    var contentTabelList : [UIView] = []
    
    let priceDetailsList : [String : Int] = ["Price Per Day" : 20200 , "Total Number Of Days" : 5,"Cleaning Fee" : 600, "Serive Fee" : 1500, "Taxes" : 3500 ]
    
    let currencyCode = "INR"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ReservationViewTabelCell")
        
        setupTitleViewWithImage()
        setupTripDetailCardView()
//        setupPriceDetailView()
        setupGroundRulesView()
        setupConfirmationView()
                
        contentTabelList.append(titleViewWithImage)
        contentTabelList.append(tripDetailCardView)
        contentTabelList.append(priceDetailView)
        contentTabelList.append(groundRulesView)
        contentTabelList.append(confirmationView)
        
    }
    

    private func setupTitleViewWithImage(){

        titleViewWithImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleViewWithImage.iconImageView.heightAnchor.constraint(equalToConstant: 125 ),
            titleViewWithImage.iconImageView.widthAnchor.constraint(equalToConstant: 175 )
        ])
        
        //Title Image Setup
        titleViewWithImage.iconImageView.image = UIImage(systemName: "mountain.2")
        
        titleViewWithImage.contentLabel.text = "Willow way - A Dream Wooden cottage in Hmalayas"
        
    }
    private func setupTripDetailCardView(){
        let contentView = tripDetailCardView.contentView as! UIStackView
        contentView.axis = .vertical
        contentView.spacing = 15
        
        
        contentView.addArrangedSubview(
            StackViewWithCornorLabels(frame: .zero).setTripDetailCard(
                leadingLabelText: "Dates",
                leadingLabelFontSize: 20,
                leadingLabelFontWeight: .medium,
                trailingLabelText: "1-6 Apr",
                trailingLabelFontSize: 20,
                trailingLabelFontWeight: .light)
        )
        
        contentView.addArrangedSubview(
            StackViewWithCornorLabels(frame: .zero).setTripDetailCard(
                leadingLabelText: "Guests",
                leadingLabelFontSize: 20,
                leadingLabelFontWeight: .medium,
                trailingLabelText: "1 Guest",
                trailingLabelFontSize: 20,
                trailingLabelFontWeight: .light)
        )
        
    }

    
    private func setupPriceDetailView(){
        let contentView = priceDetailView.contentView as! UIStackView
        contentView.axis = .vertical
        contentView.spacing = 15
        
        contentView.addArrangedSubview(StackViewWithCornorLabels(frame: .zero).setTripDetailCard(
            leadingLabelText: "",
            leadingLabelFontSize: 20, leadingLabelFontWeight: .light, trailingLabelText: "In " + currencyCode, trailingLabelFontSize: 20, trailingLabelFontWeight: .light)
        )
        
        for detail in priceDetailsList{
            
            contentView.addArrangedSubview(
                StackViewWithCornorLabels(frame: .zero).setTripDetailCard(
                    leadingLabelText: detail.key,
                    leadingLabelFontSize: 20, leadingLabelFontWeight: .light, trailingLabelText: String(detail.value), trailingLabelFontSize: 20, trailingLabelFontWeight: .light)
            )
        }
        
       
    }
    private func setupGroundRulesView(){
        
    }
    private func setupConfirmationView(){
        
    }
    
    private func setupTabelCellContentView(for cellContentViewReference : UIView,with viewInsideContentView : UIView){
        viewInsideContentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewInsideContentView.topAnchor.constraint(equalTo: cellContentViewReference.topAnchor,constant: 10),
            viewInsideContentView.bottomAnchor.constraint(equalTo: cellContentViewReference.bottomAnchor,constant: -10),
            viewInsideContentView.leadingAnchor.constraint(equalTo: cellContentViewReference.leadingAnchor,constant: 20),
            viewInsideContentView.trailingAnchor.constraint(equalTo: cellContentViewReference.trailingAnchor,constant: -20)
        ])
    }

}

extension ReservationViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contentTabelList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReservationViewTabelCell",for: indexPath)
        
        let cellContentView  = contentTabelList[indexPath.row]
        
        cell.contentView.addSubview(cellContentView)
            setupTabelCellContentView(for: cell.contentView, with: cellContentView)
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}



import UIKit

class UnvisitedPlaceDetailViewController: PlaceDetailViewController {
    
    lazy var amenitiesView = AmenitiesView(frame: CGRect.zero, amenitiesList: placeDetails.amenities)
    
   
    
    lazy var cancellationPolicyView = {
        let commonDetailShowView = CommonDetailShowView(frame: CGRect.zero, title: "Cancellation Policy")
        return commonDetailShowView
    }()
    
    lazy var houseRulesView = {
        let commonDetailShowView = CommonDetailShowView(frame: CGRect.zero, title: "House rules")
        return commonDetailShowView
    }()
    
    lazy var safetyAndPropertyView = {
        let commonDetailShowView = CommonDetailShowView(frame: CGRect.zero, title: "Safety & Property")
        return commonDetailShowView
    }()
    

    
    override init(placeDetails :  TravelPlaceDetail,databaseController : PlaceDBController){
        super.init(placeDetails: placeDetails, databaseController: databaseController)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentScrollView.addSubview(amenitiesView)
        contentScrollView.addSubview(cancellationPolicyView)
        contentScrollView.addSubview(houseRulesView)
        contentScrollView.addSubview(safetyAndPropertyView)
        
        setupAmentiesView()
        setupCancellationPolicyView()
        setupHouseRulesView()
        setupSafetyAndPropertyView()

    }
    
    private func setupAmentiesView(){
        
        amenitiesView.enableShowAllButtonAction(referenceViewControllerToPresent: self)
      
    }
    private func setupCancellationPolicyView(){
        cancellationPolicyView.setViewTapAction(referenceViewController: self, viewControllerToPresent: CancellationPolicyViewController())
    }
    
    func setupHouseRulesView(){
        houseRulesView.setViewTapAction(referenceViewController: self, viewControllerToPresent: HouseRulesViewController())
    }
    func setupSafetyAndPropertyView(){
        safetyAndPropertyView.setViewTapAction(referenceViewController: self, viewControllerToPresent: SafetyAndPropertyViewController())
    }
    
}


import UIKit

class CancelReservationPageViewController: CancellationPolicyViewController {

    lazy var cancellationButton = {
        let button = UIButton()
        button.setTitle("Confirm & Cancel", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.addBorder()
        button.addTarget(self, action: #selector(cancelButtonAction), for: .touchDown)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(cancellationButton)
        
        setupCancellationButton()
    }
    
    private func setupCancellationButton(){
        cancellationButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cancellationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            cancellationButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            cancellationButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            cancellationButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func cancelButtonAction(){
        
        let alertDuration : Double = 2
        
        UIUtils.showAlertMessage(message: "Your Reservation has been Cancelled.", viewController: self, durationInSeconds: alertDuration)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + alertDuration){
            self.navigationController?.popToRootViewController(animated: true)
        }
       
    }
    
}

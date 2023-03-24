//
//  Explore1ViewController.swift
//  Xplore
//
//  Created by yogesh-pt6219 on 24/03/23.
//

import UIKit

class Explore1ViewController: UIViewController {
    lazy var placeDetailTabelView : UITableView = {
        let uiTableView = UITableView(frame: CGRect.zero)
        return uiTableView
    }()
    
    lazy var primaryPlaceDetailsList : [TravelPlaceDetail] = []
    lazy var secondaryPlaceDetailsList : [TravelPlaceDetail] = DataHold.travelPlaceDetails
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeDetailTabelView.dataSource = self
        placeDetailTabelView.delegate = self
        placeDetailTabelView.register(UITableViewCell.self, forCellReuseIdentifier:  "placeDetailCell")
        
        view.addSubview(placeDetailTabelView)
    }
}

extension Explore1ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secondaryPlaceDetailsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeDetailCell", for: indexPath)
        return cell
        
    }
}



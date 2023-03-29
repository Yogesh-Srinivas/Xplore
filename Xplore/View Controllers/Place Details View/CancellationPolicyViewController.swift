//
//  CancellationPolicyViewController.swift
//  Xplore
//
//  Created by yogesh-pt6219 on 27/03/23.
//

import UIKit

class CancellationPolicyViewController: UIViewController {
    let titleView = UILabel()
    let policyContentView = UILabel()
    let labelWrapper = UIButton()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(titleView)
        view.addSubview(labelWrapper)
        labelWrapper.addSubview(policyContentView)
        
        setupTitleView()
        setupPolicyContentView()
    }
    
    private func setupTitleView(){
        titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            titleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            titleView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        
        ])
        
        titleView.text = "Cancellation Policy"
        titleView.font = .boldSystemFont(ofSize: 25)
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
        
        policyContentView.text = "Lorem ipsum dolor sit amet. Et illo ipsam qui illo consectetur aut obcaecati iure nam consequuntur fugit eum blanditiis laborum qui commodi galisum sit earum eligendi. Ad dolor nobis est omnis repellat et voluptatem dolor. In dolore nobis est voluptatem totam et enim eius.\nUt unde quia eos quam voluptatem a rerum velit et maxime consequatur ut autem quia. Et consequatur voluptatem et consequatur pariatur et itaque earum est voluptatum voluptas vel officiis dignissimos. Eos dolor aliquid in laboriosam perspiciatis aut possimus porro.\nEum maxime rerum eum laboriosam labore id quasi rerum. Ut nesciunt iusto sed nihil voluptatibus et rerum voluptatum qui maiores similique quo consequuntur ipsa. Et praesentium minima qui deserunt nulla et iusto alias aut adipisci iste eum nobis vitae non velit sunt!"

        policyContentView.numberOfLines = 0
        policyContentView.textAlignment = .justified
        labelWrapper.contentVerticalAlignment = .top
        
    }
    

}

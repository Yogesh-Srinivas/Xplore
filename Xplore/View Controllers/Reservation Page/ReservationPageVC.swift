//
//  ReservationPageViewController.swift
//  Xplore
//
//  Created by yogesh-pt6219 on 29/03/23.
//

import UIKit

class ReservationPageViewController: UIViewController {
    
    let wrapperScrollView = UIScrollView()
    let titleViewWithImage = IconedLabelView(frame: .zero)
    let tripDetailCardView = SectionView(frame: .zero, contentView: UIView(), titleText: "Your trip")
    let priceDetailView = SectionView(frame: .zero, contentView: UIView(), titleText: "Price details")
    let groundRulesView = {
        SectionView(frame: .zero, contentView: UILabel(), titleText: "Ground rules")
    }()
    let confirmationView = SectionView(frame: .zero, contentView: UIView(), titleText: "")
    let confirmButton = UIButton()
    let termsLabel = UILabel()
    let priceDetailsList : [String : Int] = ["Price Per Day" : 20200 , "Total Number Of Days" : 5,"Cleaning Fee" : 600, "Serive Fee" : 1500, "Taxes" : 3500 ]

    let currencyCode = "INR"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(wrapperScrollView)
        wrapperScrollView.addSubview(titleViewWithImage)
        wrapperScrollView.addSubview(tripDetailCardView)
        wrapperScrollView.addSubview(priceDetailView)
        wrapperScrollView.addSubview(groundRulesView)
        wrapperScrollView.addSubview(confirmationView)
        confirmationView.addSubview(confirmButton)
        confirmationView.addSubview(termsLabel)
        
        setupWrapperScrollView()
        setupTitleViewWithImage()
        setupTripDetailCardView()
        setupPriceDetailView()
        setupGroundRulesView()
        setupConfirmationView()
    }
    
    private func setupWrapperScrollView(){
        wrapperScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wrapperScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10),
            wrapperScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -10),
            wrapperScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            wrapperScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -10),
        ])
        
    }
    
    private func setupTitleViewWithImage(){

        titleViewWithImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleViewWithImage.topAnchor.constraint(equalTo: wrapperScrollView.topAnchor ),
            titleViewWithImage.leadingAnchor.constraint(equalTo: wrapperScrollView.leadingAnchor),
            titleViewWithImage.trailingAnchor.constraint(equalTo: wrapperScrollView.trailingAnchor),
            
        ])
        
        NSLayoutConstraint.activate([
            titleViewWithImage.iconImageView.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.2 ),
            titleViewWithImage.iconImageView.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.4 ),
            titleViewWithImage.contentLabel.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.4)
        ])
        
        //Title Image Setup
        titleViewWithImage.iconImageView.image = UIImage(systemName: "mountain.2")
        
        titleViewWithImage.contentLabel.text = "Willow way - A Dream Wooden cottage in Hmalayas"
        
    }
    private func setupTripDetailCardView(){
        tripDetailCardView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tripDetailCardView.topAnchor.constraint(equalTo: titleViewWithImage.bottomAnchor ),
            tripDetailCardView.leadingAnchor.constraint(equalTo: wrapperScrollView.leadingAnchor),
            tripDetailCardView.trailingAnchor.constraint(equalTo: wrapperScrollView.trailingAnchor),
            
        ])
        
        let contentView = tripDetailCardView.contentView as! UIStackView
        
        contentView.axis = .vertical
        contentView.spacing = 15
        
        contentView.addArrangedSubview(
            StackViewWithCornorLabels(frame: .zero).setStackViewContent(
                leadingLabelText: "Dates",
                leadingLabelFontSize: 20,
                leadingLabelFontWeight: .medium,
                trailingLabelText: "1-6 Apr",
                trailingLabelFontSize: 20,
                trailingLabelFontWeight: .light)
        )
        
        contentView.addArrangedSubview(
            StackViewWithCornorLabels(frame: .zero).setStackViewContent(
                leadingLabelText: "Guests",
                leadingLabelFontSize: 20,
                leadingLabelFontWeight: .medium,
                trailingLabelText: "1 Guest",
                trailingLabelFontSize: 20,
                trailingLabelFontWeight: .light)
        )
        tripDetailCardView.contentView = contentView
        
    }

    
    private func setupPriceDetailView(){
        priceDetailView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            priceDetailView.topAnchor.constraint(equalTo: tripDetailCardView.bottomAnchor ),
            priceDetailView.leadingAnchor.constraint(equalTo: wrapperScrollView.leadingAnchor),
            priceDetailView.trailingAnchor.constraint(equalTo: wrapperScrollView.trailingAnchor),
            priceDetailView.bottomAnchor.constraint(equalTo: priceDetailView.contentView.bottomAnchor),
            priceDetailView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
            
        ])
        
//        let stackView = UIStackView()
//        let label1 = UILabel()
//        label1.text = "text1"
//        label1.font = .systemFont(ofSize: 30)
//        let label2 = UILabel()
//        label2.text = "text2"
//
//        stackView.addArrangedSubview(label1)
//        stackView.addArrangedSubview(label1)
//        stackView.axis = .horizontal
//        stackView.distribution = .equalSpacing
        
//        priceDetailView.contentView.addSubview(label1)
        
        let contentView = priceDetailView.contentView as! UIStackView
        contentView.axis = .vertical
        contentView.spacing = 15
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addArrangedSubview(StackViewWithCornorLabels(frame: .zero).setStackViewContent(
            leadingLabelText: "",
            leadingLabelFontSize: 20,
            leadingLabelFontWeight: .light,
            trailingLabelText: "In " + currencyCode,
            trailingLabelFontSize: 20,
            trailingLabelFontWeight: .light)
        )

        for detail in priceDetailsList{

            contentView.addArrangedSubview(
                StackViewWithCornorLabels(frame: .zero).setStackViewContent(
                    leadingLabelText: detail.key,
                    leadingLabelFontSize: 20,
                    leadingLabelFontWeight: .light,
                    trailingLabelText: String(detail.value),
                    trailingLabelFontSize: 20,
                    trailingLabelFontWeight: .light)
            )
        }
    }
    
    private func setupGroundRulesView(){
        
    }
    private func setupConfirmationView(){
        confirmationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            confirmationView.topAnchor.constraint(equalTo: priceDetailView.bottomAnchor ),
            confirmationView.leadingAnchor.constraint(equalTo: wrapperScrollView.leadingAnchor),
            confirmationView.trailingAnchor.constraint(equalTo: wrapperScrollView.trailingAnchor),
            confirmationView.bottomAnchor.constraint(equalTo: wrapperScrollView.bottomAnchor)
            
        ])
        
        
        termsLabel.numberOfLines = 0
        termsLabel.text = "By selecting the below button I agree to the Host's House Rules,Ground rules for guest and I'm responsible for the damage."
        termsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            termsLabel.trailingAnchor.constraint(equalTo: confirmationView.trailingAnchor,constant: -10),
            termsLabel.leadingAnchor.constraint(equalTo: confirmationView.leadingAnchor,constant: 10),
            termsLabel.topAnchor.constraint(equalTo: confirmationView.topAnchor,constant: 10)
        ])
        
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            confirmButton.trailingAnchor.constraint(equalTo: confirmationView.trailingAnchor,constant: -10),
            confirmButton.leadingAnchor.constraint(equalTo: confirmationView.leadingAnchor,constant: 10),
            confirmButton.bottomAnchor.constraint(equalTo: confirmationView.bottomAnchor,constant: -10),
            confirmButton.heightAnchor.constraint(equalToConstant: 40),
            confirmButton.topAnchor.constraint(equalTo: termsLabel.bottomAnchor,constant: 10)
        ])
        
        confirmButton.setTitle("Confirm Reservation", for: .normal)
        confirmButton.backgroundColor = .systemPink
        confirmButton.layer.cornerRadius = 10
        
    }


}

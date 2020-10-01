//
//  RestaurantSummaryCard.swift
//  Romato
//
//  Created by Navati Jain on 2020-09-29.
//

import UIKit

class RestaurantSummaryCard: UIView {
    
    //MARK: UI elements
    lazy var restaurantTitle: UILabel = {
        let restaurantName = UILabel()
        restaurantName.text = "The Stockyards on Yonge Street at York I mean Toronto which is in Ontario but is not the capital of Canada, although it is the capital of Ontario"
    restaurantName.numberOfLines = 0
       restaurantName.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return restaurantName
    }()
    
    lazy var ratingView: RatingView = {
        let ratingView = RatingView()
        ratingView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
       //ratingView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return ratingView
    }()
    
    lazy var titleAndRatingsView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [restaurantTitle,ratingView])
        stackView.spacing = 50
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .top
  
        return stackView
        
    }()
    
    //MARK: Functions
    
    private func setupConstraints(){
        // titleAndRatingsView.addSubviewsWithAutoLayout([restaurantTitle,ratingView])
        addSubviewsWithAutoLayout([titleAndRatingsView])
       
        let constraints = [
            //        restaurantTitle.leadingAnchor.constraint(equalTo: titleAndRatingsView.leadingAnchor),
            //        restaurantTitle.topAnchor.constraint(equalTo: titleAndRatingsView.topAnchor),
            //        restaurantTitle.trailingAnchor.constraint(greaterThanOrEqualTo: ratingView.leadingAnchor, constant: 50),
            //        restaurantTitle.bottomAnchor.constraint(equalTo: titleAndRatingsView.bottomAnchor, constant: 20),
            //        ratingView.topAnchor.constraint(equalTo: titleAndRatingsView.topAnchor, constant: 15),
            //        ratingView.trailingAnchor.constraint(equalTo: titleAndRatingsView.trailingAnchor, constant: 30),
            titleAndRatingsView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            titleAndRatingsView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleAndRatingsView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleAndRatingsView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            titleAndRatingsView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    //MARK: Initalizers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

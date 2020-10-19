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
       // restaurantName.text = "The Stockyards on Yonge Street at York I mean Toronto which is in Ontario but is not the capital of Canada, although it is the capital of Ontario"
       restaurantName.text = "The Stockyards "
        restaurantName.font = Fonts.ofSize(.large, .semiBold)
        restaurantName.numberOfLines = 0
        restaurantName.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return restaurantName
    }()
    
    lazy var ratingView: RatingView = {
        let ratingView = RatingView()
        ratingView.setContentCompressionResistancePriority(.required, for: .horizontal)
        //ratingView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return ratingView
    }()
    
    lazy var titleAndRatingsView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [restaurantTitle,ratingView])
        stackView.spacing = 50
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .top
        return stackView
    }()
    
    lazy var categoryItem: UILabel = {
        let label = UILabel()
        label.text = "Cafe"
        label.font = Fonts.ofSize(.medium, .regular)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var pricingLabel: UILabel = {
        let label = UILabel()
        label.text = "20$ for two"
        label.font = Fonts.ofSize(.medium, .regular)
        label.textColor = Colors.Brand.gray200
        label.numberOfLines = 1
        label.textAlignment = .right //
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    lazy var categoryAndPricingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [categoryItem,pricingLabel])
        stackView.spacing = 50
        stackView.axis = .horizontal
        stackView.distribution = .fill //
        stackView.alignment = .top
        return stackView
        
    }()
    
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Saint Clair Avenue West, Toronto, Ontario, Canada"
        label.font = Fonts.ofSize(.small, .regular)
        label.textColor = Colors.Brand.gray200
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleAndRatingsView,categoryAndPricingStackView,addressLabel])
        stackView.spacing = 5
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    //MARK: Functions
    
    private func setupConstraints(){
        addSubviewsWithAutoLayout([mainStackView])
        
        let constraints = [
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
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

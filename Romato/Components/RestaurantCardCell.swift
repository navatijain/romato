//
//  FoodItemCell.swift
//  Romato
//
//  Created by Navati Jain on 2020-09-29.
//

import UIKit

class RestaurantCardCell: UITableViewCell {
    
    var imageCard = RestaurantCardImageView()
    var restaurantSummaryCard = RestaurantSummaryCard()
    
    func setupView() {
        contentView.addSubviewsWithAutoLayout([imageCard,restaurantSummaryCard])
        
        let constraints = [
            imageCard.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageCard.bottomAnchor.constraint(equalTo: restaurantSummaryCard.topAnchor, constant: -10),
            restaurantSummaryCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            restaurantSummaryCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            restaurantSummaryCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    //MARK: Initalizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        backgroundColor = .clear
        selectionStyle = .none
        isAccessibilityElement = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

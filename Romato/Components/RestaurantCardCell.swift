//
//  FoodItemCell.swift
//  Romato
//
//  Created by Navati Jain on 2020-09-29.
//

import UIKit

class RestaurantCardCell: UITableViewCell {
    var model: RestaurantModel? {
        didSet{
            card.model = model
        }
    }
    
    private var card = RestaurantCardView()
    
    private func setupView() {
        contentView.addSubviewsWithAutoLayout([card])
        let constraints = [
            card.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            card.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
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

//
//  FoodItemCell.swift
//  Romato
//
//  Created by Navati Jain on 2020-09-29.
//

import UIKit

class RestaurantCardCell: UITableViewCell {
    
    private var card = RestaurantCardView()
    
    private func setupView() {
        contentView.addSubviewsWithAutoLayout([card])
        let constraints = card.anchor(to: contentView)
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

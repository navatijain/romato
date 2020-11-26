//
//  RestaurantCardView.swift
//  Romato
//
//  Created by Navati Jain on 2020-11-26.
//

import UIKit

class RestaurantCardView: UIView {

  private var imageCard = RestaurantCardImageView()
  private var restaurantSummaryCard = RestaurantSummaryCard()
    
    func setupView() {
        addSubviewsWithAutoLayout([imageCard,restaurantSummaryCard])
        
        let constraints = [
            imageCard.topAnchor.constraint(equalTo: self.topAnchor),
            imageCard.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageCard.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageCard.bottomAnchor.constraint(equalTo: restaurantSummaryCard.topAnchor),
            restaurantSummaryCard.leadingAnchor.constraint(equalTo: imageCard.leadingAnchor),
            restaurantSummaryCard.trailingAnchor.constraint(equalTo: imageCard.trailingAnchor),
            restaurantSummaryCard.bottomAnchor.constraint(equalTo: self.bottomAnchor),
         ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setBorder(){
        layer.cornerRadius = 10
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.gray.cgColor
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setBorder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

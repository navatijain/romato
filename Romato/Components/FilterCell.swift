//
//  FilterCell.swift
//  Romato
//
//  Created by Navati Jain on 2020-09-28.
//

import UIKit

class FilterCell: UITableViewCell {
    
    let filterComponent = FilterContainerScrollView()
    
    func setup() {
        contentView.addSubviewsWithAutoLayout(filterComponent)
        let constraints = filterComponent.anchor(to: contentView)
        NSLayoutConstraint.activate(constraints)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        backgroundColor = .clear
        selectionStyle = .none
        isAccessibilityElement = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

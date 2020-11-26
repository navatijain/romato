//
//  CollectionScrollView.swift
//  Romato
//
//  Created by Navati Jain on 2020-10-19.
//

import UIKit

class CollectionScrollView: UITableViewCell {
    
    var collectionView = CollectionView()
    
    func setupView() {
        contentView.addSubviewsWithAutoLayout(collectionView)
        
        let constraints = collectionView.anchor(to: contentView)
        NSLayoutConstraint.activate(constraints)
    }
    //MARK: Initalizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        backgroundColor = .clear
        isAccessibilityElement = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

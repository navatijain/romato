//
//  CollectionCell.swift
//  Romato
//
//  Created by Navati Jain on 2020-12-05.
//

import UIKit

class CollectionCell: UICollectionViewCell {

    private var cellCard = CollectionCard()
    private func setupUI(){
        contentView.addSubviewsWithAutoLayout([cellCard])
        let constraints = cellCard.anchor(to: contentView)
        NSLayoutConstraint.activate(constraints)
    }
    
    //MARK: Init
    override init(frame: CGRect){
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

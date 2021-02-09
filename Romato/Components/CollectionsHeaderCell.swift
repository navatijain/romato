//
//  CollectionsHeaderCell.swift
//  Romato
//
//  Created by Navati Jain on 2020-09-29.
//

import UIKit

class CollectionsHeaderCell: UITableViewCell {

    lazy var collectionLabel: UILabel = {
        let label = UILabel()
        label.text = LocalizedString.collections
        label.textColor = Colors.Brand.black
        return label
    }()
    
    lazy var seeAllButton: UILabel =  {
        let label = UILabel()
        label.text = LocalizedString.seeAll
        label.textColor = .red
        return label
    }()
   
    func setupConsraints() {
        contentView.addSubviewsWithAutoLayout([collectionLabel,seeAllButton])
        let constraints = [
            collectionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            collectionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            collectionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10),
            seeAllButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            seeAllButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    //MARK: Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          setupConsraints()
          backgroundColor = .clear
          selectionStyle = .none
          isAccessibilityElement = false
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }

}

//
//  CollectionViewCell.swift
//  Romato
//
//  Created by Navati Jain on 2020-10-19.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        //selectionStyle = .none
        isAccessibilityElement = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupConstraints()
    }
    
    
  
    lazy var collectionImageView: CollectionImageView = {
        let collectionImageView = CollectionImageView()
        return collectionImageView
        
        
    }()
//    // MARK: - Properties
//    lazy var roundedBackgroundView: UIView = {
//        let view = UIView()
//        view.layer.cornerRadius = 10
//        view.layer.borderColor = UIColor.systemGray.cgColor
//        view.layer.borderWidth = 1
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    lazy var titleLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont(name: "HelveticaNeue", size: 20)
//        label.textColor = .systemBlue
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
}

// MARK: - UI Setup
extension CollectionViewCell {
    private func setupConstraints() {
        self.contentView.addSubviewsWithAutoLayout(collectionImageView)
       // roundedBackgroundView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            collectionImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            collectionImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            collectionImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5),
            collectionImageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5),
//            titleLabel.centerXAnchor.constraint(equalTo: roundedBackgroundView.centerXAnchor),
//            titleLabel.centerYAnchor.constraint(equalTo: roundedBackgroundView.centerYAnchor)
        ])
        
    }
}

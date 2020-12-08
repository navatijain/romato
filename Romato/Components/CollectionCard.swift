//
//  CollectionCard.swift
//  Romato
//
//  Created by Navati Jain on 2020-12-04.
//

import UIKit

class CollectionCard: UIView {
    
    //MARK: UI Elements
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "food")
        return imageView
    }()
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Trending This Week"
        label.numberOfLines = 0
        label.textColor = Colors.Brand.white
        return label
    }()
    
    private lazy var placesLabel: UILabel = {
        let label = UILabel()
        label.text = "30 places"
        label.numberOfLines = 0
        label.textColor = Colors.Brand.white
        return label
    }()
    
    //MARK: Methods
    private func setupUI(){
        addSubviewsWithAutoLayout([imageView])
        let constraints = imageView.anchor(to: self)
        NSLayoutConstraint.activate(constraints)
    }
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

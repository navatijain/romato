//
//  FilterButton.swift
//  Romato
//
//  Created by Navati Jain on 2020-09-28.
//

import UIKit

class FilterButton: FilterViewComponentBaseView {
    
    lazy var label: GreyLabel = {
        let label = GreyLabel()
        label.text = LocalizedString.FilterComponent.filters
        return label
        
    }()
    
    lazy  var image: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "filter"))
        imageView.contentMode = .scaleAspectFit
        //  imageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        return imageView
    }()
    
    func setupConstraints() {
        addSubviewsWithAutoLayout([image,label])
        let spacing: CGFloat = 5
        let constraints =
            //label.anchor(to: self)
            [
                image.widthAnchor.constraint(equalToConstant: 24),
                image.heightAnchor.constraint(equalToConstant: 24),
                image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: spacing),
                image.topAnchor.constraint(equalTo: self.topAnchor, constant: spacing),
                image.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -spacing),
                image.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -spacing),
                label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -spacing),
                label.topAnchor.constraint(equalTo: image.topAnchor),
                label.bottomAnchor.constraint(equalTo: image.bottomAnchor),
            ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    //MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

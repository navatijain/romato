//
//  FoodItemImageView.swift
//  Romato
//
//  Created by Navati Jain on 2020-09-29.
//

import UIKit

class RestaurantCardImageView: UIView {

    lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "food")
        return imageView
    }()
    
    lazy var distancelabel: UILabel = {
        let label = UILabel()
        label.text = "5.2 km"
        label.font = Fonts.ofSize(.extraSmall, .regular)
        label.textColor = Colors.Brand.gray200
        return label
    }()
    
    lazy var labelBackground: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Brand.white
        view.layer.cornerRadius = 10
        return view
    }()
    
   lazy var bookmarkImage: UIImageView = {
        let imageView = UIImageView()
         imageView.contentMode = .scaleToFill
         imageView.image = UIImage(named: "bookmark")
     
         return imageView
    }()
    
    lazy var circleBackground: UIView = {
        let view = UIView()
        view.backgroundColor =  Colors.Brand.white
       //view.clipsToBounds = true
        view.layer.cornerRadius = 12.5
        return view
     }()
    
    func setupConstraints() {
        addSubviewsWithAutoLayout([imageView,labelBackground,circleBackground])
        circleBackground.addSubviewsWithAutoLayout(bookmarkImage)
        labelBackground.addSubviewsWithAutoLayout(distancelabel)
        var constraints = imageView.anchor(to: self)
        
        constraints.append(contentsOf: [
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 3/2),
            circleBackground.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            circleBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            circleBackground.widthAnchor.constraint(equalToConstant: 25),
            circleBackground.heightAnchor.constraint(equalToConstant: 25),
            bookmarkImage.centerXAnchor.constraint(equalTo: circleBackground.centerXAnchor),
            bookmarkImage.centerYAnchor.constraint(equalTo: circleBackground.centerYAnchor),
            bookmarkImage.widthAnchor.constraint(equalToConstant: 12),
            bookmarkImage.heightAnchor.constraint(equalToConstant: 12),
            labelBackground.trailingAnchor.constraint(equalTo: circleBackground.trailingAnchor),
            labelBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            labelBackground.heightAnchor.constraint(equalTo: distancelabel.heightAnchor, constant: 8),
            labelBackground.widthAnchor.constraint(equalTo: distancelabel.widthAnchor, constant: 25),
            distancelabel.centerXAnchor.constraint(equalTo: labelBackground.centerXAnchor),
            distancelabel.centerYAnchor.constraint(equalTo: labelBackground.centerYAnchor),
        ])
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

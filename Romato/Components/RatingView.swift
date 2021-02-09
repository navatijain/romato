//
//  RatingView.swift
//  Romato
//
//  Created by Navati Jain on 2020-09-29.
//

import UIKit

class RatingView: UIView {
    
    //MARK: UI Elements
    private lazy var starImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "4.6 /5"
        label.numberOfLines = 1
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.font = Fonts.ofSize(.small, .bold)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [starImage, label])
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center //?
        return stackView
    }()
    
    //MARK: Functions
    func setupConstraints() {
        addSubviewsWithAutoLayout(stackView)
        var constraints = stackView.anchor(to: self, with: UIEdgeInsets(top: 5, left: 5, bottom: -5, right: -5))
        constraints.append(contentsOf: [
            starImage.widthAnchor.constraint(equalToConstant: 10),
            starImage.heightAnchor.constraint(equalToConstant: 10)
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

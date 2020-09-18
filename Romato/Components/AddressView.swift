//
//  AddressView.swift
//  Romato
//
//  Created by Navati Jain on 2020-09-06.
//

import UIKit

class AddressView: UIView {
    
    override var intrinsicContentSize: CGSize {
        let size =  super.intrinsicContentSize
        return CGSize(width: size.width, height: 48)
    }
    //MARK: UI components
    lazy var pinImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "location")
        imageView.contentMode = .scaleAspectFit
        imageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        return imageView
    }()
    
    lazy var addressTitle: UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addressLabelPressed)))
        label.text = "Fort York Boulevard"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pinImage, addressTitle])
        stackView.spacing = 10
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
       // stackView.alignment = .bottom
        return stackView
    }()
    
    lazy var dottedLine: UIView =  {
        let dottedLine = UIView()
        dottedLine.backgroundColor = .red
        //dottedLine.createDottedLine(width: 10.0, color: UIColor.red.cgColor)
        return dottedLine
    }()
    
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [horizontalStackView, dottedLine])
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.backgroundColor = .yellow
        return stackView
    }()
    
    //MARK: Functions
    func setup() {
        backgroundColor = .blue
        addSubviewsWithAutoLayout([verticalStackView])
        
        var constraints = verticalStackView.anchor(to: self, with: UIEdgeInsets(top: 5, left: 5, bottom: -5, right: -5))
        
        constraints.append(contentsOf: [
            pinImage.widthAnchor.constraint(equalToConstant: 48),
            pinImage.heightAnchor.constraint(equalToConstant: 48),
            dottedLine.heightAnchor.constraint(equalToConstant: 5)
        ])
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func addressLabelPressed(){
        
    }
    
    //MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

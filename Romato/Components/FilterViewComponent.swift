//
//  FilterViewComponent.swift
//  Romato
//
//  Created by Navati Jain on 2020-09-20.
//

import UIKit

class FilterViewComponent: UIView {
    
    var labelText: String = "" {
        didSet {
            label.text = labelText
        }
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
      // label.numberOfLines = 0
        label.textColor = .blue
        //label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()
    
    func setup() {
        setBorder()
        addSubviewsWithAutoLayout([label])
        let spacing: CGFloat = 10
        let constraints = label.anchor(to: self,with: UIEdgeInsets(top: spacing , left: spacing, bottom: -spacing, right: -spacing))
        NSLayoutConstraint.activate(constraints)
    }
    
    func setBorder() {
        layer.borderWidth = 1
        layer.borderColor =  Colors.Brand.gray100.cgColor
        //layer.borderColor =  UIColor.systemPink.cgColor
    }
    
    //MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        //labelText = "default"
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.height = 50
        return size
    }
}

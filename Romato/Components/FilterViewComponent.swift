//
//  FilterViewComponent.swift
//  Romato
//
//  Created by Navati Jain on 2020-09-20.
//

import UIKit

class FilterViewComponent: FilterViewComponentBaseView {
    
    var labelText: String = "" {
        didSet {
            label.text = labelText
        }
    }
    
    private var label = GreyLabel()
    private func setup() {
        setBorder()
        addSubviewsWithAutoLayout([label])
        let spacing: CGFloat = 5
        let constraints = label.anchor(to: self,with: UIEdgeInsets(top: spacing , left: spacing, bottom: -spacing, right: -spacing))
        NSLayoutConstraint.activate(constraints)
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

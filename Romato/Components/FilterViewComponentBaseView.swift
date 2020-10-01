//
//  FilterViewComponentBaseView.swift
//  Romato
//
//  Created by Navati Jain on 2020-09-28.
//

import UIKit

class FilterViewComponentBaseView: UIView {

    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.height = 50
        return size
    }
    
    func setBorder() {
        layer.borderWidth = 1
        layer.borderColor =  Colors.Brand.gray100.cgColor
    }
    
    @objc func onClick() {
        print("click")
    }
    
    //MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBorder()
        isUserInteractionEnabled = true
        addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(onClick)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

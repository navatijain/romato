//
//  FilterViewComponentBaseView.swift
//  Romato
//
//  Created by Navati Jain on 2020-09-28.
//

import UIKit

class FilterViewComponentView: UIView {

    private var shadowLayer: CAShapeLayer!
    private var cornerRadius: CGFloat = 1.0
    private var fillColor: UIColor = .blue // the color applied to the shadowLayer, rather than the view's backgroundColor
     
    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.height = 50
        return size
    }
    
    func setBorder() {
        layer.borderWidth = 3
        layer.borderColor =  Colors.Brand.gray200.cgColor
       //layer.backgroundColor = UIColor.red.cgColor
//        layer.shadowColor = UIColor.red.cgColor
//        layer.shadowOffset = CGSize(width: 2, height: 2)
//        layer.shadowOpacity = 0.8
//        layer.shadowRadius = 2.0
       layer.cornerRadius = 10
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

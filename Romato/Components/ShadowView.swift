//
//  FilterViewComponentBaseView.swift
//  Romato
//
//  Created by Navati Jain on 2020-09-28.
//

import UIKit

class ShadowView: UIView {
     
    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.height = 50
        return size
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor =  Colors.Brand.gray200.cgColor
        view.layer.cornerRadius = 10
        view.layer.backgroundColor = UIColor.white.cgColor //so important
        return view
    }()
    
    private func setBorder() {
        layer.borderWidth = 0.2
        layer.borderColor =  Colors.Brand.gray200.cgColor
        layer.cornerRadius = 10
    }
    
    func setShadow(){
        // layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor =  Colors.Brand.gray50.cgColor
        layer.shadowOffset = CGSize(width: 2.0, height: 2)
        layer.shadowOpacity = 0.9
        layer.shadowRadius = 1
    }
    
    private func setupUI(){
        addSubviewsWithAutoLayout(containerView)
        let constraints = containerView.anchor(to: self)
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func onClick() {
        print("click")
    }
    
    //MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        //setBorder()
        setShadow()
        setupUI()
        isUserInteractionEnabled = true
        addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(onClick)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

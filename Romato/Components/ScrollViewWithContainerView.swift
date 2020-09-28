//
//  ScrollViewWithContentView.swift
//  WheresMyLoo
//
//  Created by Navati Jain on 2020-05-28.
//  Copyright © 2020 Navati Jain. All rights reserved.
//

import UIKit

class ScrollViewWithContainerView: UIScrollView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var containerView = UIView()
    
    
    private func setup() {
        addSubview(containerView.autolayout())
        let constraints = [containerView.heightAnchor.constraint(equalTo: self.heightAnchor),
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        containerView.topAnchor.constraint(equalTo: self.topAnchor),
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
}

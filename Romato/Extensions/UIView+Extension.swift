//
//  UIView+Extension.swift
//  WheresMyLoo
//
//  Created by Navati Jain on 2020-01-17.
//  Copyright © 2020 Navati Jain. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    func addSubviewsWithAutoLayout(_ views: [UIView]) {
        views.forEach { (view) in
            addSubview(view.autolayout())
        }
    }
    
    func addSubviewsWithAutoLayout(_ view: UIView) {
        addSubview(view.autolayout())
    }
    
    func autolayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    func anchor(to view: UIView, with inset: UIEdgeInsets = .zero) -> [NSLayoutConstraint] {
        let constraints = [
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset.left),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: inset.right),
            topAnchor.constraint(equalTo: view.topAnchor, constant: inset.top),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: inset.bottom),
        ]
        return constraints
    }
    
    func anchor(to layoutGuide: UILayoutGuide, with inset: UIEdgeInsets = .zero) -> [NSLayoutConstraint] {
        let constraints = [
            leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: inset.left),
            trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: inset.right),
            topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: inset.top),
            bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: inset.bottom),
        ]
        return constraints
    }
    
    //MARK: Dotted Lines
    func createDottedLine(width: CGFloat, color: CGColor) {
          let caShapeLayer = CAShapeLayer()
          caShapeLayer.strokeColor = color
          caShapeLayer.lineWidth = width
          caShapeLayer.lineDashPattern = [2,3]
          let cgPath = CGMutablePath()
          let cgPoint = [CGPoint(x: 0, y: 0), CGPoint(x: self.frame.width, y: 0)]
          cgPath.addLines(between: cgPoint)
          caShapeLayer.path = cgPath
          layer.addSublayer(caShapeLayer)
       }
}

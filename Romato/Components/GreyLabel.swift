//
//  GreyLabel.swift
//  Romato
//
//  Created by Navati Jain on 2020-09-28.
//

import UIKit

class GreyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = Colors.Brand.gray500
        textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  Colors.swift
//  Romato
//
//  Created by Navati Jain on 2020-09-20.
//

import Foundation
import UIKit
public struct Colors {
    public struct Brand {
        static let black = UIColor(hexString: "#1e1f26")
        static let gray200 = UIColor(hexString: "#949494")
        static let gray400 = UIColor(hexString: "#696969")
        static let gray500 = UIColor(hexString: "#838383")
        static let gray300 = UIColor(hexString: "#DEDDDE")
        static let white = UIColor(hexString: "#ffffff")
        static let orange = UIColor(hexString: "#f45905")
        static let gray100 = UIColor(hexString: "#d1d5de")
        static let gray50 = UIColor(hexString: "D3D3D3")
        
    }
    
    public struct Border {
        static let defaultColor = Brand.white
        static let selectedColor = Brand.orange
    }
    public static let background = Brand.black
    public static let spinner = Brand.orange
    
    
}


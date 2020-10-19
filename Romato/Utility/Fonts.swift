//
//  Fonts.swift
//  WheresMyLoo
//
//  Created by Navati Jain on 2020-01-16.
//  Copyright © 2020 Navati Jain. All rights reserved.
//

import UIKit

struct Fonts {
    
    public static func register() {
        
           for fontPath in Bundle.main.paths(forResourcesOfType: "ttf", inDirectory: nil) {
               guard let fontData = try? Data(contentsOf: URL(fileURLWithPath: fontPath)),
                   let provider = CGDataProvider(data: fontData as CFData),
                   let font = CGFont(provider),
                   CTFontManagerRegisterGraphicsFont(font, nil) == true
               else {
                   print("Failed to register font at path \(fontPath)")
                   continue
               }
           }
       }
    
    public enum Weight: String {
        case black = "NunitoSans-Black"
        case blackItalic = "NunitoSans-BlackItalic"
        case bold = "NunitoSans-Bold"
        case boldItalic = "NunitoSans-BoldItalic"
        case extraBold = "NunitoSans-ExtraBold"
        case extraBoldItalic = "NunitoSans-ExtraBoldItalic"
        case extraLight = "NunitoSans-ExtraLight"
        case extraLightItalic = "NunitoSans-ExtraLightItalic"
        case italic = "NunitoSans-Italic"
        case light = "NunitoSans-Light"
        case lightItalic = "NunitoSans-LightItalic"
        case regular = "NunitoSans-Regular"
        case semiBold = "NunitoSans-SemiBold"
        case semiBoldItalic = "NunitoSans-SemiBoldItalic"
    }

    public enum Size: CGFloat {
        case extraSmall = 12.0
        case small = 14.0
        case medium = 16.0
        case large = 18.0
        case extraLarge = 20.0
    }
    
    
    /*This function returns optional UIFont given the following parameters:
    - Parameters:
        - size: The font size.
        - weight: The font weight of type Weight. The `rawValue` of this enum is the name of the font.
        - scaledForDynamicType: Bool value (default: true) indicating if dynamic font support is needed.
    - Returns: UIFont
    If the named font cannot be found on the device, then **ChalkboardSE-Regular** is used instead.
    */
    public static func ofSize(_ size: CGFloat, _ weight: Weight, scaledForDynamicType: Bool = true) -> UIFont {
        let finalSize = scaledForDynamicType ? scaledFontSize(for: size) : size
        if let font = UIFont(name: weight.rawValue, size: finalSize) {
            return font
        }
        else {
            return UIFont(name: "ChalkboardSE-Regular", size: finalSize)!
        }
    }

    /**
    This function returns optional UIFont given the following parameters:
    - Parameter size: The font size. This must be a value from the enum Size
    - Parameter weight: The font weight of type Weight.
    - Parameter scaledForDynamicType: Bool value (default: true) indicating if dynamic font support is needed
    - Returns: UIFont
    If the named font cannot be found on the device, then **ChalkboardSE-Regular** is used instead.
    */
    public static func ofSize(_ size: Size, _ weight: Weight, scaledForDynamicType: Bool = true) -> UIFont {
        return ofSize(size.rawValue, weight, scaledForDynamicType: scaledForDynamicType)
    }

    // swiftlint:enable force_unwrapping

    // MARK: - Dynamic Type scaling
    /**
     This function returns the scaled font
     - Parameter originalSize: The original font size.
     - Returns: scaled font size
     */
    private static func scaledFontSize(for originalSize: CGFloat) -> CGFloat {
        let currentSetting = UIApplication.shared.preferredContentSizeCategory
        return originalSize + currentSetting.adjustmentFromBaseSize
    }
}

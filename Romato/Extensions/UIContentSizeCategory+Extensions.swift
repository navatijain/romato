//
//  UIContentSizeCategory.swift
//  WheresMyLoo
//
//  Created by Jaykumar hiranandani on 2020-06-28.
//  Copyright © 2020 Navati Jain. All rights reserved.

import UIKit

public extension UIContentSizeCategory {
    /**
     This property returns a CGFloat value depending on the UIContentSizeCategory

     [Apple’s size tables]:
     https://developer.apple.com/ios/human-interface-guidelines/visual-design/typography/

    Based on [Apple’s size tables]
     */
    var adjustmentFromBaseSize: CGFloat {
        switch self {
        case UIContentSizeCategory.extraSmall:
            return -3

        case UIContentSizeCategory.small:
            return -2

        case UIContentSizeCategory.medium:
            return -1

        case UIContentSizeCategory.large:
            return 0

        case UIContentSizeCategory.extraLarge:
            return 2

        case UIContentSizeCategory.extraExtraLarge:
            return 4

        case UIContentSizeCategory.extraExtraExtraLarge:
            return 6

        case UIContentSizeCategory.accessibilityMedium:
            return 11

        case UIContentSizeCategory.accessibilityLarge:
            return 16

        case UIContentSizeCategory.accessibilityExtraLarge:
            return 23

        case UIContentSizeCategory.accessibilityExtraExtraLarge:
            return 30

        case UIContentSizeCategory.accessibilityExtraExtraExtraLarge:
            return 36

        default:
            return 0
        }
    }
}

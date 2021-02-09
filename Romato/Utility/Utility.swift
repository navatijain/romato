//
//  Utility.swift
//  Romato
//
//  Created by Navati Jain on 2020-12-16.
//

import Foundation

extension String {
    func convertToInteger() -> Int? {
        guard let doubleValue = Double(self) else { return nil }
        return Int(doubleValue)
    }
}

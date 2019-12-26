//
//  StringExtension.swift
//  poi
//
//  Created by Teknasyon-S on 20.11.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import Foundation

extension String {
    func toDouble() -> Double? {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        return formatter.number(from: self)?.doubleValue
    }
}

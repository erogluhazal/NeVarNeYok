//
//  MakeRequest.swift
//  poi
//
//  Created by Teknasyon-S on 18.10.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let idx1 = index(startIndex, offsetBy: max(0, range.lowerBound))
        let idx2 = index(startIndex, offsetBy: min(self.count, range.upperBound))
        return String(self[idx1..<idx2])
    }
}

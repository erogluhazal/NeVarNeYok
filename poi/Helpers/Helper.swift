//
//  Helper.swift
//  poi
//
//  Created by Teknasyon-S on 20.11.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    ///turkish characters converting to english characters
    static func turkishCharacterConverting(word: String) -> String {
        var tempword = word
        tempword = tempword.replacingOccurrences(of: "Ç", with: "c")
        tempword = tempword.replacingOccurrences(of: "ç", with: "c")
        tempword = tempword.replacingOccurrences(of: "Ğ", with: "g")
        tempword = tempword.replacingOccurrences(of: "ğ", with: "g")
        tempword = tempword.replacingOccurrences(of: "ı", with: "i")
        tempword = tempword.replacingOccurrences(of: "İ", with: "i")
        tempword = tempword.replacingOccurrences(of: "Ö", with: "o")
        tempword = tempword.replacingOccurrences(of: "ö", with: "o")
        tempword = tempword.replacingOccurrences(of: "Ş", with: "s")
        tempword = tempword.replacingOccurrences(of: "ş", with: "s")
        tempword = tempword.replacingOccurrences(of: "Ü", with: "u")
        tempword = tempword.replacingOccurrences(of: "ü", with: "u")
        tempword = tempword.replacingOccurrences(of: " ", with: "")
        return(tempword)
    }
}

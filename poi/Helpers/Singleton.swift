//
//  Singleton.swift
//  poi
//
//  Created by Teknasyon-S on 12.11.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import Foundation

class Singleton {
    var query: String = ""
    static let shared = Singleton()
}

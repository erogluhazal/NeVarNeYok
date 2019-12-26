//
//  Hours.swift
//  poi
//
//  Created by Teknasyon-S on 15.11.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import Foundation

struct HoursModel: Codable {
    let status: String?
    let isOpen, isLocalHoliday: Bool?
    let timeframes: [TimeframeModel]?
}

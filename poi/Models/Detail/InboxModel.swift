//
//  InboxModel.swift
//  poi
//
//  Created by Teknasyon-S on 15.11.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import Foundation

struct InboxModel: Codable {
    let count: Int?
    let items: [InboxItemModel]?
}

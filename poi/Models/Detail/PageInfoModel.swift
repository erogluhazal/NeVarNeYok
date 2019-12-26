//
//  PageInfoModel.swift
//  poi
//
//  Created by Teknasyon-S on 15.11.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import Foundation

struct PageInfoModel: Codable {
    let description: String?
    let banner: String?
    let links: InboxModel?
}

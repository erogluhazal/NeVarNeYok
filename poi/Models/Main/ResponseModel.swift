//
//  responseModel.swift
//  poi
//
//  Created by Teknasyon-S on 18.10.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import Foundation

struct ResponseModel: Codable {
    var headerLocation: String?
    var headerFullLocation: String?
    var query: String?
    var groups: [GroupsModel]?
}

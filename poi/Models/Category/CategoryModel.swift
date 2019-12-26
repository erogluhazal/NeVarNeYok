//
//  CategoryModel.swift
//  poi
//
//  Created by Teknasyon-S on 26.10.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import Foundation

struct CategoryModel: Codable {
    var categories: [CategoriesModel]?
    var id: String?
    var name: String?
    var pluralName: String?
    var shortName: String?
}

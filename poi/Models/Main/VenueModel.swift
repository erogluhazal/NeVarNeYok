//
//  venueModel.swift
//  poi
//
//  Created by Teknasyon-S on 18.10.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import Foundation

struct VenueModel: Codable {
    var id: String?
    var name: String?
    var location: LocationModel?
    var categories: [CategoriesModel]?
}

//
//  DetailVenueModel.swift
//  poi
//
//  Created by Teknasyon-S on 15.11.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import Foundation

struct DetailVenueModel: Codable {
    let id: String?
    let name: String?
    let contact: VenueContactModel?
    let location: LocationModel?
    let categories: [CategoriesModel]?
    let url: String?
    let rating: Double?
    let description: String?
    let page: PageModel?
    let hours: HoursModel?
}

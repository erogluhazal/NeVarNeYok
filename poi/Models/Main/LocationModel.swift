//
//  locationModel.swift
//  poi
//
//  Created by Teknasyon-S on 18.10.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import Foundation

struct LocationModel: Codable {
    var address: String?
    var crossStreet: String?
    var lat: Double?
    var lng: Double?
    var cc: String?
    var city: String?
    var state: String?
    var country: String?
    var formattedAdress: String?
}

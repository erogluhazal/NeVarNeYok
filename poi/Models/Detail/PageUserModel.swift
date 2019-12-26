//
//  PageUserModel.swift
//  poi
//
//  Created by Teknasyon-S on 15.11.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import Foundation

struct PageUserModel: Codable {
    let firstName: String
    let photo: IconClass
    let type: String
    let homeCity, bio: String
    let contact: UserContact
}

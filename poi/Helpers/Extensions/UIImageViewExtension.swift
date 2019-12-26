//
//  image.swift
//  poi
//
//  Created by Teknasyon-S on 20.11.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL, type: ImageType) {
        DispatchQueue.global().async {
            [weak self] in
            do {
                let data = try Data(contentsOf: url)
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            } catch {
                print(error)
                if type == .bigImage {
                    self?.image = UIImage(named: "poiimage")
                    self?.alpha = 0.5
                } else {
                    self?.image = UIImage(named: "poiimage2")
                }
            }
        }
    }
}
enum ImageType {
    case bigImage
    case smallImage
}

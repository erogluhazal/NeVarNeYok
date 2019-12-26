//
//  ThirdCollectionViewCell.swift
//  poi
//
//  Created by Teknasyon-S on 20.11.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import Foundation
import UIKit

class ThirdCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var instagramButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var webButton: UIButton!
    @IBOutlet weak var phoneicon: UIImageView!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var twittericon: UIImageView!
    @IBOutlet weak var instagramicon: UIImageView!
    @IBOutlet weak var facebookicon: UIImageView!
    @IBOutlet weak var webicon: UIImageView!
    var twitterAddress: String?
    var instagramAddress: String?
    var facebookAddress: String?
    var webAddress: String?
    var phoneNumber: String?
    var newPhone: String?
    @IBOutlet weak var phoneButton: UIButton!
    
    @IBAction func twitter(_ sender: UIButton) {
        if let twitterUsername = twitterAddress {
            let twitterUrl = "https://twitter.com/"
            let newTwitterUrl = twitterUrl + twitterUsername
            if let url = URL(string: newTwitterUrl) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    @IBAction func instagram(_ sender: UIButton) {
        if let instagramUsername = instagramAddress {
            let instagramUrl = "https://instagram.com/"
            let newInstagramUrl = instagramUrl + instagramUsername
            if let url = URL(string: newInstagramUrl) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    @IBAction func facebook(_ sender: UIButton) {
        if let facebookUsername = facebookAddress {
            let facebookUrl = "https://facebook.com/"
            let newFacebookUrl = facebookUrl + facebookUsername
            if let url = URL(string: newFacebookUrl) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    @IBAction func web(_ sender: UIButton) {
        if let webSite = webAddress {
            let webUrl = webSite
            if let url = URL(string: webUrl) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    @IBAction func phone(_ sender: UIButton) {
        if newPhone != nil {
            guard let number = URL(string: "tel://" + newPhone!) else { return }
            UIApplication.shared.open(number)
        }
    }
}

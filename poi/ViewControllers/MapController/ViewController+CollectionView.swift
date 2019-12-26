//
//  ViewController+CollectionView.swift
//  poi
//
//  Created by Teknasyon-S on 20.11.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    // MARK: Collection View Data Source Methods
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // firstCell
        if indexPath.row == 0 {
            let firstCell = collectionView.dequeueReusableCell(withReuseIdentifier: IdentifierShortcuts.detailFirstCell, for: indexPath) as? FirstCollectionViewCell
            firstCell?.name.text = detailModel?.response?.venue?.name
            firstCell?.adress.text = detailModel?.response?.venue?.location?.address
            firstCell?.category.text = detailModel?.response?.venue?.categories?[0].name
            if let rating = detailModel?.response?.venue?.rating {
                let ratingStr = String(rating)
                firstCell?.raiting.text = ratingStr
            }
            if detailModel?.response?.venue?.hours?.isOpen ?? false {
                firstCell?.hour.text = StringShortcuts.open
            }
            firstCell?.hour.text = StringShortcuts.closed
            let prefixUrl = String((detailModel?.response?.venue?.categories?[0].icon?.prefix) ?? "")
            let suffixUrl = String((detailModel?.response?.venue?.categories?[0].icon?.suffix) ?? "")
            let urlString = prefixUrl + suffixUrl
            if let url: URL = URL(string: urlString) {
                firstCell?.detailImage.load(url: url, type: ImageType.smallImage)
            } else {
                firstCell?.detailImage.image = UIImage (named: "poiimage2")!
            }
            return firstCell!
        }
        // secondCell
        else if indexPath.row == 1 {
            let secondCell = collectionView.dequeueReusableCell(withReuseIdentifier: IdentifierShortcuts.detailSecondCell, for: indexPath) as? SecondCollectionViewCell
            let prefixUrl = String((detailModel?.response?.venue?.categories?[0].icon?.prefix) ?? "")
            let suffixUrl = String((detailModel?.response?.venue?.categories?[0].icon?.suffix) ?? "")
            let urlString = prefixUrl + suffixUrl
            if let url: URL = URL(string: urlString) {
                secondCell?.detailImage.load(url: url, type: ImageType.bigImage)
            } else {
                secondCell?.detailImage.image = UIImage (named: "poiimage")!
                secondCell?.detailImage.alpha = 0.5
            }
            secondCell?.detailDescription.text = detailModel?.response?.venue?.description
            if detailModel?.response?.venue?.hours?.isOpen ?? false {
                secondCell?.isOpen.text = StringShortcuts.open
            }
            secondCell?.isOpen.text = StringShortcuts.closed
            if detailModel?.response?.venue?.hours?.isLocalHoliday ?? false {
                secondCell?.holiday.text = StringShortcuts.open
            }
            secondCell?.holiday.text = StringShortcuts.closed
            secondCell?.days.text = detailModel?.response?.venue?.hours?.timeframes?[0].days
            secondCell?.hours.text = detailModel?.response?.venue?.hours?.timeframes?[0].timeframeOpen?[0].renderedTime
            //  secondCell?.detailImage.image = handleOperationWithData(data: sdf)
            return secondCell!
        }
            //thirdCell
        else {
            let thirdCell = collectionView.dequeueReusableCell(withReuseIdentifier: IdentifierShortcuts.detailThirdCell, for: indexPath) as? ThirdCollectionViewCell
            let prefixUrl = String((detailModel?.response?.venue?.categories?[0].icon?.prefix) ?? "")
            let suffixUrl = String((detailModel?.response?.venue?.categories?[0].icon?.suffix) ?? "")
            let urlString = prefixUrl + suffixUrl
            if let url: URL = URL(string: urlString) {
                thirdCell?.detailImage.load(url: url, type: ImageType.bigImage)
            } else {
                thirdCell?.detailImage.image = UIImage (named: "poiimage")!
                thirdCell?.detailImage.alpha = 0.5
            }
            thirdCell?.newPhone = detailModel?.response?.venue?.contact?.phone
            thirdCell?.phoneButton.setTitle(detailModel?.response?.venue?.contact?.formattedPhone, for: .normal)
            thirdCell?.phoneNumber = detailModel?.response?.venue?.contact?.formattedPhone
            thirdCell?.twitterButton.setTitle(detailModel?.response?.venue?.contact?.twitter, for: .normal)
            thirdCell?.twitterAddress = detailModel?.response?.venue?.contact?.twitter
            thirdCell?.instagramButton.setTitle(detailModel?.response?.venue?.contact?.instagram, for: .normal)
            thirdCell?.instagramAddress = detailModel?.response?.venue?.contact?.instagram
            thirdCell?.facebookButton.setTitle(detailModel?.response?.venue?.contact?.facebookUsername, for: .normal)
            thirdCell?.facebookAddress = detailModel?.response?.venue?.contact?.facebookUsername
            if let url = detailModel?.response?.venue?.page?.pageInfo?.links?.items?[0].url {
                thirdCell?.webAddress = url
                thirdCell?.webButton.setTitle(url, for: .normal)
            } else {
                thirdCell?.webAddress = nil
                thirdCell?.webButton.setTitle(nil, for: .normal)
            }
            return thirdCell!
        }
    }
}
///Image Request
//                let imageRequet = URLRequest(url: url)
//                let urlSession = URLSession()
//                urlSession.dataTask(with: imageRequet) { (data, response, error) in
//                    if error == nil, let strongData = data {
//                        firstCell?.detailImage.image = UIImage(data: strongData)
//                    } else {
//                        firstCell?.detailImage.image = nil
//                    }
//                }

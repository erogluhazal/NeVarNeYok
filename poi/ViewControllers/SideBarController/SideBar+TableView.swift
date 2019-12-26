//
//  SideBar+TableView.swift
//  poi
//
//  Created by Teknasyon-S on 20.11.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import Foundation
import UIKit

extension SideBar: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if model?.response == nil {
            return 0
        } else {
            return (model?.response?.categories?.count)!
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath) as! SideBarCell
        cell.categoryName.text = model?.response?.categories?[indexPath.row].pluralName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Singleton.shared.query = model?.response?.categories?[indexPath.row].pluralName ?? ""
        print(Singleton.shared.query)
        NotificationCenter.default.post(Notification(name: Notification.Name(IdentifierShortcuts.trigger)))
        sideMenuController?.hideMenu()
        viewController?.myLocation()
        }
}

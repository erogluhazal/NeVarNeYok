//
//  SideBar.swift
//  poi
//
//  Created by Teknasyon-S on 24.10.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import UIKit
import MapKit

class SideBar: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var categoriesTable: UITableView!
    var model: MainModel?
    var locationManager = CLLocationManager()
    var viewController: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let req = CategoryRequest()
        req.makeRequest(closure: { (model) in
            self.model = model
            self.categoriesTable.reloadData()
        })
        //location
        locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.distanceFilter = 500
            locationManager.startUpdatingLocation()
        }
    }
}

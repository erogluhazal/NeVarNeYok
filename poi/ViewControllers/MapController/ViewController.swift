//
//  ViewController.swift
//  poi
//
//  Created by Teknasyon-S on 18.10.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import UIKit
import MapKit
import SideMenuSwift
import AVKit

class ViewController: UIViewController {
    
    var detailModel: DetailMainModel?
    var choosenLatitude = ""
    var choosenLongitude = ""
    var locationCoord: CLLocationCoordinate2D?
    var locationManager = CLLocationManager()
    var model: MainModel?
    var poiModel: PoiModel?
    var annotationTapped: MKAnnotation?
    
    @IBOutlet weak var menu: UIBarButtonItem!
    @IBOutlet weak var mapKitView: MKMapView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailView.isHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(trigger(_:)), name: Notification.Name(IdentifierShortcuts.trigger), object: nil)
        locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.distanceFilter = 500
            locationManager.startUpdatingLocation()
        }
        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.chooseLocation(gestureRecognizer:)))
        recognizer.minimumPressDuration = 2
        mapKitView.addGestureRecognizer(recognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.choosenLatitude = ""
        self.choosenLongitude = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func myLocation(_ sender: UIButton) {
        myLocation()
    }
    //Side Menu Icon click
    @IBAction func menuClicked(_ sender: Any) {
        self.sideMenuController?.revealMenu()
        self.detailView.isHidden = true
    }
}

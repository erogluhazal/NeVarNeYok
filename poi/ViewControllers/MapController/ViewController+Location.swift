//
//  ViewController+Location.swift
//  poi
//
//  Created by Teknasyon-S on 20.11.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import Foundation
import UIKit
import MapKit

extension ViewController: CLLocationManagerDelegate {
    
    @objc func chooseLocation(gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer.state == UIGestureRecognizer.State.began {
            let touches = gestureRecognizer.location(in: self.mapKitView)
            let coordinates = self.mapKitView.convert(touches, toCoordinateFrom: self.mapKitView)
            let lat: String = "\(coordinates.latitude)"
            let long: String = "\(coordinates.longitude)"
            let locationLL = lat + "," + long
            let searchRequest = VenueSearchRequest()
            searchRequest.makeRequest(limit: "1", ll: locationLL, query: "") { (poiModel) in
                dump(poiModel)
                self.setAnnotations(poiModel: poiModel)
            }
        }
        self.detailView.isHidden = true
        self.navigationItem.title = ""
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationCoord = manager.location?.coordinate
        setRegionForMapkit()
        let locationLL = createLLParamter()
        let searchRequest = VenueSearchRequest()
        let query = Singleton.shared.query
        let trimmed = Helper.turkishCharacterConverting(word: query)
        searchRequest.makeRequest(limit: "10", ll: locationLL, query: trimmed) { (poiModel) in
            dump(poiModel)
            self.setAnnotations(poiModel: poiModel)
        }
    }
    
    @objc func trigger(_ notification: Notification?) {
        let annotations = mapKitView.annotations
        mapKitView.removeAnnotations(annotations)
        guard let loc = locationCoord else { return }

        let locationLL = createLLParamter()
        let searchRequest = VenueSearchRequest()
        let query = Singleton.shared.query
        let trimmed = Helper.turkishCharacterConverting(word: query)
        searchRequest.makeRequest(limit: "10", ll: locationLL, query: trimmed) { (poiModel) in
            dump(poiModel)
            self.setAnnotations(poiModel: poiModel)
        }
        self.navigationItem.title = Singleton.shared.query
    }
    
    @IBAction func categoryClean(_ sender: UIButton) {
        let annotations = mapKitView.annotations
        mapKitView.removeAnnotations(annotations)
        let locationLL = createLLParamter()
        let searchRequest = VenueSearchRequest()
        searchRequest.makeRequest(limit: "10", ll: locationLL, query: "") { (poiModel) in
            dump(poiModel)
            self.setAnnotations(poiModel: poiModel)
        }
        self.detailView.isHidden = true
        self.navigationItem.title = ""
    }
    
    func createLLParamter() -> String {
        let lat: String = "\((locationCoord?.latitude)!)"
        let long: String = "\((locationCoord?.longitude)!)"
        return lat + "," + long
    }
    
    func setRegionForMapkit() {
        let locationCoordinate = CLLocationCoordinate2DMake(locationCoord?.latitude ?? 0, locationCoord?.longitude ?? 0)
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: locationCoordinate, span: span)
        self.mapKitView.setRegion(region, animated: true)
    }
    
    func setAnnotations(poiModel: PoiModel?) {
        self.poiModel = poiModel
        let items = poiModel?.response?.groups?[0].items
        let annotations = self.createAnnotations(items: items!)
        self.mapKitView.addAnnotations(annotations)
    }
    
    func createAnnotations(items: [ItemsModel]) -> [MKAnnotation] {
        var annotations: [MKAnnotation] = []
        for item in items {
            let lat = item.venue?.location?.lat
            let lng = item.venue?.location?.lng
            let annotation = MKPointAnnotation()
            let centerCoordinate = CLLocationCoordinate2D(latitude: lat ?? 0, longitude: lng ?? 0)
            annotation.coordinate = centerCoordinate
            annotation.title = item.venue?.name
            annotations.append(annotation)
        }
        return annotations
    }
    
    func myLocation() {
        let locationCoordinate = CLLocationCoordinate2DMake(locationCoord?.latitude ?? 0, locationCoord?.longitude ?? 0)
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: locationCoordinate, span: span)
        self.mapKitView.setRegion(region, animated: true)
        self.detailView.isHidden = true
    }
}

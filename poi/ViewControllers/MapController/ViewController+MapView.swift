//
//  ViewController+MapView.swift
//  poi
//
//  Created by Teknasyon-S on 20.11.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import Foundation
import UIKit
import MapKit

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: IdentifierShortcuts.pin)
        pin.canShowCallout = true
        pin.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        let navigationButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let navImage = UIImage(named: "map")
        navigationButton.setImage(navImage, for: .normal)
        pin.leftCalloutAccessoryView = navigationButton
        navigationButton.addTarget(self, action: #selector(navigate(sender:)), for: .touchUpInside)
        
        return pin
    }
    
    @objc func navigate(sender: Any) {
        var detailReq = DetailRequest()
        let detailLat: Double = Double(annotationTapped?.coordinate.latitude ?? 0)
        let detailLng: Double = Double(annotationTapped?.coordinate.longitude ?? 0)
        for element in poiModel?.response?.groups?[0].items ?? [ItemsModel()] {
            if element.venue?.location?.lat == detailLat && element.venue?.location?.lng == detailLng {
                detailReq.id = (element.venue?.id)!
                detailReq.makeRequest { (model) in
                    self.detailModel = model
                    let placeName = self.detailModel?.response?.venue?.name
                    let regionDistance: CLLocationDistance = 1000;
                    let coordinates = CLLocationCoordinate2D(latitude: detailLat, longitude: detailLng)
                    let regionSpan = MKCoordinateRegion.init(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
                    let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
                    let placeMark = MKPlacemark(coordinate: coordinates)
                    let mapItem =  MKMapItem(placemark: placeMark)
                    mapItem.name = placeName
                    mapItem.openInMaps(launchOptions: options)
                }
                break
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        var detailReq = DetailRequest()
        let detailLat: Double = Double(annotationTapped?.coordinate.latitude ?? 0)
        let detailLng: Double = Double(annotationTapped?.coordinate.longitude ?? 0)
        for element in poiModel?.response?.groups?[0].items ?? [ItemsModel()] {
            if element.venue?.location?.lat == detailLat && element.venue?.location?.lng == detailLng {
                detailReq.id = (element.venue?.id)!
                detailReq.makeRequest { (model) in
                    self.detailModel = model
                    self.detailView.isHidden = false
                    self.detailCollectionView.reloadData()
                }
                break
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        annotationTapped = view.annotation
        let indexPath = IndexPath(item: 0, section: 0)
        detailCollectionView.scrollToItem(at: indexPath, at: .left, animated: false)
    }
}

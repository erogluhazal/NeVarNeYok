//
//  ViewController+SearchBar.swift
//  poi
//
//  Created by Teknasyon-S on 20.11.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import Foundation
import UIKit
import MapKit

extension ViewController: UISearchBarDelegate {
    
    @IBAction func searchButton(_ sender: Any) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.navigationItem.title = ""
        //Ignoring User
        UIApplication.shared.beginIgnoringInteractionEvents()
        //Activity Indicator
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        activityIndicator.center = self.view.center
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
        //Hide Search Bar
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        //Create the search request
        searchBar.delegate = self
        let searchText = searchBar.text
        let search = Helper.turkishCharacterConverting(word: searchText!)
        let annotations = mapKitView.annotations
        mapKitView.removeAnnotations(annotations)
        let searchRequest = VenueSearchRequest()
        let query = Singleton.shared.query
        let newQuery = Helper.turkishCharacterConverting(word: query)
        searchRequest.makeRequest(limit: "1", ll: search, query: newQuery) { (poiModel) in
            dump(poiModel)
            self.poiModel = poiModel
            
            if poiModel?.response?.headerLocation != nil {
                let newTitle = search.uppercased()
                self.navigationItem.title = newTitle
                let locationCoordinate = CLLocationCoordinate2DMake(poiModel?.response?.groups?[0].items?[0].venue?.location?.lat ?? 0, poiModel?.response?.groups?[0].items?[0].venue?.location?.lng ?? 0)
                let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                let region = MKCoordinateRegion(center: locationCoordinate, span: span)
                self.mapKitView.setRegion(region, animated: true)
                guard poiModel != nil else {
                    activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    return
                }
                let items = poiModel?.response?.groups?[0].items
                let annotations: [MKAnnotation] = self.createAnnotations(items: items!)
                self.mapKitView.addAnnotations(annotations)
                
                activityIndicator.stopAnimating()
                UIApplication.shared.endIgnoringInteractionEvents()
                self.detailView.isHidden = true
                //pin silme: self.mapKitView.removeAnnotations(annotations)
            } else {
                self.navigationItem.title = "This location is not found!"
                activityIndicator.stopAnimating()
                UIApplication.shared.endIgnoringInteractionEvents()
                let annotations = self.mapKitView.annotations
                self.mapKitView.removeAnnotations(annotations)
                let locationLL = self.createLLParamter()
                let searchRequest = VenueSearchRequest()
                searchRequest.makeRequest(limit: "10", ll: locationLL, query: "") { (poiModel) in
                    dump(poiModel)
                    self.setAnnotations(poiModel: poiModel)
                }
                self.detailView.isHidden = true
            }
        }
    }
}

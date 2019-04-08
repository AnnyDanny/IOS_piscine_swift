//
//  FirstViewController.swift
//  day05_2
//
//  Created by Ganna DANYLOVA on 4/3/19.
//  Copyright © 2019 Ganna DANYLOVA. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!

    var locationManager = CLLocationManager()
//    let locationManager = CLLocationManager(latitude: 21.282778, longitude: -157.829444)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
//        mapView.addAnnotation(places.place)
//        let initialLocation = CLLocationCoordinate2DMake(21.282778, -157.829444)
//        let regionRadius: CLLocationDistance = 1000
//        func centerMapOnLocation(location: CLLocation) {
//            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
//                                                                      regionRadius, regionRadius)
//            mapView.setRegion(coordinateRegion, animated: true)
//        }
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 10
        locationManager.startUpdatingLocation()
        displayPlacesTaj()
        displayPlacesNewYork()
        displayPlacesLostallo()
        displayPlacesThailand()
        displayPlacesJapan()
    }
    
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Location updated")
    }

}


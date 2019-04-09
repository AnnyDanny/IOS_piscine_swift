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

class FirstViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet weak var mapView: MKMapView!
   
    var locationManager = CLLocationManager()
    var autorizationStatus = CLLocationManager.authorizationStatus()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestAlwaysAuthorization()
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
        displayPlaces42School()
    }
       
    @IBAction func segmentControlAction(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        case 2:
            mapView.mapType = .hybrid
        default:
            break
        }
    }
    
    @IBAction func MyGeo(_ sender: UIButton) {
        if autorizationStatus == CLAuthorizationStatus.authorizedAlways || autorizationStatus == CLAuthorizationStatus.authorizedWhenInUse {
            let span = MKCoordinateSpan.init(latitudeDelta: 0.0075, longitudeDelta: 0.0075)
            let region = MKCoordinateRegion.init(center: (locationManager.location?.coordinate)!, span: span)
            mapView.setRegion(region, animated: true)
            self.mapView.showsUserLocation = true
        }
        else {
            if let url = URL(string : UIApplicationOpenSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")

}

}

//extension FirstViewController: MKMapViewDelegate {
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        guard let annotation = annotation as? pointOfPlaces
//            else {
//                return nil
//        }
//        let view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: annotation.headline)
//        view.canShowCallout = true
//        view.rightCalloutAccessoryView = UIButton(type: .custom)
//        return view
//    }
//}


//let ullpgr = UILongPressGestureRecognizer(target: self, action: #selector(FirstViewController.longpress(gestureRecognizer:)))
//ullpgr.minimumPressDuration = 2
//mapView.addGestureRecognizer(ullpgr)

//    @objc func longpress(gestureRecognizer: UIGestureRecognizer) {
//        let touchPoint = gestureRecognizer.location(in: self.mapView)
//        let coordinates = mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
//    }

//        mapView.delegate = self
//        mapView.addAnnotation(myPins.myPins)
//    let myPins = Pins()


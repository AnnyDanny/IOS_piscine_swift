//
//  pointOfPlaces.swift
//  day05_2
//
//  Created by Ganna DANYLOVA on 4/3/19.
//  Copyright © 2019 Ganna DANYLOVA. All rights reserved.
//

import MapKit
import MapKit
import CoreLocation

class pointOfPlaces : NSObject {
    var name: String
    var coordinate: CLLocationCoordinate2D
    
    init(name: String, coordinate: CLLocationCoordinate2D) {
        self.name = name
        self.coordinate = coordinate
        
        super.init()
    }
}

extension FirstViewController {
    func displayPlacesTaj(){
        //        let latitude: CLLocationDegrees = 27.176244
        //        let longtitude: CLLocationDegrees = 8.0399772
        let LanDelte: CLLocationDegrees = 0.06
        let LonDelte: CLLocationDegrees = 0.05
        let span = MKCoordinateSpanMake(LanDelte, LonDelte)
        let coord = CLLocationCoordinate2D(latitude: 27.156121890399483, longitude: 78.0509201799888)
        //        let coordinates = CLLocationCoordinate2DMake(latitude, longtitude)
        let region = MKCoordinateRegionMake(coord, span)
        let annotation = MKPointAnnotation()
        mapView.setRegion(region, animated: true)
        annotation.title = "Taj Mahal"
        annotation.subtitle = "One day i was there"
        annotation.coordinate = coord
        mapView.addAnnotation(annotation)
        //        let ullpgr = UILongPressGestureRecognizer(target: self, action: #selector(FirstViewController.longpress(gestureRecognizer:)))
        //        ullpgr.minimumPressDuration = 2
        //        mapView.addGestureRecognizer(ullpgr)
    }
    func displayPlacesNewYork(){
        let coord = CLLocationCoordinate2D(latitude: 40.65443693109634, longitude: -74.1987348798828)
        let LanDelte: CLLocationDegrees = 0.06
        let LonDelte: CLLocationDegrees = 0.05
        let span = MKCoordinateSpanMake(LanDelte, LonDelte)
        let region = MKCoordinateRegionMake(coord, span)
        let annotation = MKPointAnnotation()
        mapView.setRegion(region, animated: true)
        annotation.title = "NewYork"
        annotation.subtitle = "One day I will be there"
        annotation.coordinate = coord
        mapView.addAnnotation(annotation)
    }
    
    func displayPlacesLostallo(){
        let coord = CLLocationCoordinate2D(latitude: 46.3068351774133, longitude: 9.212832399398962)
        let LanDelte: CLLocationDegrees = 0.06
        let LonDelte: CLLocationDegrees = 0.05
        let span = MKCoordinateSpanMake(LanDelte, LonDelte)
        let region = MKCoordinateRegionMake(coord, span)
        let annotation = MKPointAnnotation()
        mapView.setRegion(region, animated: true)
        annotation.title = "Lostallo"
        annotation.subtitle = "This summer I will be there"
        annotation.coordinate = coord
        mapView.addAnnotation(annotation)
    }
    
    func displayPlacesThailand(){
        let coord = CLLocationCoordinate2D(latitude: 14.378446633858145, longitude: 100.64105505564896)
        let LanDelte: CLLocationDegrees = 0.06
        let LonDelte: CLLocationDegrees = 0.05
        let span = MKCoordinateSpanMake(LanDelte, LonDelte)
        let region = MKCoordinateRegionMake(coord, span)
        let annotation = MKPointAnnotation()
        mapView.setRegion(region, animated: true)
        annotation.title = "Thailand"
        annotation.subtitle = "Sometimes I will be there"
        annotation.coordinate = coord
        mapView.addAnnotation(annotation)
    }
    
    func displayPlacesJapan(){
        let coord = CLLocationCoordinate2D(latitude: 35.36713523497216, longitude: 139.65350622752396)
        let LanDelte: CLLocationDegrees = 0.06
        let LonDelte: CLLocationDegrees = 0.05
        let span = MKCoordinateSpanMake(LanDelte, LonDelte)
        let region = MKCoordinateRegionMake(coord, span)
        let annotation = MKPointAnnotation()
        mapView.setRegion(region, animated: true)
        annotation.title = "Japan"
        annotation.subtitle = "Sometimes I will be there"
        annotation.coordinate = coord
        mapView.addAnnotation(annotation)
    }
    
}

extension FloatingPoint {
    var minutes:  Self {
        return (self*3600)
            .truncatingRemainder(dividingBy: 3600)/60
    }
    var seconds:  Self {
        return (self*3600)
            .truncatingRemainder(dividingBy: 3600)
            .truncatingRemainder(dividingBy: 60)
    }
}
extension CLLocationCoordinate2D {
    var dms: (latitude: String, longitude: String) {
        return (String(format:"%d° %d' %.4f\" %@",
                       Int(abs(latitude)),
                       Int(abs(latitude.minutes)),
                       abs(latitude.seconds),
                       latitude >= 0 ? "N" : "S"),
                String(format:"%d° %d' %.4f\" %@",
                       Int(abs(longitude)),
                       Int(abs(longitude.minutes)),
                       abs(longitude.seconds),
                       longitude >= 0 ? "E" : "W"))
    }
}

//
//  pointOfPlaces.swift
//  day05_2
//
//  Created by Ganna DANYLOVA on 4/3/19.
//  Copyright © 2019 Ganna DANYLOVA. All rights reserved.
//

import MapKit

class pointOfPlaces : NSObject, MKAnnotation {
    let title: String?
    let PlaceName: String
    let coordinate: CLLocationCoordinate2D
    let headline : String
    
    init(title: String, PlaceName: String, coordinate: CLLocationCoordinate2D, headline: String) {
        self.title = title
        self.PlaceName = PlaceName
        self.coordinate = coordinate
        self.headline = headline
        
        super.init()
    }
    var subtitle: String? {
        return PlaceName
    }
}

extension FirstViewController {
    
    func displayPlacesTaj(){
        let LanDelte: CLLocationDegrees = 0.06
        let LonDelte: CLLocationDegrees = 0.05
        let span = MKCoordinateSpanMake(LanDelte, LonDelte)
        let coord = CLLocationCoordinate2D(latitude: 27.156121890399483, longitude: 78.0509201799888)
        let region = MKCoordinateRegionMake(coord, span)
        let annotation = MKPointAnnotation()
        mapView.setRegion(region, animated: true)
        annotation.title = "Taj Mahal"
        annotation.subtitle = "One day i was there"
        annotation.coordinate = coord
        mapView.addAnnotation(annotation)
    }
    
    func displayPlacesNewYork(){
        let coord = CLLocationCoordinate2D(latitude: 40.65443693109634, longitude: -74.1987348798828)
        let LanDelte: CLLocationDegrees = 0.06
        let LonDelte: CLLocationDegrees = 0.05
        let span = MKCoordinateSpanMake(LanDelte, LonDelte)
        let region = MKCoordinateRegionMake(coord, span)
        let annotation = MKPointAnnotation()
        mapView.setRegion(region, animated: true)
//        annotation.title = "NewYork"
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

    func displayPlaces42School(){
        let coord = CLLocationCoordinate2D(latitude: 48.896584, longitude: 2.318552)
        let LanDelte: CLLocationDegrees = 0.06
        let LonDelte: CLLocationDegrees = 0.05
        let span = MKCoordinateSpanMake(LanDelte, LonDelte)
        let region = MKCoordinateRegionMake(coord, span)
        let annotation = MKPointAnnotation()
        mapView.setRegion(region, animated: true)
        annotation.title = "42School"
        annotation.subtitle = "Sometimes I will be there"
        annotation.coordinate = coord
        mapView.addAnnotation(annotation)
    }

    @objc func longpress(gestureRecognizer: UIGestureRecognizer) {
        let touchPoint = gestureRecognizer.location(in: self.mapView)
        let coordinate = mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
//        annotation.title = "NewYork"
        annotation.subtitle = "One day I will be there"
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


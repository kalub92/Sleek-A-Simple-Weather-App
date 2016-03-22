//
//  CoreLocationController.swift
//  Sleek
//
//  Created by Caleb Stultz on 3/21/16.
//  Copyright © 2016 Caleb Stultz. All rights reserved.
//

import Foundation
import CoreLocation

class CoreLocationController: NSObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager = CLLocationManager()
    var nameOfCity: String!
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
    }
    
        func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let locValue:CLLocationCoordinate2D = manager.location!.coordinate
            print("locations = \(locValue.latitude) \(locValue.longitude)")
            
            let geocoder = CLGeocoder()
            let location = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
            
            geocoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
                
                // Place details
                var placeMark: CLPlacemark!
                placeMark = placemarks?[0]
                
                // City
                if let city = placeMark.addressDictionary!["City"] as? String {
                    self.nameOfCity = city.uppercaseString
                    print("City from GPS: \(self.nameOfCity)")
                }
            })
        self.locationManager.stopUpdatingLocation()
    }
    
        func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
            print("didChangeAuthorizationStatus")
            
            switch status {
            case .NotDetermined:
                print(".NotDetermined")
                break
                
            case .AuthorizedWhenInUse:
                print(".AuthorizedWhenInUse")
                self.locationManager.startUpdatingLocation()
                break
                
            case .Denied:
                print(".Denied")
                break
                
            default:
                print("Unhandled authorization status")
                break
                
            }
        }
    }
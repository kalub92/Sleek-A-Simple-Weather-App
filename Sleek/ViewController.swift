//
//  ViewController.swift
//  Sleek
//
//  Created by Caleb Stultz on 3/19/16.
//  Copyright © 2016 Caleb Stultz. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var dayOfTheWeek: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var timeOfDay: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    
    var weather = Weather()
    var location = CoreLocationController()
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationAuthStatus()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        weather.downloadWeatherDetails {
            self.updateUI()
        }
    }
    
    func updateUI() {
        cityName.text = weather.cityName
        dayOfTheWeek.text = weather.dayOfTheWeek
        date.text = weather.date
        timeOfDay.text = weather.timeOfDay
        currentTemp.text = "\(weather.currentTemp)"
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func locationAuthStatus() {
        
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            //Loads cityName from location
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
        
    }
    @IBAction func onReloadPressed(sender: AnyObject) {
        //code to reload
    }
}




//
//  ViewController.swift
//  Sleek
//
//  Created by Caleb Stultz on 3/19/16.
//  Copyright © 2016 Caleb Stultz. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var dayOfTheWeek: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var timeOfDay: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    
    var weather = Weather()
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weather.downloadWeatherDetails { () -> () in
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
    
    override func viewDidAppear(animated: Bool) {
        locationAuthStatus()
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

}


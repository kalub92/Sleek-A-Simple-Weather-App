//
//  Constants.swift
//  Sleek
//
//  Created by Caleb Stultz on 3/20/16.
//  Copyright © 2016 Caleb Stultz. All rights reserved.
//

import Foundation

    var weather = Weather()
    var locationController = CoreLocationController()
    
    let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?q="
    let APP_ID = "&appid="
    var LOCALE = "\(locationController.nameOfCity)"
    let API_KEY = "42a1771a0b787bf12e734ada0cfc80cb"

typealias DownloadComplete = () -> ()

typealias DownloadGPS = () -> ()
//
//  Weather.swift
//  Sleek
//
//  Created by Caleb Stultz on 3/20/16.
//  Copyright © 2016 Caleb Stultz. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class Weather {
    private var _cityName: String!
    private var _dayOfTheWeek: String!
    private var _date: String!
    private var _timeOfDay: String!
    private var _currentTemp: String!
    private var _weatherType: String!
    
    private var _weatherURL: String!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var dayOfTheWeek: String {
        if _dayOfTheWeek == nil {
            _dayOfTheWeek = ""
        }
            return _dayOfTheWeek
        }

    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
        }

    var timeOfDay: String {
        if _timeOfDay == nil {
            _timeOfDay = ""
        }
//            let date = NSDate()
//            let calendar = NSCalendar.currentCalendar()
//            let components = calendar.components([ .Hour, .Minute, .Second], fromDate: date)
//            let hour = components.hour
//            let minutes = components.minute
            
//            return "\(hour):\(minutes)"
            return _cityName
        }
    
    var currentTemp: String {
        if _currentTemp == nil {
            _currentTemp = ""
        }
            return _currentTemp
        }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
            return _weatherType
        }

    init() {
        
        _weatherURL = "\(BASE_URL)\(LOCALE)\(APP_ID)\(API_KEY)"
        
    }
    
    func downloadWeatherDetails(completed: DownloadComplete) {
        
        let url = NSURL(string: _weatherURL)!
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            
            print(result.value.debugDescription)
        
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let currentTemp = dict["main"] as? String {
                    self._currentTemp = currentTemp
                    
                }
                
                if let weatherType = dict["weather"] as? String {
                    self._weatherType = weatherType
                
                }
                
                if let cityName = dict["id"] as? String {
                    self._cityName = cityName
                }
            }
            completed()
        }
    }
}
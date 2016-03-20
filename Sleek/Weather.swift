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
    private var _currentTemp: Double!
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
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dayOfWeekString = dateFormatter.stringFromDate(NSDate())
        _dayOfTheWeek = "\(dayOfWeekString.uppercaseString)"
        print(_dayOfTheWeek)
        return _dayOfTheWeek
        }

    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .NoStyle
        let currentDate = dateFormatter.stringFromDate(NSDate())
        _date = "\(currentDate.uppercaseString)"
        print(_date)
        return _date
        }

    var timeOfDay: String {
        if _timeOfDay == nil {
            _timeOfDay = ""
        }
        
        let timeFormatter = NSDateFormatter()
        timeFormatter.timeStyle = .ShortStyle
        let currentTime = timeFormatter.stringFromDate(NSDate())
        _timeOfDay = "\(currentTime)"
        print(_date)

            return _timeOfDay
        }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
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
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    
                   if let currentTemp = main["temp"] as? Double {
                    let kelvinToFarenheitPreDiv = (currentTemp * (9/5) - 459.67)
                    let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDiv)/10)
                    self._currentTemp = kelvinToFarenheit
                    print(self._currentTemp)
                    }
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] where weather.count > 0 {
                    
                    if let weatherName = weather[0]["main"] as? String {
                        self._weatherType = weatherName
                        print("Weather Type: \(self._weatherType)")
                    }
                    
                }
                
                if let cityName = dict["name"] as? String {
                    self._cityName = cityName.uppercaseString
                    print("City Name: \(self._cityName)")
                }
            }
            completed()
        }
    }
}
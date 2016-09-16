//
//  Forcast.swift
//  weatherView
//
//  Created by Stuart Sumner - Smith  on 12/09/2016.
//  Copyright © 2016 Stuart Sumner - Smith . All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    var _date: String!
    var _weatherType:String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date:String{
        if _date == nil{
            _date = ""
            
        }
       return _date
    }
    var weatherType:String{
        if _weatherType == nil{
            _weatherType = ""
            
        }
    return _weatherType
    
    }
  
    var highTemp: String{
        if _highTemp == nil{
            _highTemp = ""
            
        }
    return _highTemp
    
    }
    
    var lowTemp: String{
        if _lowTemp == nil{
            _lowTemp = ""
            
        }
      return _lowTemp
    
    }
    init(weatherDict: Dictionary<String,AnyObject>){
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            if let min = temp["min"] as? Double {
                
              
                    let kelvinTofarenheitPreDivision = (min * (9/5) - 459.67)
                    let kelvinToFarenheit = Double(round( 10 * kelvinTofarenheitPreDivision/10))
                    
                    self._lowTemp = "\(kelvinToFarenheit)"
            }
       
            
                            if let max = temp ["max"] as? Double {
                    
                        let kelvinTofarenheitPreDivision = (max * (9/5) - 459.67)
                        let kelvinToFarenheit = Double(round( 10 * kelvinTofarenheitPreDivision/10))
                        
                        self._highTemp = "\(kelvinToFarenheit)"
                    
                    }
            
            
            
            
            
             }
        
        
        if let weather = weatherDict["weather"] as? [Dictionary<String,AnyObject>] {
            
            if let main = weather[0] ["main"] as? String {
                self ._weatherType = main
            }
        }
        if let  date = weatherDict ["dt"] as? Double {
            
             let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter ()
            dateFormatter.dateStyle = .medium
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
            
        }
        
    }
}


extension Date {
    func dayOfTheWeek () -> String {
     let dateFormatter = DateFormatter ()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from:self)
    }
}



















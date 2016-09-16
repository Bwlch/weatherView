//
//  constants.swift
//  weatherView
//
//  Created by Stuart Sumner - Smith  on 08/09/2016.
//  Copyright © 2016 Stuart Sumner - Smith . All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "6c00c25a4ea80df45641aa935228d9bf"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)35\(LONGITUDE)139\(APP_ID)\(API_KEY)"


let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast?lat=35&lon=139&appid=6c00c25a4ea80df45641aa935228d9bf"

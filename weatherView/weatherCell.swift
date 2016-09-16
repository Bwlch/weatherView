//
//  weatherCell.swift
//  weatherView
//
//  Created by Stuart Sumner - Smith  on 14/09/2016.
//  Copyright © 2016 Stuart Sumner - Smith . All rights reserved.
//

import UIKit

class weatherCell: UITableViewCell{

    @IBOutlet weak var weatherIcon: UIImageView!
   
    @IBOutlet weak var dayLbl: UILabel!
    
    @IBOutlet weak var WeatherType: UILabel!
    
    @IBOutlet weak var highTemp: UILabel!
    
    @IBOutlet weak var lowTemp: UILabel!
    
    func configureCell(forecast: Forecast) {
        lowTemp.text = "\(forecast.lowTemp)"
        highTemp.text = "\(forecast.highTemp)"
        WeatherType.text = forecast.weatherType
        weatherIcon.image = UIImage(named: forecast.weatherType)
        dayLbl.text = forecast.date
    }
    
}

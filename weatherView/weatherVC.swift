//
//  weatherVC.swift
//  weatherView
//
//  Created by Stuart Sumner - Smith  on 05/09/2016.
//  Copyright © 2016 Stuart Sumner - Smith . All rights reserved.
//

import UIKit
import Alamofire

class weatherVC: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var currentTempLbl: UILabel!
    
    @IBOutlet weak var locationLbl: UILabel!
    
    @IBOutlet weak var currentweatherImg: UIImageView!
    
   
    @IBOutlet weak var currentWeatherTypeLbl: UILabel!
  
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather = CurrentWeather()
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    tableView.delegate = self
    tableView.dataSource = self
        
        currentWeather = CurrentWeather()
      
    
        currentWeather.downloadWeatherDetails {
           self.downloadForecastData {
                self.updateMainUI()
            }
            
        }
    
    
    }
    
    func downloadForecastData(complete: DownloadComplete){
        // downloadforecastdata for table view
      let forecastURL = URL(string: FORECAST_URL)!
        Alamofire.request("\(forecastURL)", withMethod: .get).responseJSON() { response in
            
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let list = dict ["list"] as? [Dictionary<String, AnyObject>] {
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        print(obj)
                    }
                    self.forecasts.remove(at: 0)
                    self.tableView.reloadData()
                }
            }
            complete()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? weatherCell{
            
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        } else {
            return weatherCell()
        }
    }
    
    
    func updateMainUI(){
        dateLbl.text = currentWeather.date
        currentTempLbl.text = "\(currentWeather.currentTemp)"
        currentWeatherTypeLbl.text = currentWeather.weatherType
        locationLbl.text = currentWeather.cityName
        currentweatherImg.image = UIImage(named: currentWeather.weatherType)
    
    }
  
    }





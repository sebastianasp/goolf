//
//  ViewController.swift
//  GolfRoulette
//
//  Created by Sebastian Asp on 2018-07-17.
//  Copyright © 2018 Sebastian Asp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    

    @IBOutlet weak var showLocationName: UILabel!
    @IBOutlet weak var showWeatherIcon: UIImageView!
    @IBOutlet weak var showDegrees: UILabel!
    @IBOutlet weak var searchLocationBar: UISearchBar!

    var weather: WeatherGetter!
    
    
    func didGetWeather(weather: Weather) {
       showDegrees.text = "\(String(round(weather.tempCelsius)))°"
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weather = WeatherGetter()
        weather.getWeatherInfo(city: "Gothenburg")

        // Do any additional setup after loading the view, typically from a nib.
        showLocationName.isHidden = true
        showDegrees.isHidden = true
        showWeatherIcon.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    @IBAction func getGpsPressed(_ sender: Any) {
}
}

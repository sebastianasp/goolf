//
//  ViewController.swift
//  GolfRoulette
//
//  Created by Sebastian Asp on 2018-07-17.
//  Copyright © 2018 Sebastian Asp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherGetterDelegate,
UITextFieldDelegate {
    func didNotGetWeather(error: NSError) {
        print("error")
    }
    
    @IBOutlet weak var showLocationName: UILabel!
    @IBOutlet weak var showWeatherIcon: UIImageView!
    @IBOutlet weak var showDegrees: UILabel!
    @IBOutlet weak var searchLocationBar: UISearchBar!

    var weather: WeatherGetter!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize UI
        // -------------
    
        showDegrees.text = ""
        showLocationName.text = ""

        
        let weather = WeatherGetter()
        weather.getWeatherInfo(city: "Gothenburg")

        
        // Do any additional setup after loading the view, typically from a nib.
        showLocationName.isHidden = true
        showDegrees.isHidden = true
        showWeatherIcon.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
        }
        
        
        // MARK: -
        
        // MARK: WeatherGetterDelegate methods
        // -----------------------------------
        
        func didGetWeather(weather: Weather) {
            // This method is called asynchronously, which means it won't execute in the main queue.
            // ALl UI code needs to execute in the main queue, which is why we're wrapping the code
            // that updates all the labels in a dispatch_async() call.
            DispatchQueue.main.async() {
                self.showDegrees.text = "\(Int(round(weather.tempCelsius)))°"
        }
    }

    
    
    
    @IBAction func getGpsPressed(_ sender: Any) {
        showDegrees.isHidden = false
        showDegrees.text = String(Weather(weatherData: ["main" : "temp" as AnyObject]).tempCelsius)
        
        
    }
}

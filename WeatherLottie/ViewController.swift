//
//  ViewController.swift
//  WeatherLottie
//
//  Created by ido on 2021/01/17.
//

import UIKit
import Lottie
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    var weather = Weather()

    var lottieFileName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityLabel.sizeToFit()
        let city = "seoul"
        
        weather.delegate = self
        weather.fetchWeather(cityName: city)
    }

    func animationView(name: String) {
        let lottieFile = AnimationView(name: name)
        lottieFile.loopMode = .loop
        lottieFile.frame = self.view.frame
        lottieFile.center = self.view.center
        self.view.addSubview(lottieFile)
        lottieFile.play()
    }
}

extension ViewController: WeatherDelegate {
    func didUpdateWeather(_ weatherManager: Weather, weather: WeatherModel) {
       DispatchQueue.main.async {
            print(weather.cityName)
            self.cityLabel.text = weather.cityName
            self.tempLabel.text = weather.temparatureString
            self.weatherImage.image = UIImage(systemName: weather.weatherCondition)
        }
        if weather.weatherCondition == "snow" {
            animationView(name: "13351-snowfall")
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}

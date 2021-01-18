//
//  Weather.swift
//  WeatherLottie
//
//  Created by ido on 2021/01/17.
//

import Foundation
import Alamofire

struct Weather {
    
    var delegate: WeatherDelegate?
    
    let weatherURL = "Weather Api address"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        AF.request(urlString).responseJSON { (response) in
            switch response.result {
            case .success(let result) :
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
                    let decodedData = try JSONDecoder().decode(WeatherData.self, from: jsonData )
                    let id = decodedData.weather[0].id
                    let temp = decodedData.main.temp
                    let name = decodedData.name
                    print(id)
                    print(name)
                    print(temp)
                    let weathers = WeatherModel(conditionID: id, cityName: name, temparature: temp)
                    self.delegate?.didUpdateWeather(self, weather: weathers)
                } catch {
                    print("Error! \(error.localizedDescription)")
                }
            case .failure(let err) :
                delegate?.didFailWithError(error: err)
           }
        }
    }
    
}

protocol WeatherDelegate {
    func didUpdateWeather(_ weatherManager: Weather, weather: WeatherModel)
    func didFailWithError(error: Error)
}

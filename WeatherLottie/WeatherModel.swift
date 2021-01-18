//
//  WeatherModel.swift
//  WeatherLottie
//
//  Created by ido on 2021/01/18.
//

import Foundation
import Alamofire

struct WeatherModel {
    let conditionID: Int
    let cityName: String
    let temparature: Double
    var temparatureString: String {
        return String(format: "%.1f", temparature)
    }
    var weatherCondition: String {
        switch conditionID {
        case 200..<300 :
            return "cloud.bolt.fill"
        case 300..<400:
            return "cloud.drizzle.fill"
        case 500..<600:
            return "cloud.rain.fill"
        case 600..<700:
            return "snow"
        case 700..<800:
            return "cloud.fog.fill"
        case 800 :
            return "sun.max.fill"
        case 801..<900:
            return "smoke.fill"
        default:
            return "cloud"
        }
    }
}

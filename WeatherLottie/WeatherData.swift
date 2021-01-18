//
//  WeatherData.swift
//  WeatherLottie
//
//  Created by ido on 2021/01/18.
//

import Foundation
import Alamofire

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [WeatherId]
}

struct Main: Codable {
    let temp: Double
}

struct WeatherId: Codable {
    let id: Int

}

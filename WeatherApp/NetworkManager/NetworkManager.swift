//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Никита Пашко on 2/3/20.
//  Copyright © 2020 Никита Пашко. All rights reserved.
//

import Foundation

class NetworkManager {
    private init () {}
    static let shared : NetworkManager = NetworkManager()
    func getWeather (lat: String,lon : String, result : @escaping((Welcome?)-> ())) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.openweathermap.org"
        urlComponents.path = "/data/2.5/forecast"
        urlComponents.queryItems = [URLQueryItem(name: "lat", value : lat),
                                    URLQueryItem(name: "lon", value : lon),
                                    URLQueryItem(name : "appid",value : "b12141746b414c5c169a9d722e217e17")]
        var request = URLRequest(url:urlComponents.url!)
        request.httpMethod = "GET"

        let task = URLSession(configuration: .default)
        task.dataTask(with: request) { (data, response, error) in
            if error == nil {
                let decoder = JSONDecoder()
                var decoderDataModel : Welcome?
                if data != nil {
                    do {
                    decoderDataModel = try decoder.decode(Welcome.self, from: data!)
                    }
                    catch {
                        print(error)
                    }
                    
                }
                result(decoderDataModel)
            } else {
                print(error as Any)
            }
        }.resume()
        
    }
    
}

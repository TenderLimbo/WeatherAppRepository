//
//  DataModel.swift
//  WeatherApp
//
//  Created by Никита Пашко on 2/3/20.
//  Copyright © 2020 Никита Пашко. All rights reserved.
//

import Foundation

class DataModel : Codable {
    var cod: String?
    var message: Float?
    var cnt : Float
    var list: [ListModel]?
}

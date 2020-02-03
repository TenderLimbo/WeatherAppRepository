//
//  ViewController.swift
//  WeatherApp
//
//  Created by Никита Пашко on 2/3/20.
//  Copyright © 2020 Никита Пашко. All rights reserved.
//


import UIKit
import MapKit

class ViewController: UIViewController , CLLocationManagerDelegate{

    var latValue : String = ""
    var lonValue : String = ""
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            let locValue:CLLocationCoordinate2D = locationManager.location!.coordinate
            latValue = String(locValue.latitude)
            lonValue = String(locValue.longitude)
            print("locations = \(locValue.latitude) \(locValue.longitude)")
            locationManager.stopUpdatingLocation()
            NetworkManager.shared.getWeather(lat: latValue, lon: lonValue, result: { (model) in
                for list in (model?.list)! {
                    print(list.main.temp)
                }
            })
           
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}


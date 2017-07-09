//
//  GooglePlaces.swift
//  GetHerHome
//
//  Created by Savannah McCoy on 7/8/17.
//  Copyright © 2017 Savannah McCoy. All rights reserved.
//

import Foundation
import MapKit
import UIKit


class GooglePlaces: NSObject {
    
    // location: (37.790344037, -122.3921770)
    
    let host_path = "https://maps.googleapis.com/maps/api/place/textsearch/json?"
    let public_beta_key = "AIzaSyAUKkpLKQ8sHYwDWawMWWxPQb9ZGdFBHok"
    let location = "37.790344037,-122.3921770"  //CLLocation(latitude: -37.790344037, longitude: -122.3921770)
    let query = "women+shelter+location"
    
    func makeSearchRequest(success: @escaping (NSArray, NSArray) ->(), failure: @escaping (Error)->()){
        
        let url = URL(string: host_path+"query="+query+"&location="+location+"&key="+public_beta_key)
        let session = URLSession(
            configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main
        )
        let task = session.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print("Error: ", error!)
            } else {
                do {
                    
                    let response = try JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
                    //print(response)
                    
                    let returnedData = response["results"] as! NSArray
                    
                    let names = returnedData.value(forKey: "name") as! NSArray
                    
                    let addresses = returnedData.value(forKey: "formatted_address") as! NSArray
                    
                    print(names)
//                    let downSampledGifs = images.value(forKey: "fixed_width_downsampled") as! NSArray
//                    let gifUrls = downSampledGifs.value(forKey: "url") as! NSArray
                    
                    success(names, addresses)
                    
                } catch let error as NSError {
                    print(error)
                }
            }
            
        }
        task.resume()
    
    }
    
    
    
}

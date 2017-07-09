//
//  RideDetailsViewController.swift
//  GetHerHome
//
//  Created by Savannah McCoy on 7/8/17.
//  Copyright © 2017 Savannah McCoy. All rights reserved.
//

import UIKit
import LyftSDK
import CoreLocation

class RideDetailsViewController: UIViewController {

    @IBOutlet weak var rideInfoTextView: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
   var myEtas = [ETA]()
   // var delegate = MapViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let pickup = CLLocationCoordinate2D(latitude: 37.790344037, longitude: -122.3921770)
//        LyftAPI.ETAs(to: pickup) { result in
//            result.value?.forEach { eta in
//                self.myEtas.append(eta)
//                //print("ETA for \(eta.rideKind): \(eta.minutes) min")
//            }
//            
            self.rideInfoTextView.text = "ETA for \(myEtas[1].rideKind.rawValue): \(myEtas[1].minutes) min"
//        }
//        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

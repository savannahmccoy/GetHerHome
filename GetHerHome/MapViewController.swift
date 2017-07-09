//
//  MapViewController.swift
//  GetHerHome
//
//  Created by Savannah McCoy on 7/8/17.
//  Copyright © 2017 Savannah McCoy. All rights reserved.
//

import UIKit
import MapKit
import LyftSDK
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    //var delegate: MKMapViewDelegate?
    var myEtas = [ETA]()

    let regionRadius: CLLocationDistance = 1000
    let initialLocation = CLLocation(latitude: 37.790344037, longitude: -122.3921770)
    let annotation = MKPointAnnotation()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerMapOnLocation(location: initialLocation)
        
        let pickup = CLLocationCoordinate2D(latitude: 37.790344037, longitude: -122.3921770)
        LyftAPI.ETAs(to: pickup) { result in
            result.value?.forEach { eta in
                
                self.myEtas.append(eta)
                //print("ETA for \(eta.rideKind): \(eta.minutes) min")
            }
        }
            //self.rideInfoTextView.text = "ETA: \(self.myEtas[1])"
        
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
        let latitude = initialLocation.coordinate.latitude
        let longitude = initialLocation.coordinate.longitude
        
        
        let locationCoordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
        annotation.coordinate = locationCoordinate
        mapView.addAnnotation(annotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toRideDetails" {
            let rideVC = segue.destination as! RideDetailsViewController
            rideVC.myEtas = self.myEtas
        }
    }
 

}

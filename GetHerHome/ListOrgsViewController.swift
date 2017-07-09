//
//  ListOrgsViewController.swift
//  GetHerHome
//
//  Created by Savannah McCoy on 7/8/17.
//  Copyright © 2017 Savannah McCoy. All rights reserved.
//

import UIKit
import CoreLocation


class ListOrgsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var orgListTableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    var locationManager = CLLocationManager()
    var orgNames = [String]()
    var orgAdds = [String]()
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewdidload")
        // For use in background
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        orgListTableView.delegate = self
        orgListTableView.dataSource = self
        locationManager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            self.locationManager.requestWhenInUseAuthorization()
            
        }
        
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        // Do any additional setup after loading the view.
    }
    
    @objc(locationManager:didUpdateLocations:) func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orgNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orgcell", for: indexPath) as! OrgTableViewCell
        cell.nameLabel.text = orgNames[indexPath.row]
        cell.addressLabel.text = orgAdds[indexPath.row]
        cell.delegate = self
        return cell
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

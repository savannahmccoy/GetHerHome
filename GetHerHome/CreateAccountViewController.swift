//
//  CreateAccountViewController.swift
//  GetHerHome
//
//  Created by Savannah McCoy on 7/8/17.
//  Copyright © 2017 Savannah McCoy. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    
    var googlePlaces = GooglePlaces()
    var shelterList = [String]()
    var addressList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        googlePlaces.makeSearchRequest(success: { (list1: (NSArray), list2: (NSArray)) in
            
            
            self.shelterList = list1 as! [String]
            self.addressList = list2 as! [String]
            
    
        }
            , failure: { (error: Error) in
                print (error.localizedDescription)
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func didTapBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapOut(_ sender: Any) {
        view.endEditing(true)
    
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let listVC = segue.destination as! ListOrgsViewController
        listVC.orgNames = self.shelterList
        listVC.orgAdds = self.addressList
        
    }


}

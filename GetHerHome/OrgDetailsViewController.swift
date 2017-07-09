//
//  OrgDetailsViewController.swift
//  GetHerHome
//
//  Created by Savannah McCoy on 7/8/17.
//  Copyright © 2017 Savannah McCoy. All rights reserved.
//

import UIKit

class OrgDetailsViewController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var orgInfoLabel: UILabel!
    @IBOutlet weak var orgImageImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        orgImageImageView.image = UIImage(named: "Healing.png")        // Do any additional setup after loading the view.
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

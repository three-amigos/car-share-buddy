//
//  NewDriverViewController.swift
//  car-share-buddy
//
//  Created by Adnan on 01/08/2015.
//  Copyright © 2015 three-amigos. All rights reserved.
//

import UIKit

let repository = UserRepositoryFactory.getRepository()

class NewDriverViewController: UIViewController {
    
    @IBOutlet weak var customerCount: UILabel!
    

    @IBOutlet weak var flashMessage: UILabel!
    
    @IBOutlet weak var driverName: UITextField!
    
    
    @IBOutlet weak var carRegistration: UITextField!
    
    
    @IBAction func savePressed(sender: AnyObject) {
        
        var reg = carRegistration.text;
        
        if reg! == "" {
            reg = nil
        }
        
        let user = User(name: driverName.text!, carReg: reg)
        repository.add(user)
        carRegistration.text = ""
        driverName.text = ""
        
        customerCount.text = "Number of users: \(repository.getAll().count)"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

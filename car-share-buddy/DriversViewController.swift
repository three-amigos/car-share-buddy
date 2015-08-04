//
//  DriversViewController.swift
//  car-share-buddy
//
//  Created by Adnan on 01/08/2015.
//  Copyright © 2015 three-amigos. All rights reserved.
//

import UIKit

class DriversViewController: UITableViewController {

    let repository = UserRepositoryFactory.getRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repository.getAll().count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        let driver: User = repository.getAll()[indexPath.row]
        
        let altCarReg = "No Vehicle Registration"
        
        cell.textLabel?.text = "\(driver.name): \(driver.carReg ?? altCarReg)"
        
        return cell
    
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

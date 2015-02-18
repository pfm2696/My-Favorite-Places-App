//
//  TableViewController.swift
//  My Fav Places
//
//  Created by Peter & Liz  on 2/17/15.
//  Copyright (c) 2015 P&L Studios. All rights reserved.
//

import UIKit

var activePlace = 0

var places = [Dictionary<String,String>()]

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if places.count == 1 {
        
            places.removeAtIndex(0)
        
        }
        
        if places.count == 0 {
        
        places.append(["name":"Taj Mahal","lat":"27.175354","lon":"78.042123"])
        
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        self.navigationController?.navigationBarHidden = true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "addPlace" {
        
            activePlace = -1
        
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        activePlace = indexPath.row
        
        self.navigationController?.navigationBarHidden = true
        self.performSegueWithIdentifier("findPlace", sender: indexPath)
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return places.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel!.text = places[indexPath.row]["name"]

        return cell
    }

 
}

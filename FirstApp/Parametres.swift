//
//  Parametres.swift
//  FirstApp
//
//  Created by David Fournier on 02/10/16.
//  Copyright © 2016 David Fournier. All rights reserved.
//

import UIKit

class Parametres : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 2 : 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        cell.textLabel?.text = indexPath.section == 0 ? indexPath.row == 0 ? "Contact us" : "Visit our website" : "More information"
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Help"
        case 1: return "Informations"
        default: return ""
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
}

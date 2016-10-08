//
//  Parametres.swift
//  FirstApp
//
//  Created by David Fournier on 02/10/16.
//  Copyright © 2016 David Fournier. All rights reserved.
//

import UIKit
import MessageUI

class Parametres : UIViewController, UITableViewDelegate, UITableViewDataSource, UIViewControllerTransitioningDelegate{
    
    override func viewDidLoad() {
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(close))
        // Un swipe vers la gauche fait le même effet que l'appui sur la "croix" pour fermer
        swipeRecognizer.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeRecognizer)
    }

    // Quand on appuie sur le bouton "croix", on dismiss le controlleur
    @IBAction func close(_ sender : UIButton){
        dismissViewControllerAnimated(true, completion: {})
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 2 : 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Ici, toutes les options permettent d'ouvrir un mail. Dans un simulateur, aucun mail n'est paramétré souvent, donc affiche simplement un dialogue d'erreur
        let mailComposeViewController = MFMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        }
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

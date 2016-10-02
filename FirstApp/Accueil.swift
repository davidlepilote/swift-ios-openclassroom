//
//  Accueil.swift
//  FirstApp
//
//  Created by David Fournier on 02/10/16.
//  Copyright © 2016 David Fournier. All rights reserved.
//

import UIKit

class Accueil : UIViewController{
    
    override func viewDidAppear(animated: Bool) {
        navigationController?.navigationBar.tintColor = UIColor.redColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.blueColor()]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print(segue.identifier)
        if segue.identifier == "easy"{
            let exercice = segue.destinationViewController as! Exercice
            exercice.model = CalculExercice(difficulte: 1)
        }
        else if segue.identifier == "medium"{
            let exercice = segue.destinationViewController as! Exercice
            exercice.model = CalculExercice(difficulte: 2)
        }
    }
    
    @IBAction
    func clicSurMoyen(sender : UIButton){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let exercice = storyboard.instantiateViewControllerWithIdentifier("exercice") as! Exercice
        exercice.model = CalculExercice(difficulte: 2)
        navigationController?.showViewController(exercice, sender: self)
    }
    
}

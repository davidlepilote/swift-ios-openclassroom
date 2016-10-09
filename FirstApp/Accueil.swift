//
//  Accueil.swift
//  FirstApp
//
//  Created by David Fournier on 02/10/16.
//  Copyright © 2016 David Fournier. All rights reserved.
//

import UIKit

class Accueil : UIViewController, UIViewControllerTransitioningDelegate{
    
    @IBOutlet var titleView : UILabel!
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DrawerTransition()
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
    
    override func viewDidAppear(animated: Bool) {
        navigationController?.navigationBar.tintColor = UIColor.redColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.blueColor()]
        titleView.text = NSLocalizedString("TITLE", comment: "")
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
    func clicSurMoyen(_ sender : UIButton){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let exercice = storyboard.instantiateViewControllerWithIdentifier("exercice") as! Exercice
        exercice.model = CalculExercice(difficulte: 2)
        navigationController?.showViewController(exercice, sender: self)
    }
    
    // Le clic sur le burger menu ouvre un tiroir vers la gauche avec un menu
    // Pour ce faire on utilise une transition personnalisée implémentée dans la classe DrawerTransition
    @IBAction func clicSurMenu(_ sender : UIBarButtonItem){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menu = storyboard.instantiateViewControllerWithIdentifier("menu") as! Parametres
        menu.modalPresentationStyle = UIModalPresentationStyle.OverFullScreen
        menu.transitioningDelegate = self
        navigationController?.presentViewController(menu, animated: true, completion: {})
    }
    
}

//
//  ViewController.swift
//  FirstApp
//
//  Created by David Fournier on 01/10/16.
//  Copyright © 2016 David Fournier. All rights reserved.
//

import UIKit

class Exercice: UIViewController, UITextFieldDelegate {
    
    @IBOutlet
    var nbEntree : UITextField!
    
    @IBOutlet
    var fin : UIButton!
    
    @IBOutlet
    var slider : UISlider!
    
    @IBOutlet
    var stepper : UIStepper!
    
    @IBOutlet
    var titleLabel : UILabel!
    
    @IBOutlet
    var consigne : UILabel!
    
    var modeAuto = false
    
    var model : CalculExercice?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nbEntree.delegate = self
        slider.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(longClickSurSlider)))
        stepper.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(glisserDeposerStepper)))
        titleLabel.text = model?.titre
        consigne.text = "\(model!.consigne) = ?"
        let img = UIImage(named: "help")
        let barButtonItem = UIBarButtonItem(image: img, style : .Plain, target : self, action: #selector(clicHelp))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    override func viewDidAppear(animated: Bool) {
        navigationItem.backBarButtonItem?.title = "Retour"
    }
    
    func clicHelp(sender : UIBarButtonItem){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        if modeAuto{
           checkResultat()
        }
        return true
    }
    
    // Action reliée au Stepper qui met à jour les valeurs
    @IBAction
    func increment(stepper : UIStepper){
        updateValues(Int(stepper.value))
    }
    
    // Action reliée au Slider qui met à jour les valeurs
    @IBAction
    func slide(slider : UISlider){
        updateValues(Int(slider.value))
    }
    
    /* 
     Action reliée au TextField qui met à jour les valeurs
     Comme le TextField peut recevoir n'importe quel texte,
     on vérifie d'abord que celui-ci représente bien un nombre entier
    */
    @IBAction
    func texteModifie(field : UITextField){
        if let text = nbEntree.text where nbEntree.text != "" {
            if let number = Int(text) where Int(text) != nil{
                updateValues(number)
            }
        }
    }
    
    /* 
     Met à jour les valeurs du TextField, Stepper et Slider
     Si la valeur est inférieure à 0, alors la valeur affichée est 0
     Si la valeur est supérieure à 99, alors la valeur affichée est 99
    */
    private func updateValues(value : Int){
        var valBornee = value
        if(valBornee < 0){
            valBornee = 0
        }
        if(valBornee > 99){
            valBornee = 99
        }
        nbEntree.text = String(valBornee)
        slider.setValue(Float(valBornee), animated: true)
        stepper.value = Double(valBornee)
    }
    
    // Action reliée au bouton qui vérifie si le résultat entré est le bon
    @IBAction
    func clickButton(button : UIButton){
       checkResultat()
    }
    
    // Affiche une popup quand on fait un clic long sur le Slider
    func longClickSurSlider(sended : UILongPressGestureRecognizer){
        alert("Clic long", message: "coucou")
    }
    
    private func checkResultat(){
        //On vérifie que le texte entré par l'utilisateur n'est pas nil
        if let resultat = nbEntree.text where resultat != "" {
            //On regarde si le résultat est le bon
            if Int(resultat) == model?.reponse {
                alert("Bravo", message: "\(model?.consigne) = \(model?.reponse) !\nC'est une bonne réponse")
            } else {
                alert("Faux", message: "Ce n'est pas la bonne réponse, réessayez !")
            }
        } else {
            alert("Champ vide", message: "Veuillez entrer une valeur")
        }
    }
    
    // Plus utilisé
    @IBAction
    func toggleModeAuto(uiSwitch : UISwitch){
        modeAuto = uiSwitch.on
        fin.hidden = modeAuto
    }
    
    // Coordonnee d'origine du Stepper, mise à jour quand on commence le glisser-déposer
    var coordonneOrigine = CGPoint()
    
    /* Met à jour le stepper durant le glisser-déposer
     Au début de l'action : met à jour la coordonnée d'origine
     Au milieu de l'action : met à jour la position du stepper
     À la fin de l'action : lance l'animation de retour du stepper et met à jour les valeurs
     Les valeurs sont incrémentées si la dernière position du Stepper est plus à droite 
     que la position d'origine et décrémentées dans le cas contraire
    */
    func glisserDeposerStepper(sender : UIPanGestureRecognizer){
        switch sender.state {
        case UIGestureRecognizerState.Began:
            coordonneOrigine = sender.view!.center
        case UIGestureRecognizerState.Changed:
            let view = sender.view!
            let coordonne = sender.locationInView(self.view)
            view.center = coordonne
        case UIGestureRecognizerState.Ended:
            let view = sender.view!
            updateValues(Int(self.stepper.value) + (sender.view!.center.x > self.coordonneOrigine.x ? 1 : -1))
            UIView.animateWithDuration(0.5, animations: {
                view.center = self.coordonneOrigine
            })
        default: () // Do nothing
        }
    }
    
    //Ouvre une popup
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(ok)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    //Cache le clavier lorsque l'utilisateur touche l'écran
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }


}


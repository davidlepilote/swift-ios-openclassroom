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
    var stepValue = 0
    
    var modeAuto = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello World !")
        nbEntree.delegate = self
        slider.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(longClickSurSlider)))
        stepper.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(glisserDeposerStepper)))
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
    
    func glisserDeposerStepper(sender : UIPanGestureRecognizer){
        let view = sender.view!
        let coordonne = sender.locationInView(self.view)
        view.center = coordonne
    }
    
    @IBAction
    func increment(stepper : UIStepper){
        nbEntree.text = String(Int(stepper.value))
    }
    
    @IBAction
    func clickButton(button : UIButton){
       checkResultat()
    }
    
    @IBAction
    func slide(slider : UISlider){
        nbEntree.text = String(Int(slider.value))
    }
    
    func longClickSurSlider(sended : UILongPressGestureRecognizer){
        alert("Clic long", message: "coucou")
    }
    
    private func checkResultat(){
        //On vérifie que le texte entré par l'utilisateur n'est pas nil
        if let resultat = nbEntree.text where resultat != "" {
            //On regarde si le résultat est 8
            if Int(resultat) == 8 {
                alert("Bravo", message: "4 + 4 = 8\nC'est une bonne réponse")
            } else {
                alert("Faux", message: "Ce n'est pas la bonne réponse, réessayez ! \(Int(resultat))")
            }
        } else {
            alert("Champ vide", message: "Veuillez entrer une valeur")
        }
    }
    
    @IBAction
    func toggleModeAuto(uiSwitch : UISwitch){
        modeAuto = uiSwitch.on
        fin.hidden = modeAuto
    }
    
    @IBAction
    func texteModifie(field : UITextField){
        if let text = nbEntree.text where nbEntree.text != "" {
            if let number = Int(text) where Int(text) != nil{
                stepper.value = Double(number)
                slider.value = Float(number)
            }
        }
        /*if modeAuto{
            if let resultat = nbEntree.text where resultat != ""{
                if Int(resultat) == 8{
                    alert("Bravo", message: "4 + 4 = 8\nC'est une bonne réponse")
                }
            }
        }*/
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


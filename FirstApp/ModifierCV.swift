//
//  ModifierCV.swift
//  FirstApp
//
//  Created by David Fournier on 08/10/16.
//  Copyright © 2016 David Fournier. All rights reserved.
//

import UIKit

let adresseDuCV = "cv.txt"

class ModifierCV : UIViewController{
    
    @IBOutlet var textView : UITextView!
    
    @IBOutlet var enregistrer : UIButton!
    
    override func viewDidLoad() {
        textView.layer.masksToBounds = false
        textView.layer.shadowRadius = 3
        textView.layer.shadowOffset = CGSize(width: 0, height: 0)
        textView.layer.shadowOpacity = 0.6
    }
    
    @IBAction func enregistrer(_ sender : UIButton){
        // Retourne la liste des dossiers dans /Documents
        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        //On récupère le premier dossier, donc Documents
        let docsDir = dirPaths[0]
        // Retourne le manager de fichiers par défaut
        let filemgr = NSFileManager.defaultManager()
        
        let text = textView.text
        // Ajoute un slash
        let path = NSURL(string: docsDir)!.URLByAppendingPathComponent(adresseDuCV)!
        // Ajoute le fichier à l'emplacement
        filemgr.createFileAtPath(
            path.absoluteString!,
            contents: text.dataUsingEncoding(NSUTF8StringEncoding),
            attributes: nil)
        // Récupérer le fichier
        let file = NSData(contentsOfURL : path)
        // Ecrire directement un texte dans un fichier
        let pu = try! text.writeToFile(path.absoluteString!, atomically: true, encoding: NSUTF8StringEncoding)
    
    }
}

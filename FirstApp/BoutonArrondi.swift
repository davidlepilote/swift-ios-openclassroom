//
//  BoutonArrondi.swift
//  FirstApp
//
//  Created by David Fournier on 01/10/16.
//  Copyright © 2016 David Fournier. All rights reserved.
//

import Foundation

import UIKit

class BoutonArrondi : UIButton{
    
    required init?(coder aDecoder: NSCoder) {
        //Initialiseur de la classe parente
        super.init(coder: aDecoder)
        
        //Coins arrondis
        layer.cornerRadius = 5
        
        //Couleur de la bordure
        layer.borderColor = UIColor.redColor().CGColor
        
        //Epaisseur de la bordure
        layer.borderWidth = 2
        
        //Couleur du texte
        setTitleColor(UIColor.redColor(), forState: .Normal)
        
        //Padding a gauche et a droite
        contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
}

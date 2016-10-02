//
//  CalculExercice.swift
//  FirstApp
//
//  Created by David Fournier on 02/10/16.
//  Copyright © 2016 David Fournier. All rights reserved.
//

import Foundation

class CalculExercice{
    
    var consigne : String
    
    var titre : String
    
    var reponse : Int
    
    init(consigne : String, titre : String, reponse : Int){
        self.consigne = consigne
        self.titre = titre
        self.reponse = reponse
    }
    
    convenience init(difficulte : Int){
        switch difficulte{
        case 1: // Easy
            self.init(consigne: "4 + 4", titre : "Niveau facile", reponse : 8)
        case 2: // Medium
            self.init(consigne: "8 x 7", titre : "Niveau moyen", reponse : 56)
        default: // Should not happen
            self.init(consigne: "", titre : "", reponse : -1)
        }
    }
    
    deinit{
      // Should I do something here ??
    }
}
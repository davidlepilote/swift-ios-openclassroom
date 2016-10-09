//
//  VictoryView.swift
//  FirstApp
//
//  Created by David Fournier on 08/10/16.
//  Copyright © 2016 David Fournier. All rights reserved.
//

import UIKit

class VictoryView : UIView{
    
    init() {
        let largeur = UIScreen.mainScreen().bounds.width
        let hauteur = UIScreen.mainScreen().bounds.height
        
        super.init(frame: CGRect(x:0, y:0, width:largeur, height:hauteur))
        
        let path = CGPathCreateMutable()
        
        let tabPoints = [
            CGPoint(x: 0.3945 * largeur, y: 0.2588 * hauteur), //Point A
            CGPoint(x: 0.5028 * largeur, y: 0.3447 * hauteur), //Point B
            CGPoint(x: 0.5651 * largeur, y: 0.2435 * hauteur), //Point C
            CGPoint(x: 0.6220 * largeur, y: 0.3529 * hauteur), //Point D
            CGPoint(x: 0.7761 * largeur, y: 0.2494 * hauteur), //Point E
            CGPoint(x: 0.6660 * largeur, y: 0.4094 * hauteur), //Point F
            CGPoint(x: 0.9174 * largeur, y: 0.4565 * hauteur), //Point G
            CGPoint(x: 0.6477 * largeur, y: 0.4929 * hauteur), //Point H
            CGPoint(x: 0.7046 * largeur, y: 0.6224 * hauteur), //Point I
            CGPoint(x: 0.5394 * largeur, y: 0.5212 * hauteur), //Point J
            CGPoint(x: 0.4092 * largeur, y: 0.6647 * hauteur), //Point K
            CGPoint(x: 0.3615 * largeur, y: 0.5141 * hauteur), //Point L
            CGPoint(x: 0.1174 * largeur, y: 0.5424 * hauteur), //Point M
            CGPoint(x: 0.3229 * largeur, y: 0.4165 * hauteur), //Point N
            CGPoint(x: 0.0881 * largeur, y: 0.3212 * hauteur), //Point O
            CGPoint(x: 0.3927 * largeur, y: 0.3541 * hauteur), //Point P
            CGPoint(x: 0.3945 * largeur, y: 0.2588 * hauteur), //Point A
            CGPoint(x: 0.5028 * largeur, y: 0.3447 * hauteur)//Et on termine au point B
        ]
        
        CGPathMoveToPoint(path, nil, tabPoints[0].x, tabPoints[0].y)
        
        CGPathAddLines(path, nil, tabPoints, 18)
        
        let calque = CAShapeLayer()
        calque.path = path
        calque.position = CGPoint(x : 0.0, y: 0.0)
        calque.frame = CGRect(x: 0.0, y: 0.0, width: largeur, height: hauteur)
        calque.backgroundColor = UIColor.whiteColor().CGColor
        calque.fillColor = UIColor.whiteColor().CGColor
        calque.strokeColor = UIColor.redColor().CGColor
        calque.lineWidth = 3
        
        layer.addSublayer(calque)
        
        let label = UILabel()
        label.text = "Victoire !"
        label.textColor = UIColor.redColor()
        label.font = UIFont(name: "KaushanScript-Regular", size: 25)
        
        label.sizeToFit()

        label.frame.origin.y = 0.4112 * hauteur
        label.center.x = self.center.x

        self.addSubview(label)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        UIView.animateWithDuration(0.3, animations: {
            self.alpha = CGFloat(0)
            }, completion: { _ in
                self.removeFromSuperview()
                return
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

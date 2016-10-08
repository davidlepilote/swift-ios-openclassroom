//
//  DrawerTransition.swift
//  FirstApp
//
//  Classe de transition personnalisée qui afficher un ViewController cible dans un tiroir arrivant vers la gauche
//
//  Created by David Fournier on 08/10/16.
//  Copyright © 2016 David Fournier. All rights reserved.
//

import UIKit

class DrawerTransition : NSObject, UIViewControllerAnimatedTransitioning{
    
    let duration = 0.5
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView()
        let menu = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        container.addSubview(menu)
        container.bringSubviewToFront(menu)
        
        menu.center.x = -menu.frame.width / 2
        
        UIView.animateWithDuration(duration, animations: {
            

        })
        
        UIView.animateWithDuration(duration, animations: {
            menu.transform = CGAffineTransformIdentity
            //print(menuController.viewWithTag(42) == nil)
            menu.center = CGPoint(x: 0,
                y: menu.center.y)
            }
            , completion:  {(completed: Bool) in // On doit appeler completeTransition pour re avoir la main sur les controlleurs
                transitionContext.completeTransition(true)
            })
    }
    
}


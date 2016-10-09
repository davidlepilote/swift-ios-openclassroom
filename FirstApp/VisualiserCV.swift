//
//  VisualiserCV.swift
//  FirstApp
//
//  Created by David Fournier on 08/10/16.
//  Copyright © 2016 David Fournier. All rights reserved.
//

import UIKit

class VisualiserCV : UIViewController{
    
    @IBOutlet var webView : UIWebView!
    
    override func viewDidAppear(animated: Bool) {
        webView.scalesPageToFit = true
        // Retourne la liste des dossiers dans /Documents
        let docsDir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        // Ajoute un slash
        if let path = NSURL(string: docsDir)!.URLByAppendingPathComponent(adresseDuCV){
            if let data = NSData(contentsOfFile: path.absoluteString!){
                webView.loadData(data, MIMEType: "text/plain", textEncodingName: "UTF-8", baseURL: path)
            }
        }
    }
}

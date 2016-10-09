//
//  Navigateur.swift
//  FirstApp
//
//  Created by David Fournier on 08/10/16.
//  Copyright © 2016 David Fournier. All rights reserved.
//

import UIKit

class Navigateur : UIViewController, UISearchBarDelegate, UIWebViewDelegate{
    
    @IBOutlet var webView : UIWebView!
    
    override func viewDidLoad() {
        webView.loadRequest(NSURLRequest(URL: NSURL(string: "http://www.openclassrooms.com")!))
    
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        if let dom = webView.stringByEvaluatingJavaScriptFromString("document.documentElement.outerHTML"){
            let scan = NSScanner(string: dom)
            if scan.scanUpToString("<meta name=\"theme-color\" content=\"#", intoString: nil){
                scan.scanString("<meta name=\"theme-color\" content=\"#", intoString: nil)
                var themeColor : NSString?
                if scan.scanUpToString("\"", intoString: &themeColor) {
                    colorTopBar(themeColor! as String)
                }
            }
        }
    }
    
    func colorTopBar(themeColor : String){
        var themeInt : UInt32 = 0
        //On initialize un nouveau scanner et on attribute l'hexa scanné à themeInt
        NSScanner(string: themeColor).scanHexInt(&themeInt)
        //Composantes entre 0 et 255
        let rouge = CGFloat((themeInt & 0xFF0000) >> 16) / 255
        let vert = CGFloat((themeInt & 0x00FF00) >> 8) / 255.0
        let bleu = CGFloat(themeInt & 0x0000FF) / 255.0
        let color = UIColor(red: rouge, green: vert, blue: bleu, alpha: 1.0) //On anime le changement de couleurs
        UIView.animateWithDuration(0.3, animations: {
        //Changement de couleur
        self.navigationController?.navigationBar.barTintColor = color
        })
    }
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if let urlText = searchBar.text{
            if let url = NSURL(string: urlText){
                webView.loadRequest(NSURLRequest(URL: url))
            }
        }
    }
    
    @IBAction func arriere(_ sender : UIBarButtonItem) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func avant(_ sender : UIBarButtonItem) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
}

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
        webView.loadRequest(NSURLRequest(URL: NSURL(string: "http://monirapps.com")!))
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

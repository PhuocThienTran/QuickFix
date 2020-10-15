//
//  SettingsTableViewController.swift
//  QuickFix
//
//  Created by DTran on 1/9/20.
//  Copyright © 2020 Quick Inc. All rights reserved.
//

import UIKit
import WebKit

class FirstViewController: UIViewController, WKNavigationDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var ActInd: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
let url = URL(string: "https://sites.google.com/view/quick-apps/Privacy")
        let request = URLRequest(url: url!)

        webView.load(request)
        
        webView.addSubview(ActInd)
        ActInd.startAnimating()
        
        webView.navigationDelegate = self
        ActInd.hidesWhenStopped = true
    
    }
@IBAction func back(_ sender: Any) {
        
        if webView.canGoBack {
            webView.goBack()
            
        }
    }
    
@IBAction func forward(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
            
        }
    }
     @IBAction func HomeBtn(_ sender: Any) {
             let url = URL(string: "https://sites.google.com/view/quick-apps/Privacy")
             let request = URLRequest(url: url!)
            
            webView.load(request)
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        ActInd.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        ActInd.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
        ActInd.stopAnimating()
    }
    
}


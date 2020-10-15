//
//  WindowsWebViewController.swift
//  QuickFix
//
//  Created by DTran on 1/16/20.
//  Copyright © 2020 Quick Inc. All rights reserved.
//

import UIKit
import WebKit

class WindowsWebViewController: UIViewController, WKNavigationDelegate, UISearchBarDelegate {
    
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var ActInd: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
let url = URL(string: "https://support.microsoft.com/en-au")
        let request = URLRequest(url: url!)

        webView.load(request)
        
        webView.addSubview(ActInd)
        ActInd.startAnimating()
        
        webView.navigationDelegate = self
        ActInd.hidesWhenStopped = true
    
    }

@IBAction func Notice(_ sender: Any) {
    let Notice = UIAlertController(title: "Official Microsoft Support Help", message: "This is the official Microsoft Support online help. You can reach out to them if you require more assistance with your Windows or Microsoft products.", preferredStyle: .alert)
    Notice.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
    NSLog("The \"I Understand.\" alert occured.")
    }))
    self.present(Notice, animated: true, completion: nil)
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
              let url = URL(string: "https://support.microsoft.com/en-au")
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

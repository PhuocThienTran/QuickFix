//
//  AppleWebViewController.swift
//  QuickFix
//
//  Created by DTran on 1/16/20.
//  Copyright © 2020 Quick Inc. All rights reserved.
//

import UIKit
import WebKit

class AppleWebViewController: UIViewController, WKNavigationDelegate, UISearchBarDelegate {
    
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var ActInd: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
let url = URL(string: "https://support.apple.com/en-au")
        let request = URLRequest(url: url!)

        webView.load(request)
        
        webView.addSubview(ActInd)
        ActInd.startAnimating()
        
        webView.navigationDelegate = self
        ActInd.hidesWhenStopped = true
    
    }

@IBAction func Notice(_ sender: Any) {
    let Notice = UIAlertController(title: "Official Apple Help", message: "This is the official Apple online help. You can reach out to them if you require more or official assistance with your Apple's devices.", preferredStyle: .alert)
    Notice.addAction(UIAlertAction(title: NSLocalizedString("I Understand.", comment: "Default action"), style: .default, handler: { _ in
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
              let url = URL(string: "https://support.apple.com/en-au")
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

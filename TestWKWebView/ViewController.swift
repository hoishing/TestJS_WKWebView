//
//  ViewController.swift
//  TestWKWebView
//
//  Created by hoishing on 10/6/2017.
//  Copyright © 2017 FBM Development. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController, WKScriptMessageHandler {

    @IBOutlet var webV: WKWebView!
    
    @IBAction func showJSAlert(_ sender: Any) {
        let js = "hideText();"
        webV.evaluateJavaScript(js, completionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webV.configuration.userContentController.add(self, name: "jsHandler")
        let bundleURL = Bundle.main.resourceURL!.absoluteURL
        let html = bundleURL.appendingPathComponent("try.html")
        webV.loadFileURL(html, allowingReadAccessTo:bundleURL)
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "jsHandler" {
            print(message.body)
        }
    }
}

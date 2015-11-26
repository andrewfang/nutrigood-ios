//
//  WebViewController.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/25/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    var linkUrl:NSURL!
    @IBOutlet weak var webView:UIWebView!
    @IBOutlet weak var forwardButton:UIBarButtonItem!
    @IBOutlet weak var backButton:UIBarButtonItem!
    @IBOutlet weak var linkLabel:UILabel!

    // MARK: - Actions
    @IBAction func done() {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func goBack() {
        self.webView.goBack()
    }
    
    @IBAction func goForward() {
        self.webView.goForward()
    }
    
    @IBAction func refresh() {
        self.webView.reload()
    }
    
    private func configureNavButtons() {
        self.backButton.enabled = self.webView.canGoBack
        self.forwardButton.enabled = self.webView.canGoForward
    }
    
    // MARK: - View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.webView.loadRequest(NSURLRequest(URL: self.linkUrl))
        self.linkLabel.text = self.linkUrl.host
    }
    
    // MARK: Web
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        self.configureNavButtons()
        return true
    }
    
    @IBAction func share() {
        let shareVC = UIActivityViewController(activityItems: [self.linkUrl], applicationActivities: nil)
        self.presentViewController(shareVC, animated: true, completion: nil)
    }
    
    @IBAction func goNutrigood() {
        let app = UIApplication.sharedApplication()
        if let url = NSURL(string: "twitter://post?message=Check%20out%20this%20cool%20nutritional%20tip%20from%20%23Nutri-GOOD!%20\(self.linkUrl.absoluteString)") {
            if (app.canOpenURL(url)) {
                app.openURL(url)
            }
        }
    }

}

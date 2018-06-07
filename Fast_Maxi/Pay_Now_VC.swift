//
//  Pay_Now_VC.swift
//  Fast_Maxi
//
//  Created by Dipesh Saini on 14/04/18.
//  Copyright © 2018 Dipesh Saini. All rights reserved.
//

import UIKit
class Pay_Now_VC: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var webview:UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pay Now"

        webview.delegate = self
        let url = URL (string:"http://wavsydney.com.au/paynow.php")

        let request = URLRequest (url: url!)

        webview.loadRequest(request)
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

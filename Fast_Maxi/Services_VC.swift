//
//  Services_VC.swift
//  Fast_Maxi
//
//  Created by Dipesh Saini on 14/04/18.
//  Copyright © 2018 Dipesh Saini. All rights reserved.
//

import UIKit

class Services_VC: UIViewController {
    @IBOutlet weak var Call_Button:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Services"
        shadow(view: Call_Button)
    }

    func shadow(view:UIButton)
    {
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: -1, height: 1)
        view.layer.shadowRadius = 10

        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:-   Buttons
    @IBAction func Call_btn(_ sender:UIButton)
    {

        if let url = URL(string: "tel://\(+61481700500)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

}

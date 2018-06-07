


//
//  Offer_VC.swift
//  Fast_Maxi
//
//  Created by Dipesh Saini on 14/04/18.
//  Copyright © 2018 Dipesh Saini. All rights reserved.
//

import UIKit

class Offer_VC: UIViewController {

    @IBOutlet weak var Call_Button:UIButton!

    var Push_or_Pop_String:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Offers"
       shadow(view: Call_Button)
    }
    @IBAction func Coupon_Offer_Btn(_ sender:UIButton)
    {
        if sender.tag == 0 {
            UserDefaults.standard .setValue("APSY10", forKey: "Coupon")
        }
        if sender.tag == 1 {
            UserDefaults.standard .setValue("CSSY8", forKey: "Coupon")

        }
        if sender.tag == 2 {
            UserDefaults.standard .setValue("GTSY10", forKey: "Coupon")
        }

        if Push_or_Pop_String == nil
        {
            let main = self.storyboard?.instantiateViewController(withIdentifier:"Book_Now_VC")
            self.navigationController?.pushViewController(main!, animated: true)
        }
        else
        {
            self.navigationController?.popViewController(animated: true)
        }

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
    }
    //MARK:-   Buttons
    @IBAction func Call_btn(_ sender:UIButton)
    {

        if let url = URL(string: "tel://\(+61481700500)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

}

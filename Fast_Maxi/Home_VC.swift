//
//  Home_VC.swift
//  Fast_Maxi
//
//  Created by Dipesh Saini on 14/04/18.
//  Copyright © 2018 Dipesh Saini. All rights reserved.
//

import UIKit

class Home_VC: UIViewController {

    @IBOutlet weak var Call_Button:UIButton!
    @IBOutlet weak var Services_Button:UIButton!
    @IBOutlet weak var Book_Now_Button:UIButton!
    @IBOutlet weak var Offer_Button:UIButton!
    @IBOutlet weak var Contact_us_Button:UIButton!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.title = "Home"
    self.navigationController?.navigationBar.tintColor = UIColor.white
    self.navigationController?.navigationBar.barTintColor = UIColor (red: 53.0/255, green: 59.0/255, blue: 60.0/255, alpha: 1.0)

        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes


        shadow(view: Call_Button)
        shadow(view: Services_Button)
        shadow(view: Book_Now_Button)
        shadow(view: Offer_Button)
        shadow(view: Contact_us_Button)

        UserDefaults.standard .setValue(nil, forKey: "Coupon")


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func Push(identifier:String)
    {
        let main = self.storyboard?.instantiateViewController(withIdentifier: identifier)
        self.navigationController?.pushViewController(main!, animated: true)

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
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true,view:UIButton) {
        view.layer.masksToBounds = false
        view.layer.shadowColor = color.cgColor
        view.layer.shadowOpacity = opacity
        view.layer.shadowOffset = offSet
        view.layer.shadowRadius = radius

        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    //MARK:-   Buttons
    @IBAction func Call_btn(_ sender:UIButton)
    {

        if let url = URL(string: "tel://\(+61481700500)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    @IBAction func Services_btn(_ sender:UIButton)
    {
        Push(identifier: "Services_VC")
    }
    @IBAction func Book_Now_btn(_ sender:UIButton)
    {
        Push(identifier: "Book_Now_VC")
    }
    @IBAction func Offer_btn(_ sender:UIButton)
    {
        Push(identifier: "Offer_VC")
    }
    @IBAction func Contact_Us_btn(_ sender:UIButton)
    {
        Push(identifier: "ContactUs_VC")
    }
    @IBAction func Pay_Now_btn(_ sender:UIButton)
    {
        Push(identifier: "Pay_Now_VC")
    }
}

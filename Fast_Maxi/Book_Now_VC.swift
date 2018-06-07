

//
//  Book_Now_VC.swift
//  Fast_Maxi
//
//  Created by Dipesh Saini on 14/04/18.
//  Copyright © 2018 Dipesh Saini. All rights reserved.
//

import UIKit
import MessageUI
import Alamofire
import SVProgressHUD

class Book_Now_VC: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {


    var myPickerView : UIPickerView!

      @IBOutlet weak var Name_Txtfld:UITextField!
      @IBOutlet weak var Phone_Txtfld:UITextField!
      @IBOutlet weak var E_mail_Txtfld:UITextField!
      @IBOutlet weak var Date_Txtfld:UITextField!
      @IBOutlet weak var Time_Txtfld:UITextField!
      @IBOutlet weak var No_Of_Passengers_Txtfld:UITextField!
      @IBOutlet weak var Coupon_Txtfld:UITextField!
      @IBOutlet weak var Booking_details_Txtfld:UITextField!

    @IBOutlet weak var Country_Txtfld:UITextField!


    @IBOutlet weak var From_Txtfld:UITextField!
    @IBOutlet weak var To_Txtfld:UITextField!
    @IBOutlet weak var Other_Comments_Txtfld:UITextView!

    @IBOutlet weak var Yes_Image_View:UIImageView!
    @IBOutlet weak var No_Image_View:UIImageView!


    let countryDictionary = ["AF":"93", "AL":"355", "DZ":"213","AS":"1", "AD":"376", "AO":"244", "AI":"1","AG":"1","AR":"54","AM":"374","AW":"297","AU":"61","AT":"43","AZ":"994","BS":"1","BH":"973","BD":"880","BB":"1","BY":"375","BE":"32","BZ":"501","BJ":"229","BM":"1","BT":"975","BA":"387","BW":"267","BR":"55","IO":"246","BG":"359","BF":"226","BI":"257","KH":"855","CM":"237","CA":"1","CV":"238","KY":"345","CF":"236","TD":"235","CL":"56","CN":"86","CX":"61","CO":"57","KM":"269","CG":"242","CK":"682","CR":"506","HR":"385","CU":"53","CY":"537","CZ":"420","DK":"45","DJ":"253","DM":"1","DO":"1","EC":"593","EG":"20","SV":"503","GQ":"240","ER":"291","EE":"372","ET":"251","FO":"298","FJ":"679","FI":"358","FR":"33","GF":"594","PF":"689","GA":"241","GM":"220","GE":"995","DE":"49","GH":"233","GI":"350","GR":"30","GL":"299","GD":"1","GP":"590","GU":"1","GT":"502","GN":"224","GW":"245","GY":"595","HT":"509","HN":"504","HU":"36","IS":"354","IN":"91","ID":"62","IQ":"964","IE":"353","IL":"972","IT":"39","JM":"1","JP":"81","JO":"962","KZ":"77","KE":"254","KI":"686","KW":"965","KG":"996","LV":"371","LB":"961","LS":"266","LR":"231","LI":"423","LT":"370","LU":"352","MG":"261","MW":"265","MY":"60","MV":"960","ML":"223","MT":"356","MH":"692","MQ":"596","MR":"222","MU":"230","YT":"262","MX":"52","MC":"377","MN":"976","ME":"382","MS":"1","MA":"212","MM":"95","NA":"264","NR":"674","NP":"977","NL":"31","AN":"599","NC":"687","NZ":"64","NI":"505","NE":"227","NG":"234","NU":"683","NF":"672","MP":"1","NO":"47","OM":"968","PK":"92","PW":"680","PA":"507","PG":"675","PY":"595","PE":"51","PH":"63","PL":"48","PT":"351","PR":"1","QA":"974","RO":"40","RW":"250","WS":"685","SM":"378","SA":"966","SN":"221","RS":"381","SC":"248","SL":"232","SG":"65","SK":"421","SI":"386","SB":"677","ZA":"27","GS":"500","ES":"34","LK":"94","SD":"249","SR":"597","SZ":"268","SE":"46","CH":"41","TJ":"992","TH":"66","TG":"228","TK":"690","TO":"676","TT":"1","TN":"216","TR":"90","TM":"993","TC":"1","TV":"688","UG":"256","UA":"380","AE":"971","GB":"44","US":"1", "UY":"598","UZ":"998", "VU":"678", "WF":"681","YE":"967","ZM":"260","ZW":"263","BO":"591","BN":"673","CC":"61","CD":"243","CI":"225","FK":"500","GG":"44","VA":"379","HK":"852","IR":"98","IM":"44","JE":"44","KP":"850","KR":"82","LA":"856","LY":"218","MO":"853","MK":"389","FM":"691","MD":"373","MZ":"258","PS":"970","PN":"872","RE":"262","RU":"7","BL":"590","SH":"290","KN":"1","LC":"1","MF":"590","PM":"508","VC":"1","ST":"239","SO":"252","SJ":"47","SY":"963","TW":"886","TZ":"255","TL":"670","VE":"58","VN":"84","VG":"284","VI":"340","UK":"44"]


    var Retrun_trip_String:String!

var picker_country_name_Array = NSMutableArray()
    var picker_country_Code_Array = NSMutableArray()


    @IBOutlet weak var Submit_Button:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Book Now"

        Date_and_time_picker()
        shadow(view: Submit_Button)

        pickerview()

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(endEditing))
        self.view.addGestureRecognizer(tapGestureRecognizer)

       Retrun_trip_String = ""


     let dictKeyInc = countryDictionary.sorted(by: <)

       for item in dictKeyInc
       {
          picker_country_name_Array.add(item.value)

        }

        for item in dictKeyInc
        {
            picker_country_Code_Array.add(item.key)

        }



    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        Coupon_Txtfld.isUserInteractionEnabled = false
       let coupon =  UserDefaults.standard .value(forKey: "Coupon")
        if coupon != nil
        {
            Coupon_Txtfld.text = (coupon as? String)
        }

    }
    @objc func endEditing() {
        self.view.endEditing(true)
    }

    func progressHud()
    {

    }

    //MARK:- Textfield

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == Name_Txtfld
        {
            Name_Txtfld.resignFirstResponder()
            Phone_Txtfld.becomeFirstResponder()
        }
        if textField == Phone_Txtfld
        {
            Phone_Txtfld.resignFirstResponder()
            From_Txtfld.becomeFirstResponder()
        }
        if textField == From_Txtfld
        {
            From_Txtfld.resignFirstResponder()
            To_Txtfld.becomeFirstResponder()
        }
        if textField == To_Txtfld
        {
            To_Txtfld.resignFirstResponder()
            E_mail_Txtfld.becomeFirstResponder()
        }
        if textField == E_mail_Txtfld
        {
            E_mail_Txtfld.resignFirstResponder()
            Date_Txtfld.becomeFirstResponder()
        }
        if textField == No_Of_Passengers_Txtfld
        {
            No_Of_Passengers_Txtfld.resignFirstResponder()
        }
       
        return true
    }
    //MARK:- Textfield


    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if textField == Phone_Txtfld
        {
        let textstring = (textField.text! as NSString).replacingCharacters(in: range, with: string)

        let length = textstring.count
        if length > 13 {
            return false
        }
        }
        if textField == No_Of_Passengers_Txtfld
        {
        let textstring = (textField.text! as NSString).replacingCharacters(in: range, with: string)

        let length = textstring.count
        if length > 3
        {
         return false
        }
        }
        return true
    }
       //MARK:- Picker Vi ew
     func pickerview()
     {
        // UIPickerView
        self.myPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
        self.myPickerView.backgroundColor = UIColor.white
       Country_Txtfld.inputView = self.myPickerView

        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()

        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(Done_picker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        Country_Txtfld.inputAccessoryView = toolBar


     }

    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return picker_country_name_Array.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {

        return  "\( picker_country_Code_Array[row] as! String)" +
  "     +" + "\( picker_country_name_Array[row] as! String)"

    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        Country_Txtfld.text = " +" + "\( picker_country_name_Array[row] as! String)"
    }
    @objc func Done_picker()
    {

   self.view.endEditing(true)

    }

  //MARK:- Date picker
    func Date_and_time_picker()
    {
        let datePickerView:UIDatePicker = UIDatePicker()

        datePickerView.datePickerMode = UIDatePickerMode.date

         let todayDate = Date()

        datePickerView.minimumDate = todayDate

        let datePickerView2:UIDatePicker = UIDatePicker()

        datePickerView2.datePickerMode = UIDatePickerMode.time

        datePickerView.addTarget(self, action: #selector(datePickerValueChanged), for: UIControlEvents.valueChanged)
        datePickerView2.addTarget(self, action: #selector(timePickerValueChanged), for: UIControlEvents.valueChanged)


        Date_Txtfld.inputView = datePickerView
        Time_Txtfld.inputView = datePickerView2

        let toolBar = UIToolbar()

        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(Done))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)

        toolBar.setItems([ spaceButton, doneButton], animated: false)

        Date_Txtfld.inputAccessoryView = toolBar
        Time_Txtfld.inputAccessoryView = toolBar

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
    //MARK:-  Buttons

    @objc func datePickerValueChanged(sender:UIDatePicker) {

        let dateFormatter = DateFormatter()

         dateFormatter.dateFormat = "MMM-d-yyyy"
        Date_Txtfld.text = dateFormatter.string(from: sender.date)


    }
    @objc func Done()
    {
        let date = Date()

        if Date_Txtfld.endEditing(true)
        {
            if Date_Txtfld.text?.count == 0
            {
               let dateFormatter = DateFormatter()

                dateFormatter.dateFormat = "MMM-d-yyyy"
                Date_Txtfld.text = dateFormatter.string(from:date)
            }
        }
        else
        {
            if Time_Txtfld.text?.count == 0
            {
                 let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "HH:mm a"
                Time_Txtfld.text = dateFormatter.string(from: date)
            }
        }
        view.endEditing(true  )
    }
    @objc func timePickerValueChanged(sender:UIDatePicker) {

        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "HH:mm a"
        Time_Txtfld.text = dateFormatter.string(from: sender.date)

    }


    func alert(message:String,Button:String)
    {
        let alert = UIAlertController (title: "Alert!", message: message, preferredStyle: .alert)

        let ok  = UIAlertAction (title: Button, style: .default) { (alet) in

            self.dismiss(animated: true, completion: nil)
        }
        alert .addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
     @IBAction func Coupon_Offer_Btn(_ sender:UIButton)
     {
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Offer_VC") as! Offer_VC
        main.Push_or_Pop_String = "push"

        self.navigationController?.pushViewController(main, animated: true)
    }
    //MARK: -  BUTTONS
    @IBAction func Return_Trip_Btn(_ sender:UIButton)
    {
        if sender.tag == 1
        {
            Retrun_trip_String = "Yes"
            Yes_Image_View.image = #imageLiteral(resourceName: "check")
            No_Image_View.image = #imageLiteral(resourceName: "un check")
        }
        else
        {
            Retrun_trip_String = "No"
            Yes_Image_View.image = #imageLiteral(resourceName: "un check")
            No_Image_View.image = #imageLiteral(resourceName: "check")
        }
    }

    @IBAction func Submit_Btn(_ sender:UIButton)
    {

//|| (Phone_Txtfld.text?.count)! <= Int(12)

        let email = isValidEmail(testStr: E_mail_Txtfld.text!)

        if Name_Txtfld.text?.count == 0 {
            alert(message: "Please enter Name", Button: "Ok")
        }
        else if Phone_Txtfld.text?.count == 0  {
            alert(message: "Please enter 10 digit Phone Number", Button: "Ok")
        }
        else if E_mail_Txtfld.text?.count == 0 {
            alert(message: "Please enter E-mail", Button: "Ok")
        }
        else if !email
        {
            alert(message: "Please enter valid E-mail", Button: "Ok")
        }
        else if From_Txtfld.text?.count == 0 {
            alert(message: "Please enter From", Button: "Ok")
        }
        else if To_Txtfld.text?.count == 0 {
            alert(message: "Please enter To", Button: "Ok")
        }
        else if Date_Txtfld.text?.count == 0 {
            alert(message: "Please enter Date", Button: "Ok")
        }
        else if Time_Txtfld.text?.count == 0 {
            alert(message: "Please enter Time", Button: "Ok")
        }
        else if No_Of_Passengers_Txtfld.text?.count == 0 {
            alert(message: "Please enter No Of Passengers", Button: "Ok")
        }
        else if Coupon_Txtfld.text?.count == 0 {
            alert(message: "Please Select Offer", Button: "Ok")
        }
        else if Retrun_trip_String.count == 0 {
            alert(message: "Please select return trip", Button: "Ok")
        }
        else if Other_Comments_Txtfld.text?.count == 0 {
            alert(message: "Please enter Additional Information", Button: "Ok")
        }
        else
        {

            var phn = "\(Phone_Txtfld.text!)"

            phn =  String(phn.prefix(1))
            print("phn",phn)


            SVProgressHUD.show()

          UserDefaults.standard .setValue(nil, forKey: "Coupon")


            var send_String :String!

                send_String = "Name : \(Name_Txtfld.text!) \n Phone : \(Country_Txtfld.text!)\(Phone_Txtfld.text!) \n E-mail : \(E_mail_Txtfld.text!) \n From : \(From_Txtfld.text!)  \n To : \(To_Txtfld.text!) \n Date : \(Date_Txtfld.text!) \n Time : \(Time_Txtfld.text!) \n No Of Passengers : \(No_Of_Passengers_Txtfld.text!) \n Coupon : \(Coupon_Txtfld.text!) \n Retrun trip : \(Retrun_trip_String!) \n Additional Information : \(Other_Comments_Txtfld.text!)"



            let snd_html = "<!DOCTYPE html><html><body><h1>Booking Detail</h1><h3>Name : \(Name_Txtfld.text!)</h3><h3>Phone : \(Country_Txtfld.text!)\(Phone_Txtfld.text!)</h3><h3>E-mail : \(E_mail_Txtfld.text!)</h3><h3>From : \(From_Txtfld.text!)</h3><h3>To : \(To_Txtfld.text!)</h3><h3>Date : \(Date_Txtfld.text!)</h3><h3>Time : \(Time_Txtfld.text!)</h3><h3>No Of Passengers : \(No_Of_Passengers_Txtfld.text!)</h3><h3>Coupon : \(Coupon_Txtfld.text!)</h3><h3>Retrun trip : \(Retrun_trip_String!)</h3><h3>Additional Information : \(Other_Comments_Txtfld.text!)</h3></body></html>"

      send_String = "Booking Detail " + " \n" + send_String

            print("text string ====  ",send_String)


        Send_Message_Api(sms:send_String, email: snd_html, from: E_mail_Txtfld.text!,name:Name_Txtfld.text!)

        }
    }
    func Custom_alert(message:String)
    {
           let alert = UIAlertController (title: "", message:message, preferredStyle: .actionSheet)

        let Ok = UIAlertAction (title: "Ok", style: .default, handler: { (Action) in
            self.view.endEditing(true)
           })
        alert.addAction(Ok)
        self.present(alert, animated: true, completion: nil)

    }


    func Send_Message_Api(sms:Any,email:Any,from:String,name:String) {

        let parameters = ["sms":sms,"email":email,"from":from,"name":name]

        print("parameters",parameters)



        Alamofire.request("http://fastmaxi.com.au/twillio/sms.php", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in

                print("response",response)

                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                }

                let alert = UIAlertController (title: "", message:"Sent Successfully", preferredStyle: .alert)

                let Ok = UIAlertAction (title: "OK", style: .default, handler: { (Action) in
                    self.navigationController?.popToRootViewController(animated: true)
                })
                alert.addAction(Ok)
                self.present(alert, animated: true, completion: nil)

        }




    }
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }



}
/*

 //        let url = URL(string: "https://fastmaxi.com.au/twillio/sms.php")!
 //
 //
 //        var request = URLRequest(url:url)
 //        request.httpMethod = "POST"
 //        let data = try! JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions.prettyPrinted)
 //
 //        let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
 //        if let json = json {
 //            print(json)
 //        }
 //
 //        request.httpBody = json!.data(using: String.Encoding.utf8.rawValue);
 //    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
 //
 //        let task = URLSession.shared.dataTask(with: request, completionHandler: { (responseData: Data?, response: URLResponse?, error: Error?) in
 //
 //            print("resposne -====",response as Any)
 //
 //        })
 //        task.resume()



 //  let dic_prmtr = NSMutableDictionary()

 //            dic_prmtr.setValue("\(Name_Txtfld.text!)  " , forKey: "Name")
 //            dic_prmtr.setValue("\(Phone_Txtfld.text!)  ", forKey: "Phone")
 //            dic_prmtr.setValue("\(E_mail_Txtfld.text!)  ", forKey: "E-mail")
 //            dic_prmtr.setValue("\(From_Txtfld.text!)  ", forKey: "From")
 //            dic_prmtr.setValue("\(To_Txtfld.text!)  ", forKey: "To")
 //            dic_prmtr.setValue("\(Date_Txtfld.text!)  ", forKey: "Date")
 //            dic_prmtr.setValue("\(Time_Txtfld.text!)  ", forKey: "Time")
 //            dic_prmtr.setValue("\(No_Of_Passengers_Txtfld.text!)  ", forKey: "No.Of Passenger")
 //            dic_prmtr.setValue("\(Coupon_Txtfld.text!)  ", forKey: "Coupon/offer code")
 //            dic_prmtr.setValue("\(Other_Comments_Txtfld.text!)  ", forKey: "Other Comment")

 //            var parameter = [String:Any]()
 //
 //    parameter =        [
 //                "Name":"\(Name_Txtfld.text!)  ",
 //                "Phone":"\(Phone_Txtfld.text!)  ",
 //                "E-mail":"\(E_mail_Txtfld.text!)  ",
 //                "From":"\(From_Txtfld.text!)  ",
 //                "To":"\(To_Txtfld.text!)  ",
 //                "Date":"\(Date_Txtfld.text!)  ",
 //                "Time":"\(Time_Txtfld.text!)  ",
 //                "No.Of Passenger":"\(No_Of_Passengers_Txtfld.text!)  ",
 //                "Coupon/offer code":"\(Coupon_Txtfld.text!)  ",
 //                "Other Comment":"\(Other_Comments_Txtfld.text!)  ",
 //            ]


 // print("text string ====  ",parameter)


 //            var text_string:String!
 //            text_string = "\(parameter)"
 //
 //            text_string = text_string.replacingOccurrences(of: "Optional", with: "")
 //            text_string = text_string.replacingOccurrences(of: "[", with: "")
 //            text_string = text_string.replacingOccurrences(of: "]", with: "")
 //            text_string = text_string.replacingOccurrences(of: "(", with: "")
 //            text_string = text_string.replacingOccurrences(of: ")", with: "")
 //            text_string = text_string.replacingOccurrences(of: ";", with: "")
 //            text_string = text_string.replacingOccurrences(of: "\"", with: "")
 //            text_string = text_string.replacingOccurrences(of: "{", with: "")
 //            text_string = text_string.replacingOccurrences(of: "}", with: "")
 //
 //

 // send_String = "Name :" + Name_Txtfld.text! + "\n" + "Phone" + Phone_Txtfld.text! + "\n" + "E-mail" + E_mail_Txtfld.text  + "\n" + "From" + From_Txtfld.text

 //     text_string = "Booking Detail" + " \n" + text_string*/

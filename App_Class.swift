//
//  App_Class.swift
//  Garage_App
//
//  Created by Apple on 30/03/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
import UIKit
import CoreTelephony
import MBProgressHUD
import Alamofire
import LGSideMenuController


struct Api_Urls {
   static let Base_url = "http://ec2-13-126-132-104.ap-south-1.compute.amazonaws.com/dev/"
}


extension UIViewController
{
    func Get_Device_Detail()
    {
        let systemVersion = UIDevice.current.systemVersion
        print("systemVersion",systemVersion)
        let appversion: String = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        print("appversion",appversion as Any)
        let model = UIDevice.current.modelName
        print("device model=\(model)")
    
    }
    
     //MARK:-  Navigation bar
    @objc func Back_Btn()
    {
        navigationController?.popViewController(animated: true)
    }
    
    func NavigationBar_With_Back_Button(Viewcontroller:UIViewController)
    {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem (image: UIImage (named: "back_iPhone")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(Back_Btn))
        
        Viewcontroller.navigationController?.isNavigationBarHidden = false
        
        Viewcontroller.navigationController?.navigationBar.barTintColor = UIColor.App_Black_Background
        Viewcontroller.navigationController?.navigationBar.isTranslucent = false
         Viewcontroller.navigationController?.navigationBar.tintColor = UIColor.App_Black_Background
     
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor .App_Yellow_Background]
        Viewcontroller.navigationController?.navigationBar.titleTextAttributes = textAttributes
      
    }
    func NavigationBar_With_Done_Button(Viewcontroller:UIViewController)
    {
        
       
        Viewcontroller.navigationController?.isNavigationBarHidden = false
        
        let DoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action:#selector(doneButtonAction))
        DoneButton.title = "Done"
        DoneButton.tintColor = UIColor .white
        
      
        Viewcontroller.navigationController?.navigationItem.rightBarButtonItem = DoneButton
        
        
        Viewcontroller.navigationController?.navigationBar.barTintColor = UIColor (red: 26.0/255.0, green: 26.0/255.0, blue: 26.0/255.0, alpha: 1.0)
       
        Viewcontroller.navigationController?.navigationBar.isTranslucent = false
     
        
        
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        Viewcontroller.navigationController?.navigationBar.titleTextAttributes = textAttributes
        
    }
    
    func Log_Out_Btn()
    {
        UserDefaults .standard .setValue("Login", forKey: "Login_Type")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let parantviewcontroller = UINavigationController()
        
        let window = UIApplication.shared.delegate!.window!!
        let navigationController = storyboard.instantiateViewController(withIdentifier: "Login_VC") as! Login_VC
        parantviewcontroller.setViewControllers([navigationController], animated: true)
        
        
        window.rootViewController = parantviewcontroller
    }
    //MARK:-  Convert Timestamp To Date  
    func Convert_Timestamp_To_Date(timeStamp:String) ->String
    {
        let startdate1 = timeStamp
        let StartDouble = Double(startdate1)
        let startDate = NSDate(timeIntervalSince1970: StartDouble!)
        print(startDate)
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MMM d, yyyy hh:mm a"//"yyyy-MMM-dd hh:mm a"
        let dateString = dateFormater.string(from: startDate as Date)
        print(dateString)
        
        return dateString
        
        
    }
    
    //MARK:-  Progress hud loader  
    func Show_Loder()
    {
        let loader = MBProgressHUD.showAdded(to: self.view, animated: true)
        loader.mode = MBProgressHUDMode.indeterminate
        loader.label.text = "Loading..."
        loader.contentColor = UIColor.init(red: 26.0/255.0, green: 26.0/255.0, blue: 26.0/255.0, alpha: 1.0)
    }
    func Hide_Loader()
    {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    //MARK:-  Alert  
    func Alert(_Alert:UIViewController ,Title:String ,Message:String,Button:String)
    {
        let Alertcontroller = UIAlertController (title: Title, message: Message, preferredStyle: .alert)
        
        let Ok = UIAlertAction (title: Button, style:.default) { (action:UIAlertAction) in
            _Alert.view.endEditing(true)
        }
        Alertcontroller.addAction(Ok)
        _Alert.present(Alertcontroller, animated: true, completion: nil)
    }
    
    func Alert_with_Back_Button(_Alert:UIViewController ,Title:String ,Message:String,Button:String)
    {
        let Alertcontroller = UIAlertController (title: Title, message: Message, preferredStyle: .alert)
        
        let Ok = UIAlertAction (title: Button, style:.default) { (action:UIAlertAction) in
            
            _Alert.navigationController?.popViewController(animated:true)
        }
        Alertcontroller.addAction(Ok)
        _Alert.present(Alertcontroller, animated: true, completion: nil)
    }
    //MARK:-  Get Country Phone Code
    func Country_Phone_Code() -> String
    {
        
        let countryDictionary = ["AF":"93", "AL":"355", "DZ":"213","AS":"1", "AD":"376", "AO":"244", "AI":"1","AG":"1","AR":"54","AM":"374","AW":"297","AU":"61","AT":"43","AZ":"994","BS":"1","BH":"973","BD":"880","BB":"1","BY":"375","BE":"32","BZ":"501","BJ":"229","BM":"1","BT":"975","BA":"387","BW":"267","BR":"55","IO":"246","BG":"359","BF":"226","BI":"257","KH":"855","CM":"237","CA":"1","CV":"238","KY":"345","CF":"236","TD":"235","CL":"56","CN":"86","CX":"61","CO":"57","KM":"269","CG":"242","CK":"682","CR":"506","HR":"385","CU":"53","CY":"537","CZ":"420","DK":"45","DJ":"253","DM":"1","DO":"1","EC":"593","EG":"20","SV":"503","GQ":"240","ER":"291","EE":"372","ET":"251","FO":"298","FJ":"679","FI":"358","FR":"33","GF":"594","PF":"689","GA":"241","GM":"220","GE":"995","DE":"49","GH":"233","GI":"350","GR":"30","GL":"299","GD":"1","GP":"590","GU":"1","GT":"502","GN":"224","GW":"245","GY":"595","HT":"509","HN":"504","HU":"36","IS":"354","IN":"91","ID":"62","IQ":"964","IE":"353","IL":"972","IT":"39","JM":"1","JP":"81","JO":"962","KZ":"77","KE":"254","KI":"686","KW":"965","KG":"996","LV":"371","LB":"961","LS":"266","LR":"231","LI":"423","LT":"370","LU":"352","MG":"261","MW":"265","MY":"60","MV":"960","ML":"223","MT":"356","MH":"692","MQ":"596","MR":"222","MU":"230","YT":"262","MX":"52","MC":"377","MN":"976","ME":"382","MS":"1","MA":"212","MM":"95","NA":"264","NR":"674","NP":"977","NL":"31","AN":"599","NC":"687","NZ":"64","NI":"505","NE":"227","NG":"234","NU":"683","NF":"672","MP":"1","NO":"47","OM":"968","PK":"92","PW":"680","PA":"507","PG":"675","PY":"595","PE":"51","PH":"63","PL":"48","PT":"351","PR":"1","QA":"974","RO":"40","RW":"250","WS":"685","SM":"378","SA":"966","SN":"221","RS":"381","SC":"248","SL":"232","SG":"65","SK":"421","SI":"386","SB":"677","ZA":"27","GS":"500","ES":"34","LK":"94","SD":"249","SR":"597","SZ":"268","SE":"46","CH":"41","TJ":"992","TH":"66","TG":"228","TK":"690","TO":"676","TT":"1","TN":"216","TR":"90","TM":"993","TC":"1","TV":"688","UG":"256","UA":"380","AE":"971","GB":"44","US":"1", "UY":"598","UZ":"998", "VU":"678", "WF":"681","YE":"967","ZM":"260","ZW":"263","BO":"591","BN":"673","CC":"61","CD":"243","CI":"225","FK":"500","GG":"44","VA":"379","HK":"852","IR":"98","IM":"44","JE":"44","KP":"850","KR":"82","LA":"856","LY":"218","MO":"853","MK":"389","FM":"691","MD":"373","MZ":"258","PS":"970","PN":"872","RE":"262","RU":"7","BL":"590","SH":"290","KN":"1","LC":"1","MF":"590","PM":"508","VC":"1","ST":"239","SO":"252","SJ":"47","SY":"963","TW":"886","TZ":"255","TL":"670","VE":"58","VN":"84","VG":"284","VI":"340"]
        
        
        let networkInfo = CTTelephonyNetworkInfo()
        var C_Code : String!
         var Country_phone_code : String!
        
        if let carrier = networkInfo.subscriberCellularProvider
        {
            print("country code is: " + carrier.mobileCountryCode!);
            
            print("mobileNetworkCode code is: " + carrier.mobileNetworkCode!);
            
            //will return the actual country code
            print("ISO country code is: " + carrier.isoCountryCode!);
            
            C_Code = carrier.isoCountryCode!
            
            if countryDictionary[C_Code.uppercased()] != nil
            {
            Country_phone_code = countryDictionary[C_Code.uppercased()]
            }
            else
            {
                Country_phone_code = " "
            }
        }
        else
        {
            Country_phone_code = ""
        }
        
        
        
        
        return "+" + Country_phone_code!
     
    }
    
    
     //MARK:-   ShadowView
    func ShadowView_Without_Cornor_radius(ShadowView: UIView)
    {
        
       // ShadowView.backgroundColor = UIColor.white
        ShadowView.layer.masksToBounds = false
        ShadowView.layer.shadowColor = UIColor.black.cgColor
        ShadowView.layer.shadowOffset = CGSize(width: 0, height: 0);
        ShadowView.layer.shadowOpacity = 0.1
    }
    
    //MARK:-   Add image in textfield
    func Add_Image_In_Text_field(textfield:UITextField ,image_name:String)
    {
        let imageView = UIImageView()
        
        let image = UIImage(named: image_name)
        
        imageView.image = image
        imageView.frame = CGRect(x: 0, y: 0, width: 25, height: 15)
        imageView.contentMode = .scaleAspectFit
        textfield.rightViewMode = UITextFieldViewMode.always
        textfield.rightView = imageView
        textfield.addSubview(imageView)
    }
    func Add_Line_In_Text_field(textfield:UITextField)
    {
        let imageView = UIView()
        imageView.backgroundColor = UIColor.App_Text_Background
        imageView.frame = CGRect(x: 0, y: 0, width: 1, height: textfield.frame.size.height)
        imageView.contentMode = .scaleAspectFit
        textfield.rightViewMode = UITextFieldViewMode.always
        textfield.rightView = imageView
        textfield.addSubview(imageView)
    }
    @objc func doneButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }
    //MARK:-  Push_View controller  
    
    
    func Push_Customer_Method()
    {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let parantviewcontroller = UINavigationController()
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor .App_Yellow_Background]
        parantviewcontroller.navigationBar.titleTextAttributes = textAttributes
        
        parantviewcontroller.isNavigationBarHidden = false
        let navigationController = storyboard.instantiateViewController(withIdentifier: "Customer_Home") as! Customer_Home
        let leftview = storyboard.instantiateViewController(withIdentifier: "LeftViewController") as! LeftViewController
        let sidemenu = LGSideMenuController.init(rootViewController: navigationController, leftViewController: leftview, rightViewController: nil)
        let window = UIApplication.shared.delegate!.window!!
        parantviewcontroller.setViewControllers([sidemenu], animated: true)
        window.rootViewController = parantviewcontroller
    }
    func Push_Admin_Method()
    {
        
        let storyboard = UIStoryboard(name: "Admin", bundle: nil)
        
        let parantviewcontroller = UINavigationController()
        parantviewcontroller.isNavigationBarHidden = false
        let navigationController = storyboard.instantiateViewController(withIdentifier: "Admin_Order_List_VC") as! Admin_Order_List_VC
        let leftview = storyboard.instantiateViewController(withIdentifier: "LeftViewController") as! LeftViewController
        let sidemenu = LGSideMenuController.init(rootViewController: navigationController, leftViewController: leftview, rightViewController: nil)
        let window = UIApplication.shared.delegate!.window!!
        parantviewcontroller.setViewControllers([sidemenu], animated: true)
        window.rootViewController = parantviewcontroller
    }
    func Push_Garage_Method()
    {
        
        let storyboard = UIStoryboard(name: "Garage", bundle: nil)
        
        let parantviewcontroller = UINavigationController()
        parantviewcontroller.isNavigationBarHidden = false
        let navigationController = storyboard.instantiateViewController(withIdentifier: "Garage_Home_VC") as! Garage_Home_VC
        let leftview = storyboard.instantiateViewController(withIdentifier: "LeftViewController") as! LeftViewController
        let sidemenu = LGSideMenuController.init(rootViewController: navigationController, leftViewController: leftview, rightViewController: nil)
        let window = UIApplication.shared.delegate!.window!!
        parantviewcontroller.setViewControllers([sidemenu], animated: true)
        window.rootViewController = parantviewcontroller
    }
    func Push_Tow_Truck_Method()
    {
        
        let storyboard = UIStoryboard(name: "Tow_Truck", bundle: nil)
        
        let parantviewcontroller = UINavigationController()
        parantviewcontroller.isNavigationBarHidden = false
        let navigationController = storyboard.instantiateViewController(withIdentifier: "Tow_Truck_Partner") as! Tow_Truck_Partner
        let leftview = storyboard.instantiateViewController(withIdentifier: "LeftViewController") as! LeftViewController
        let sidemenu = LGSideMenuController.init(rootViewController: navigationController, leftViewController: leftview, rightViewController: nil)
        let window = UIApplication.shared.delegate!.window!!
        parantviewcontroller.setViewControllers([sidemenu], animated: true)
        window.rootViewController = parantviewcontroller
    }
    
    func Garage_Stroyboard_Push_View_Controller(Identifier:String)
    {
        let storyboard = UIStoryboard(name: "Garage", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: Identifier)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    func Customer_Push_View_Controller(Identifier:String)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: Identifier)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    func Tow_Truck_Push_View_Controller(Identifier:String)
    {
        let storyboard = UIStoryboard(name: "Tow_Truck", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: Identifier)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    func Admin_Push_View_Controller(Identifier:String)
    {
        let storyboard = UIStoryboard(name: "Admin", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: Identifier)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK:-  Prsent_View controller  
    
    func Garage_Stroyboard_Present_View_Controller(Identifier:String)
    {
        let storyboard = UIStoryboard(name: "Garage", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: Identifier)
        navigationController?.present(vc, animated: true, completion: nil)
    }
    
    
    func Customer_Present_View_Controller(Identifier:String)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: Identifier)
        
        navigationController?.present(vc, animated: true, completion: nil)
    }
    
    //MARK:-  Get Request  
    func GetRequest(_ UrlRequest:String ,success Success: @escaping (_ result : [String: AnyObject]) -> Void,failure Failure: @escaping (_ error: Error?) ->Void)
    {
        
    
        let url_string = Api_Urls.Base_url + UrlRequest
        
        print("url_string",url_string)
        
        let url = URL(string:url_string)!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
            
            }
            guard let data = data, error == nil
                
                else {                                                 // check for fundamental networking error
                    print("error=\(String(describing: error))")
                    self.Alert(_Alert: self, Title:"error", Message: (error?.localizedDescription)!, Button: "Ok")
                    return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode == 200 {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        print("json response ",json)
                     Success(json as [String : AnyObject])
                       
                    }
                    else
                    {
                        self.Alert(_Alert: self, Title:"error", Message: (error?.localizedDescription)!, Button: "Ok")
                    }
                } catch let error {
                    
                    self.Alert(_Alert: self, Title:"error", Message: error.localizedDescription, Button: "Ok")
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    func GetRequest_With_Header(_ UrlRequest:String ,success Success: @escaping (_ result : [String: AnyObject]) -> Void,failure Failure: @escaping (_ error: Error?) ->Void)
    {
       
        
        Show_Loder()
        
        let url_string = Api_Urls.Base_url + UrlRequest
        
         print("url_string",url_string)
        
        let url = URL(string:url_string)!
        var request = URLRequest(url: url)
        
 
        
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        request.setValue((UserDefaults.standard .value(forKey: "authKey") as! String), forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async
                {
                    self.Hide_Loader()
            }
            guard let data = data, error == nil
                
                else {                                                 // check for fundamental networking error
                    print("error=\(String(describing: error))")
                    self.Alert(_Alert: self, Title:"error", Message: (error?.localizedDescription)!, Button: "Ok")
                    return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode == 200 {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        print("json response ",json)
                        Success(json as [String : AnyObject])
                        
                    }
                    else
                    {
                        self.Alert(_Alert: self, Title:"error", Message: (error?.localizedDescription)!, Button: "Ok")
                    }
                } catch let error {
                    
                    self.Alert(_Alert: self, Title:"error", Message: error.localizedDescription, Button: "Ok")
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    //MARK:-  POST Request  
    
    func PostRequest(_ UrlRequest:String ,parameter Parameter:[String:AnyObject],success Success: @escaping (_ result : [String: AnyObject]) -> Void,failure Failure: @escaping (_ error: Error?) ->Void)
    {
        
        Show_Loder()
        let url_string = Api_Urls.Base_url + UrlRequest
        
      
        print("parameter",Parameter)
        
      Alamofire.request(url_string, method: .post, parameters: Parameter).validate().responseJSON
        { response in
            DispatchQueue.main.async
                {
                     self.Hide_Loader()
              }
                print("response == \(response)")
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as? [String: Any] {
                        print("json response ",json)
                        Success(json as [String : AnyObject])
                        
                    }
                    else
                    {
                        self.Alert(_Alert: self, Title:"error", Message: (response.error?.localizedDescription)!, Button: "Ok")
                    }
                } catch let error {
                    DispatchQueue.main.async {
                        self.Hide_Loader()
                    }
                    self.Alert(_Alert: self, Title:"error", Message: error.localizedDescription, Button: "Ok")
                    print(error.localizedDescription)
                }
        }
    }
    func PostRequest_With_header(_ UrlRequest:String ,parameter Parameter:[String:Any],success Success: @escaping (_ result : [String: AnyObject]) -> Void,failure Failure: @escaping (_ error: Error?) ->Void)
    {
      
        Show_Loder()
        let url_string = Api_Urls.Base_url + UrlRequest
        
        let headers: HTTPHeaders = [
            "Authorization": UserDefaults.standard .value(forKey: "authKey") as! String
        ]
        
         Alamofire.request(url_string, method: .post, parameters: Parameter,  headers: headers).validate().responseJSON
            { response in
                DispatchQueue.main.async
                    {
                        self.Hide_Loader()
                }
                print("response == \(response)")
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as? [String: Any] {
                        print("json response ",json)
                        Success(json as [String : AnyObject])
                        
                    }
                    else
                    {
                        self.Alert(_Alert: self, Title:"error", Message: (response.error?.localizedDescription)!, Button: "Ok")
                    }
                } catch let error {
                    DispatchQueue.main.async {
                        self.Hide_Loader()
                    }
                    self.Alert(_Alert: self, Title:"error", Message: error.localizedDescription, Button: "Ok")
                    print(error.localizedDescription)
                }
        }
    }
    func PostRequest_With_header_With_Mutable_Dictionary(_ UrlRequest:String ,parameter Parameter:NSMutableDictionary,success Success: @escaping (_ result : [String: AnyObject]) -> Void,failure Failure: @escaping (_ error: Error?) ->Void)
    {
        
        Show_Loder()
        let url_string = Api_Urls.Base_url + UrlRequest
        
        
        let url = URL(string:url_string)!
        var request = URLRequest(url: url)
        
        print(" url = = ",url)
        
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue((UserDefaults.standard .value(forKey: "authKey") as! String), forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        
        let data = try! JSONSerialization.data(withJSONObject: Parameter, options: JSONSerialization.WritingOptions.prettyPrinted)
        let Parms :String!
        
        Parms = (String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))! as NSString) as String!
        print(" Parms",Parms! as String)
        request.httpBody =   Parms.data(using: .utf8)
    
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                self.Hide_Loader()
            }
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                self.Alert(_Alert: self, Title:"error", Message: (error?.localizedDescription)!, Button: "Ok")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode == 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
                    {
                        print("json response ",json)
                        Success(json as [String : AnyObject])
                    }
                    else
                    {
                        self.Alert(_Alert: self, Title:"error", Message: (error?.localizedDescription)!, Button: "Ok")
                    }
                } catch let error {
                    
                    self.Alert(_Alert: self, Title:"error", Message: error.localizedDescription, Button: "Ok")
                    
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    //MARK:-  Delete Request
    func DeleteRequest_With_Header(_ UrlRequest:String ,success Success: @escaping (_ result : [String: AnyObject]) -> Void,failure Failure: @escaping (_ error: Error?) ->Void)
    {
        print("UrlRequest",UrlRequest)
        
      
        
        let url_string = Api_Urls.Base_url + UrlRequest
        
        let url = URL(string:url_string)!
        var request = URLRequest(url: url)
        
        
        
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        request.setValue((UserDefaults.standard .value(forKey: "authKey") as! String), forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "DELETE"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil
                
                else {                                                 // check for fundamental networking error
                    print("error=\(String(describing: error))")
                    self.Alert(_Alert: self, Title:"error", Message: (error?.localizedDescription)!, Button: "Ok")
                    return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode == 200 {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        print("json response ",json)
                        Success(json as [String : AnyObject])
                        
                    }
                    else
                    {
                        self.Alert(_Alert: self, Title:"error", Message: (error?.localizedDescription)!, Button: "Ok")
                    }
                } catch let error {
                    
                    self.Alert(_Alert: self, Title:"error", Message: error.localizedDescription, Button: "Ok")
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    func Random_Number()
     {}
}
//MARK:-  Textfield Placeholder color

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: newValue!])
        }
    }
}
//MARK:-  UIView cornerRadius

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
//MARK:-  App Color

extension UIColor
{
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    class var App_color_Background: UIColor {
         let bgcolor:UIColor!
        bgcolor = UIColor (red: 26.0/255.0, green: 26.0/255.0, blue: 26.0/255.0, alpha: 1.0)
        return bgcolor
    
    }
    class var App_Yellow_Background: UIColor {
        let bgcolor:UIColor!
        bgcolor = UIColor (red: 239.0/255.0, green: 186.0/255.0, blue: 88.0/255.0, alpha: 1.0)
        return bgcolor
        
    }
    class var App_Black_Background: UIColor {
        let bgcolor:UIColor!
        bgcolor = UIColor (red: 26.0/255.0, green: 26.0/255.0, blue: 26.0/255.0, alpha: 1.0)
        return bgcolor
        
    }
    class var App_Text_Background: UIColor {
        let bgcolor:UIColor!
        bgcolor = UIColor (red: 115.0/255.0, green: 115.0/255.0, blue: 115.0/255.0, alpha: 1.0)
        return bgcolor
        
    }
    
    
}
//MARK:-  Get Device Name
public extension UIDevice {
    
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":                return "iPhone X"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad6,11", "iPad6,12":                    return "iPad 5"
        case "iPad7,5", "iPad7,6":                      return "iPad 6"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7 Inch"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9 Inch"
        case "iPad7,1", "iPad7,2":                      return "iPad Pro 12.9 Inch 2. Generation"
        case "iPad7,3", "iPad7,4":                      return "iPad Pro 10.5 Inch"
        case "AppleTV5,3":                              return "Apple TV"
        case "AppleTV6,2":                              return "Apple TV 4K"
        case "AudioAccessory1,1":                       return "HomePod"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
    
}

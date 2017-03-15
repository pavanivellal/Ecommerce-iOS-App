//
//  Login.swift
//  ecommerce
//
//  Created by Pavani Vellal on 12/8/16.
//  Copyright © 2016 Pavani Vellal. All rights reserved.
//

import UIKit
import Alamofire

class Login: UIViewController {
    
    @IBOutlet weak var uname: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onLogin(_ sender: Any) {
    }
    
    @IBAction func onForgotPassword(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: "Sorry I cant help you", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func onSignup(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "showView")
        {
            let upcoming: MViewController = segue.destination as! MViewController
            
            Alamofire.request("http://ec2-35-163-74-129.us-west-2.compute.amazonaws.com/test.php").responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // HTTP URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                upcoming.itemResponse = response.result.value as! Array<Dictionary<String, String>>!
            }
            
        }
        
    }
}

//
//  NewViewController.swift
//  ecommerce
//
//  Created by Pavani Vellal on 12/8/16.
//  Copyright © 2016 Pavani Vellal. All rights reserved.
//

import UIKit
import Alamofire

class NewViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var review: UITextField!
    

    @IBOutlet weak var productLabel: UILabel!
    var titleStringViaSegue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.productLabel.text = self.titleStringViaSegue
        self.navigationItem.title = "Item"
        self.name.text = self.titleStringViaSegue
        self.price.text = String (arc4random_uniform(11))
        
    }
    
    @IBOutlet weak var onSubmitReview: UIButton!
    
    @IBAction func submitReview(_ sender: Any) {
        
        /*let APIkey: String = "34747ce9a4b8fd531c6818fe2b2b3155"
        let APIBaseUrl: String = "http://foris.mybluemix.net/HelloWorld?q=webapp_token_one"
        let urlString:String = "\(APIBaseUrl)";
        
        let url = NSURL(string: urlString)
        let request = NSMutableURLRequest(url: url! as URL);
        URLSession.shared.dataTask(with: request as URLRequest) { (data , response, error) -> Void in
            guard let data = data else {
                NSLog("Failure");
                return
            }
            
            DispatchQueue.main.asynchronously(execute: { () -> Void in
                self.showVideo(data);
            })
            }.resume()*/
            Alamofire.request("http://ec2-35-163-105-139.us-west-2.compute.amazonaws.com/test.php").responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
        
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
            self.review.text = "happy"
        }
        
        
        /*Alamofire.request("http://ec2-35-163-74-129.us-west-2.compute.amazonaws.com/test.php").responseString { response in
            print("Success: \(response.result.isSuccess)")
            print("Response String: \(response.result.value)")
        }*/
        
        
    }
    @IBAction func onAddToCart(_ sender: Any) {
    }
    @IBAction func onContinueShopping(_ sender: Any) {
    }
    
    @IBAction func onPinch(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "CustomerSupport") as UIViewController
        self.present(vc, animated: true, completion: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "showView")
        {
            let upcoming: TableController = segue.destination as! TableController
            
            let titleString = self.name.text
            
            upcoming.selectedItem = titleString!
            
        }
        
    }
    
    
    
    
}

//
//  MViewController.swift
//  ecommerce
//
//  Created by Pavani Vellal on 12/8/16.
//  Copyright © 2016 Pavani Vellal. All rights reserved.
//

import UIKit
import Alamofire


class MViewController: UIViewController {
    
        var itemResponse: Array<Dictionary<String,String>>!
    

    @IBOutlet weak var tableView: UITableView!
    var objects = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            Alamofire.request("http://ec2-52-25-22-20.us-west-2.compute.amazonaws.com/test.php").responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
            
            if let jsonResult = response.result.value as? Array<Dictionary<String,String>> {

                for item in jsonResult {
                    self.objects.append(item["ITEM"]!)
                }
            }

             self.tableView.reloadData()
            
            
        }
        
        self.objects.append("cereals")
        self.objects.append("domestic eggs")
        self.objects.append("bathroom cleaner")
        self.objects.append("candy")
        self.objects.append("margarine")
        self.objects.append("tropical fruit")
        self.objects.append("yogurt")
        self.objects.append("whole milk")
        self.objects.append("sugar")
        self.objects.append("ham")
        self.objects.append("frozen vegetables")
        self.objects.append("bottled beer")
        self.objects.append("soda")
        self.objects.append("fruit")
        self.objects.append("brown bread")
        self.objects.append("sausage")
    }
    
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
    {
        let aCell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        aCell.titleLabel.text = self.objects[indexPath.row]
        
        let chevron = UIImage(named: "chevron.png")
        aCell.accessoryType = .disclosureIndicator
        aCell.accessoryView = UIImageView(image: chevron!)
        return aCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: "showView", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "showView")
        {
            let upcoming: NewViewController = segue.destination as! NewViewController
        
            let indexPath = self.tableView.indexPathForSelectedRow!
            
            let titleString = self.objects[indexPath.row]
            
            upcoming.titleStringViaSegue = titleString
            
            self.tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}


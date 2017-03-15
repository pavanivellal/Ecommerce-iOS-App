//
//  CustomerSupportController.swift
//  gestureRecognizers
//
//  Created by Pavani Vellal on 12/8/16.
//  Copyright © 2016 Pavani Vellal. All rights reserved.
//

import UIKit

class CustomerSupportController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var rightSwipe = UISwipeGestureRecognizer(target: self,action: Selector("handleSwipe:"))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func callSupport(_ sender: Any) {
        var url:NSURL = NSURL(string: "tel://1234567890")!
        UIApplication.shared.openURL(url as URL)
    }
    
    
    func handleSwipe(sender:UISwipeGestureRecognizer)
    {
        
        if(sender.direction == .right)
        {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "MainView") as UIViewController
            self.present(vc, animated: true, completion: nil)
        }
        
    }
    
    
}

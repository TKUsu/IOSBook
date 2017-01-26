//
//  ViewController.swift
//  IOS01
//
//  Created by 蘇怡璇 on 2016/3/12.
//  Copyright © 2016年 Su Justin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        /** Dispose of any resources that can be recreated.
         *  針對任何可以重建的資源做處理    */
        
    }
    @IBAction func showmessage(){
        let alertController = UIAlertController(title: "Welcome", message: "Hello World", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){
            Void -> Void in
            print("Enter OK\n")
        })
        presentViewController(alertController,animated:true,completion:nil)
    }

}

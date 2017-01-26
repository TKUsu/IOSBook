//
//  UserViewController.swift
//  IOSTutorialSocketChat
//
//  Created by sujustin on 2016/11/23.
//  Copyright © 2016年 sujustin. All rights reserved.
//

import UIKit

class UserViewController: UIViewController{
    func askForNickname() {
        let alertController = UIAlertController(title: "SocketChat", message: "Please enter a nickname:", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addTextFieldWithConfigurationHandler(nil)
        
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action) -> Void in
            
        }
        
        alertController.addAction(OKAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
}

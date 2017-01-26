//
//  ViewController.swift
//  IOSTutorialSocketChat
//
//  Created by sujustin on 2016/10/25.
//  Copyright © 2016年 sujustin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var nickname: String?
    var users = [["nickname": "a","isConnected": false]];
    var tblUserList: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if nibName == nil {
            askForNickname()
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAt indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCellUser", for: indexPath as IndexPath)
        tblUserList = tableView
        cell.textLabel?.text = users[indexPath.row]["nickname"] as? String
        cell.detailTextLabel?.text = (users[indexPath.row]["isConnected"] as! Bool) ? "Online" : "Offline"
        cell.detailTextLabel?.textColor = (users[indexPath.row]["isConnected"] as! Bool) ? UIColor.green : UIColor.red
        
        return cell
    }

    func askForNickname() {
        let alertController = UIAlertController(title: "SocketChat", message: "Please enter a nickname:", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addTextField(configurationHandler: nil)
        
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action) -> Void in
            let textfield = alertController.textFields![0]
            if textfield.text?.characters.count == 0 {
                self.askForNickname()
            }
            else {
                self.nickname = textfield.text!
                
                SocketIOManager.shared.connectToServerWithNickname(nickname: self.nickname!, completionHandler: { (userList) -> Void in
                    DispatchQueue.main.async(execute: { () -> Void in
                        if userList != nil {
                            self.users = userList!
                            self.tblUserList!.reloadData()
                            self.tblUserList!.isHidden = false
                        }
                    })
                })
            }
        }
        
        alertController.addAction(OKAction)
        present(alertController, animated: true, completion: nil)
    }
}


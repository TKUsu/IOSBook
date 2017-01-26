//
//  ViewController.swift
//  IOS02_SimpleTable
//
//  Created by sujustin on 2016/9/6.
//  Copyright © 2016年 sujustin. All rights reserved.
//

import UIKit

class ViewController: UIViewController
        ,UITableViewDataSource,UITableViewDelegate{

    var restaurantName = ["cafe Deadend","Homei","Teakha","cafe Deadend","Homei","Teakha","cafe Deadend1","Homei1","Teakha1","cafe Deadend1","Homei","Teakha","cafe Deadend","Homei","Teakha","cafe Deadend","Homei","Teakha","cafe Deadend","Homei","Teakha","cafe Deadend","Homei","Teakha"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return table total row
        return restaurantName.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
            cell.textLabel?.text = restaurantName[indexPath.row]
        return cell
    }
}


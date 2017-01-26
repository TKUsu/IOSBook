//
//  RestaurantDetailViewController.swift
//  IOS03_UITableViewController
//
//  Created by 蘇怡璇 on 2016/4/12.
//  Copyright © 2016年 Su Justin. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController
        ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet var imageView:UIImageView!
    @IBOutlet weak var tableView: UITableView!

    var restaurant:Restaurant!
    
    override var prefersStatusBarHidden : Bool {
        //隱藏狀態列
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = restaurant.image
        //設定多餘的線條為空白
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        //設定底線顏色
        tableView.separatorColor = UIColor.blue
        //清空返回按鈕標題
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        title = restaurant.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RestaurantDetailTableCell
        switch (indexPath as NSIndexPath).row {
            case 0:
                cell.fieldtext.text = "Name:"
                cell.lableText.text = restaurant.name
            case 1:
                cell.fieldtext.text = "Type:"
                cell.lableText.text = restaurant.type
            case 2:
                cell.fieldtext.text = "Location:"
                cell.lableText.text = restaurant.location
            case 3:
                cell.fieldtext.text = "Be here:"
                cell.lableText.text = (restaurant.isVisited) ? "Yes, i've been here before" : "No"
        default:
            cell.fieldtext.text = ""
            cell.lableText.text = ""
        }
        
        return cell
    }
}

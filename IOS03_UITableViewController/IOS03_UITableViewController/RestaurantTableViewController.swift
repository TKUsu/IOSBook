//
//  RestaurantTableViewController.swift
//  IOS03_UITableViewController
//
//  Created by 蘇怡璇 on 2016/3/24.
//  Copyright © 2016年 Su Justin. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    struct ID{
        static var showDetail: String{
            return "showDetail"
        }
    }
    
    var restaurant = [Restaurant]()
    var restaurantName = ["cafe Deadend","Homei","Teakha","cafe Deadend","Homei","Teakha","cafe Deadend1","Homei1","Teakha1","cafe Deadend1","Homei","Teakha","cafe Deadend","Homei","Teakha","cafe Deadend","Homei","Teakha","cafe Deadend","Homei","Teakha","cafe Deadend","Homei","Teakha"]
    var restaurantImage = [#imageLiteral(resourceName: "royaloak"),#imageLiteral(resourceName: "teakha"),#imageLiteral(resourceName: "cafedeadend"),#imageLiteral(resourceName: "forkeerestaurant"),#imageLiteral(resourceName: "barrafina"),#imageLiteral(resourceName: "petiteoyster"),#imageLiteral(resourceName: "bourkestreetbakery"),#imageLiteral(resourceName: "donostia"),#imageLiteral(resourceName: "confessional"),#imageLiteral(resourceName: "fiveleaves"),#imageLiteral(resourceName: "traif"),#imageLiteral(resourceName: "haighschocolate"),#imageLiteral(resourceName: "palominoespresso"),#imageLiteral(resourceName: "posatelier"),#imageLiteral(resourceName: "grahamavenuemeats"),#imageLiteral(resourceName: "homei"),#imageLiteral(resourceName: "cafeloisl"),#imageLiteral(resourceName: "wafflewolf"),#imageLiteral(resourceName: "cafelore"),#imageLiteral(resourceName: "upstate"),#imageLiteral(resourceName: "thaicafe"),#imageLiteral(resourceName: "royaloak"),#imageLiteral(resourceName: "teakha"),#imageLiteral(resourceName: "cafedeadend")]
    var restaurantLocation = ["Hong Kong","Taiwan","Hong Kong","Taiwan","Hong Kong","Taiwan","Hong Kong","Taiwan","Hong Kong","Taiwan","Hong Kong","Taiwan","Hong Kong","Taiwan","Hong Kong","Taiwan","Hong Kong","Taiwan","Hong Kong","Taiwan","Hong Kong","Taiwan","Hong Kong","Taiwan"]
    var restaurantType = ["Cafe & Food","Cafe","Food","Cafe & Food","Cafe","Food","Cafe & Food","Cafe","Food","Cafe & Food","Cafe","Food","Cafe & Food","Cafe","Food","Cafe & Food","Cafe","Food","Cafe & Food","Cafe","Food","Cafe & Food","Cafe","Food"]
    var  restauranttoVisited = [Bool](repeating: false, count: 24)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...23{
            restaurant.append(Restaurant(name: restaurantName[i], type: restaurantType[i], location: restaurantLocation[i], image: restaurantImage[i], isVisited: restauranttoVisited[i]))
        };
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurant.count
    }

    //          Config UITable
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
            for: indexPath) as! RestaurantTableViewCell
        cell.nameLabel?.text = restaurant[(indexPath as NSIndexPath).row].name
        cell.thumbnailImageView?.image = restaurant[(indexPath as NSIndexPath).row].image
        cell.locationLabel?.text = restaurant[(indexPath as NSIndexPath).row].location
        cell.typeLabel?.text = restaurant[(indexPath as NSIndexPath).row].type
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ID.showDetail{
            if let indexPath = tableView.indexPathForSelectedRow{
                let destination = segue.destination as! RestaurantDetailViewController
                destination.restaurant = restaurant[(indexPath as NSIndexPath).row]
            }
        }
    }
    
    //              Custon Row Action
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share", handler: {
            (action,indexPath) -> Void in
            let defaultText = "Just checking in at " + self.restaurant[(indexPath as NSIndexPath).row].name!
            if let shareImage = self.restaurantImage[(indexPath as NSIndexPath).row].images{
                let activityController = UIActivityViewController(activityItems: [defaultText,shareImage], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        })
        shareAction.backgroundColor = UIColor(red: 25/255, green: 181/255, blue: 254/255, alpha: 0.8)
        
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete", handler: {
            (action,indexPath) -> Void in
            self.restaurant.remove(at: (indexPath as NSIndexPath).row)
            self.restaurantImage.remove(at: (indexPath as NSIndexPath).row)
            self.restauranttoVisited.remove(at: (indexPath as NSIndexPath).row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        })
        deleteAction.backgroundColor = UIColor(red: 242/255, green: 38/255, blue: 19/255, alpha: 0.8)
        
        return [deleteAction,shareAction]
    }
    
    //          User did Select Row At IndexPath
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
//        
//        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//        optionMenu.addAction(cancelAction)
//        
//        let callActiton = UIAlertAction(title: "CALL" + "123-000-\(indexPath.row)", style: .Default,
//            handler:{ (action:UIAlertAction!) -> Void in
//                let alertMessage = UIAlertController(title: "Service Unvailable", message: "Sorry,the call feature isn't available yet. Please retry kater", preferredStyle: .Alert)
//                alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//                self.presentViewController(alertMessage, animated: true, completion: nil)
//                })
//        optionMenu.addAction(callActiton)
//        
//        let isVisitedAction = self.restauranttoVisited[indexPath.row] ?
//            UIAlertAction(title: "I'va not been here", style: .Default, handler: {
//            (action:UIAlertAction) -> Void in
//            let cell = tableView.cellForRowAtIndexPath(indexPath)
//            self.restauranttoVisited[indexPath.row] = false
////            if self.restauranttoVisited[indexPath.row]{
////                cell?.accessoryType = .Checkmark
////            }else{
////                cell?.accessoryType = .None
////            }     ==>
//            cell?.accessoryType = self.restauranttoVisited[indexPath.row] ? .Checkmark : .None
//            }) :
//            UIAlertAction(title: "I'va been here", style: .Default, handler: {
//            (action) -> Void in
//            let cell = tableView.cellForRowAtIndexPath(indexPath)
//            self.restauranttoVisited[indexPath.row] = true
//            cell?.accessoryType = self.restauranttoVisited[indexPath.row] ? .Checkmark : .None
//            })
//        optionMenu.addAction(isVisitedAction)
//        
//        tableView.deselectRowAtIndexPath(indexPath, animated: false)
//        
//        self.presentViewController(optionMenu, animated: true, completion: nil)
//    }
    
    /*              Slipping Delete
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete{
            restaurant.removeAtIndex(indexPath.row)
            restaurantImage.removeAtIndex(indexPath.row)
            restauranttoVisited.removeAtIndex(indexPath.row)
        }
        print("Total item: \(restaurant.count)")
        
        //    reload data
        //    tableView.reloadData()
        
        //    delete animator
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
    */
}

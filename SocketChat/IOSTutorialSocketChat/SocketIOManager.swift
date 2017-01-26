//
//  SocketIOManager.swift
//  IOSTutorialSocketChat
//
//  Created by sujustin on 2016/10/25.
//  Copyright © 2016年 sujustin. All rights reserved.
//

import UIKit

class SocketIOManager: NSObject {
    
    static let shared = SocketIOManager()
    
    var socket: SocketIOClient = SocketIOClient(socketURL: NSURL(string: "http://163.13.127.213:3000")! as URL)
    
    override init(){
        super.init()
    }
    
    func establishConnection() {
        socket.connect()
        socket.emit("IOS_data", "iphone connect")
        print("socket is connect")
    }
    
    
    func closeConnection() {
        socket.disconnect()
        print("soket is disconnect")
    }
    
    func connectToServerWithNickname(nickname: String, completionHandler: @escaping (_ userList: [[String: AnyObject]]?) -> Void) {
        socket.emit("connectUser", nickname)
        socket.on("userList") {
            ( dataArray, ack) -> Void in
            completionHandler(dataArray[0] as? [[String: AnyObject]])
        }
    }
}

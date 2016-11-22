//
//  Module.swift
//  omok
//
//  Created by rimduhui on 2016. 9. 2..
//  Copyright © 2016년 rimduhui. All rights reserved.
//

import Foundation

func connectServer(){
    let request = NSMutableURLRequest(URL: NSURL(string: "http://163.239.169.54:5000")!)
    request.HTTPMethod = "POST"
    let postString = "table=1318108109238401"
    request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
    let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
        let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
        print("responseString = \(responseString)")
    }
    task.resume()
}
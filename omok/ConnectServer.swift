//
//  ConnectServer.swift
//  omok
//
//  Created by rimduhui on 2016. 9. 2..
//  Copyright © 2016년 rimduhui. All rights reserved.
//

import Foundation

func connectServer() {
    var request = URLRequest(url: URL(string: "http://0.0.0.0:5000")!)
    request.httpMethod = "POST"
    let postString = "table=123"
    request.httpBody = postString.data(using: .utf8)
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {                                                 // check for fundamental networking error
            print("error=\(error)")
            return
        }
        
        if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
            print("statusCode should be 200, but is \(httpStatus.statusCode)")
            print("response = \(response)")
        }
        
        let responseString = String(data: data, encoding: .utf8)
        print("responseString = \(responseString)")
    }
    task.resume()
}

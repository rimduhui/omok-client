//
//  CreateButton.swift
//  omok
//
//  Created by rimduhui on 2016. 9. 2..
//  Copyright © 2016년 rimduhui. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

var Height : CGFloat = 0
var Width : CGFloat = 0

func createPointSensor (display: UIViewController, plate: Plate) {
    
    Height = display.view.frame.size.height
    Width = display.view.frame.size.width
    
    for x in 0...SIZE_OF_PLATE - 1 {
        for y in 0...SIZE_OF_PLATE - 1 {
            let sensor = UIButton()
            setSensor(sensor:sensor, x:x, y:y, display:display)
            display.view.addSubview(sensor)
            plate.pointState.append(EMPTY)
            plate.pointSensor.append(sensor)
        }
    }
}

func setSensor (sensor : UIButton, x : Int, y : Int, display : UIViewController){
    let lengthOfSensor = Width / CGFloat(SIZE_OF_PLATE + 1)
    sensor.frame.size.width = lengthOfSensor
    sensor.frame.size.height = lengthOfSensor
    sensor.frame.origin.x = lengthOfSensor / 2 + (lengthOfSensor * CGFloat(x))
    sensor.frame.origin.y = Height / 4 + lengthOfSensor / 2 + (lengthOfSensor * CGFloat(y))
//    sensor.backgroundColor = UIColor(red:0.78, green:0.21, blue:0.19, alpha: 0.5)
    sensor.layer.cornerRadius = lengthOfSensor
    sensor.tag = x + y * SIZE_OF_PLATE
    sensor.addTarget(display, action: #selector(OmokPlayController.sensorListener(sender:)), for: .touchDown)
}

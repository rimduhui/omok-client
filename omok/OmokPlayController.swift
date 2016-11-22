//
//  OmokPlayController.swift
//  omok
//
//  Created by rimduhui on 2016. 8. 31..
//  Copyright © 2016년 rimduhui. All rights reserved.
//

import UIKit

let SIZE_OF_PLATE = 15
let RIGHTDIAGONAL : Int = 0
let YLINE : Int = 1
let XLINE : Int = 2
let LEFTDIAGONAL : Int = 3
let BLACK : UInt8 = 0
let WHITE : UInt8 = 1
let EMPTY : UInt8 = 2

class OmokPlayController: UIViewController {
    @IBOutlet weak var plateView: PlateView!
    
    var plate = Plate()
    var isblack : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let Width = self.view.frame.size.width
        let Height = self.view.frame.size.height
        
        plateView.frame = CGRect(x: 0, y: Height / 4, width: Width, height: Width)
        createPointSensor(display: self, plate: plate)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendPythonServer(_ sender: AnyObject) {
        connectServer()
    }
    
    func sensorListener(sender: UIButton){
        sender.isEnabled = false
        sender.backgroundColor = isblack ? UIColor.black : UIColor.white
        plate.pointState[sender.tag] = isblack ? BLACK : WHITE
        if checker(team: plate.pointState[sender.tag]) {
            print(plate.pointState[sender.tag])
        }
        isblack = isblack ? false : true
    }
    
    func checker(team : UInt8) -> Bool {
        for x in 0...SIZE_OF_PLATE-1 {
            for y in 0...SIZE_OF_PLATE-1 {
                
                let winner1 = getNumberOfLine(team: team, x: x, y: y, type: RIGHTDIAGONAL)
                let winner2 = getNumberOfLine(team: team, x: x, y: y, type: YLINE)
                let winner3 = getNumberOfLine(team: team, x: x, y: y, type: XLINE)
                let winner4 = getNumberOfLine(team: team, x: x, y: y, type: LEFTDIAGONAL)
                
                if (winner1 == 5 || winner2 == 5 || winner3 == 5 || winner4 == 5) {
                    return true
                }
            }
        }
        return false
    }
    
    func getNumberOfLine(team:UInt8, x:Int, y:Int, type : Int) -> Int{
        var win : Int = 0
        var currentX = x
        var currentY = y
        
        for _ in 0...4{
            if (currentY >= 0 && currentY < SIZE_OF_PLATE && currentX >= 0 && currentX < SIZE_OF_PLATE) {
                if (plate.pointState[currentX + currentY*SIZE_OF_PLATE] == team) {
                    switch type {
                    case RIGHTDIAGONAL:
                        win = win + 1;
                        currentX = currentX - 1
                        currentY = currentY - 1
                        break
                    case YLINE:
                        win = win + 1
                        currentY = currentY - 1
                        break
                    case XLINE:
                        win = win + 1
                        currentX = currentX - 1
                        break
                    default :
                        win = win + 1;
                        currentX = currentX - 1
                        currentY = currentY + 1
                    }
                }
                else  { break }
            }
            else { break }
        }
        return win
    }
}

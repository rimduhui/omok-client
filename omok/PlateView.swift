//
//  PlateView.swift
//  omok
//
//  Created by duhui rim on 2016. 11. 17..
//  Copyright © 2016년 rimduhui. All rights reserved.
//

import UIKit
import QuartzCore

class PlateView: UIView {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let h = rect.height / (CGFloat(SIZE_OF_PLATE) + 1)
        let w = rect.width / (CGFloat(SIZE_OF_PLATE) + 1)
        let color:UIColor = UIColor.white
        
        for x in 1...SIZE_OF_PLATE - 1{
            for y in 1...SIZE_OF_PLATE - 1{
                let drect = CGRect(x: (w * CGFloat(x)),y: (h * CGFloat(y)),width: (w),height: (h))
                let bpath:UIBezierPath = UIBezierPath(rect: drect)
        
                color.set()
                bpath.stroke()
            }
        }
        
        NSLog("drawRect has updated the view")

    }
    
}

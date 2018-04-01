//
//  ShapeView.swift
//  TabBarSample
//
//  Created by Franklin S D'souza on 31/03/18.
//  Copyright © 2018 Zeeyad. All rights reserved.
//

import UIKit

class ShapeView: UIView {

    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setLineWidth(4)
        context.setStrokeColor(UIColor.white.cgColor)
        let radius: CGFloat = self.frame.size.width / 2
        let endAngle = CGFloat( 2 * Double.pi)
        print("endAngle:\(endAngle)")
        context.addArc(center: center, radius: radius, startAngle: 0, endAngle: endAngle, clockwise: true)
        context.strokePath()
    }
 

}

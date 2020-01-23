//
//  RingLayer.swift
//  Tomato
//
//  Created by Damon Cricket on 23.01.2020.
//  Copyright © 2020 DC. All rights reserved.
//

import UIKit

class RingLayer: CALayer {
    var color: CGColor = UIColor.clear.cgColor
    var width: CGFloat = 0.0
    
    override init() {
        super.init()
        postInitSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        postInitSetup()
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
        if let ringLayer = layer as? RingLayer {
            color = ringLayer.color
            width = ringLayer.width
        }
        postInitSetup()
    }
    
    func postInitSetup() {
        needsDisplayOnBoundsChange = true
    }
    
    override func draw(in ctx: CGContext) {
        super.draw(in: ctx)
        
        UIGraphicsPushContext(ctx)
        ctx.setStrokeColor(color)
        ctx.setLineWidth(width)
        let path = CGMutablePath()
        path.addArc(center: CGPoint(x: bounds.midX, y: bounds.midY), radius: bounds.midX - width/2, startAngle: 0.0, endAngle: DegreesToRadians(360.0), clockwise: true)
        ctx.addPath(path)
        ctx.strokePath()
        UIGraphicsPopContext()
    }
}

func DegreesToRadians(_ degrees: CGFloat) -> CGFloat {
    return degrees*CGFloat.pi/180
}

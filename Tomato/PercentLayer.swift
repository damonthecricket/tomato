//
//  PercentLayer.swift
//  Tomato
//
//  Created by Damon Cricket on 23.01.2020.
//  Copyright © 2020 DC. All rights reserved.
//

import UIKit

class PercentLayer: CALayer {
    var color: CGColor = UIColor.clear.cgColor
    var start: CGFloat = 0.0
    var end: CGFloat = 0.0
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
        if let percentLayer = layer as? PercentLayer {
            color = percentLayer.color
            start = percentLayer.start
            end = percentLayer.end
            width = percentLayer.width
        }
        postInitSetup()
    }
    
    func postInitSetup() {
        needsDisplayOnBoundsChange = true
    }
    
    override func draw(in ctx: CGContext) {
        super.draw(in: ctx)
        
        UIGraphicsPushContext(ctx)
        ctx.setLineWidth(width)
        ctx.setStrokeColor(color)
        let upArcPath = CGMutablePath()
        upArcPath.addArc(center: CGPoint(x: bounds.midX, y: bounds.midY), radius: bounds.midX - width/2, startAngle: start, endAngle: end, clockwise: false)
        ctx.addPath(upArcPath)
        ctx.strokePath()
        UIGraphicsPopContext()
    }
}

//
//  PercentView.swift
//  Tomato
//
//  Created by Damon Cricket on 23.01.2020.
//  Copyright © 2020 DC. All rights reserved.
//

import UIKit

class PercentView: UIView {
    var color: UIColor {
        set {
            percentLayer.color = newValue.cgColor
        } get {
            return UIColor(cgColor: percentLayer.color)
        }
    }
    var width: CGFloat {
        set {
            percentLayer.width = newValue
        } get {
            return percentLayer.width
        }
    }
    var percentLayer: PercentLayer {
        return layer as! PercentLayer
    }
    override open class var layerClass: AnyClass {
        return PercentLayer.self
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        let angle = DegreesToRadians(270.0)
        percentLayer.start = angle
        percentLayer.end = angle
    }
    func set(percent: CGFloat) {
        let one = DegreesToRadians(360.0)/100.0
        let result = percent * one
        percentLayer.end = result - DegreesToRadians(90.0)
        percentLayer.setNeedsDisplay()
    }
}

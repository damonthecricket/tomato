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
    var start: CGFloat {
        set {
            percentLayer.start = newValue
        } get {
            return percentLayer.start
        }
    }
    var end: CGFloat {
        set {
            percentLayer.end = newValue
        } get {
            return percentLayer.end
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
}

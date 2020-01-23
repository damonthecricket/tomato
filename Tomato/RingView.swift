//
//  RingView.swift
//  Tomato
//
//  Created by Damon Cricket on 23.01.2020.
//  Copyright © 2020 DC. All rights reserved.
//

import UIKit

class RingView: UIView {
    var color: UIColor {
        set {
            ringLayer.color = newValue.cgColor
        } get {
            return UIColor(cgColor: ringLayer.color)
        }
    }
    var width: CGFloat {
        set {
            ringLayer.width = newValue
        } get {
            return ringLayer.width
        }
    }
    var ringLayer: RingLayer {
        return layer as! RingLayer
    }
    override open class var layerClass: AnyClass {
        return RingLayer.self
    }
}

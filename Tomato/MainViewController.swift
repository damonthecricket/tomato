//
//  MainViewController.swift
//  Tomato
//
//  Created by Damon Cricket on 23.01.2020.
//  Copyright © 2020 DC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var ringView: RingView?
    @IBOutlet weak var percentView: PercentView?
    @IBOutlet weak var timerLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

        ringView?.color = UIColor.red.withAlphaComponent(0.3)
        ringView?.width = 10.0
    }
}

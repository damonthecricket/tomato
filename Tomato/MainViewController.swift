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
    @IBOutlet weak var startButtonRingView: RingView?
    @IBOutlet weak var startButton: UIButton?
    var timer: Timer? = nil
    var time: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let redColor = UIColor.red.withAlphaComponent(0.3)
        let width: CGFloat = 10.0
        
        ringView?.color = redColor
        ringView?.width = width
        
        startButtonRingView?.color = redColor
        startButtonRingView?.width = width
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        timerLabel?.text = "\(SettingsService.shared.pomodoroTime/60):00"
    }
    
    @IBAction func settingsBarButtonItemTap(sender: UIBarButtonItem) {
        let vc = UIStoryboard(name: "Settings", bundle: nil).instantiateInitialViewController()!
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func startButtonTap(sender: UIButton) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerTick(timer:)), userInfo: nil, repeats: true)
            startButton?.setImage(UIImage(named: "stop"), for: .normal)
        } else {
            stopTimer()
            timerLabel?.text = "\(SettingsService.shared.pomodoroTime/60):00"
            startButton?.setImage(UIImage(named: "start"), for: .normal)
        }
    }
    
    @objc func timerTick(timer: Timer) {
        time += 1
        var seconds = SettingsService.shared.pomodoroTime - time
        let minutes = seconds/60
        seconds -= minutes*60
        timerLabel?.text = "\(minutes):\(seconds)"
        if seconds == 0 {
            stopTimer()
            timerLabel?.text = "\(SettingsService.shared.pomodoroTime/60):00"
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

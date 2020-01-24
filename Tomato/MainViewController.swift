//
//  MainViewController.swift
//  Tomato
//
//  Created by Damon Cricket on 23.01.2020.
//  Copyright © 2020 DC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    enum State {
        case pomodoro
        case space
        case longSpace
    }
    @IBOutlet weak var ringView: RingView?
    @IBOutlet weak var percentView: PercentView?
    @IBOutlet weak var timerLabel: UILabel?
    @IBOutlet weak var startButtonRingView: RingView?
    @IBOutlet weak var startButton: UIButton?
    var timer: Timer? = nil
    var time: Int = 0
    var pomodoros: Int = 0
    var state: State = .pomodoro
    
    deinit {
        stopTimer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let redColor = UIColor.red.withAlphaComponent(0.3)
        let width: CGFloat = 10.0
        
        ringView?.color = redColor
        ringView?.width = width
        
        percentView?.color = .red
        percentView?.width = width
        
        startButtonRingView?.color = redColor
        startButtonRingView?.width = width
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        timerLabel?.text = "\(SettingsService.shared.pomodoroTime/60):00"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        reset()
        stop()
    }
    
    @IBAction func settingsBarButtonItemTap(sender: UIBarButtonItem) {
        let vc = UIStoryboard(name: "Settings", bundle: nil).instantiateInitialViewController()!
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func startButtonTap(sender: UIButton) {
        reset()
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerTick(timer:)), userInfo: nil, repeats: true)
            startButton?.setImage(UIImage(named: "stop"), for: .normal)
        } else {
            stop()
        }
    }
    
    @objc func timerTick(timer: Timer) {
        time += 1
        var seconds = currentTime() - time
        let minutes = seconds/60
        seconds -= minutes*60
        timerLabel?.text = "\(minutes):\(seconds)"
        let ratio = CGFloat(time)/CGFloat(currentTime())
        let percentage = ratio*100.0
        percentView?.set(percent: CGFloat(percentage))
        if currentTime()-time == 0 {
            time = 0
            let settings = SettingsService.shared
            switch state {
            case  .pomodoro:
                pomodoros += 1
                if pomodoros%settings.longBreakEach == 0 {
                    state = .longSpace
                    timerLabel?.text = "\(settings.longBreakTime/60):00"
                } else {
                    state = .space
                    timerLabel?.text = "\(settings.breakTime/60):00"
                }
            case     .space:
                state = .pomodoro
                timerLabel?.text = "\(settings.pomodoroTime/60):00"
            case .longSpace:
                state = .pomodoro
                timerLabel?.text = "\(settings.pomodoroTime/60):00"
            }
        }
    }
    
    func currentTime() -> Int {
        let settings = SettingsService.shared
        switch state {
        case  .pomodoro: return settings.pomodoroTime
        case     .space: return settings.breakTime
        case .longSpace: return settings.longBreakTime
        }
    }
    
    func reset() {
        pomodoros = 0
        state = .pomodoro
        time = 0
        percentView?.set(percent: 0.0)
    }
    
    func stop() {
        stopTimer()
        timerLabel?.text = "\(SettingsService.shared.pomodoroTime/60):00"
        startButton?.setImage(UIImage(named: "start"), for: .normal)
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

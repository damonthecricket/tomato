//
//  SettingsService.swift
//  Tomato
//
//  Created by Damon Cricket on 23.01.2020.
//  Copyright © 2020 DC. All rights reserved.
//

import Foundation

class SettingsService {
    struct Coding {
        static let pomodoroTime = "pomodoro.time.coding.constant"
        static let breakTime = "break.time.coding.constant"
        static let longBreakTime = "long.break.time.coding.constant"
        static let longBreakEach = "long.break.each.coding.constant"
    }
    struct Constants {
        static let pomodoroTime = 30
        static let breakTime = 5
        static let longBreakTime = 10
        static let longBreakEach = 3
    }
    
    static let shared = SettingsService()
    var pomodoroTime: Int {
        set {
            UserDefaults.standard.set(newValue, forKey: Coding.pomodoroTime)
        } get {
            return UserDefaults.standard.integerValue(forKey: Coding.pomodoroTime, defaultValue: Constants.pomodoroTime)
        }
    }
    var breakTime: Int {
        set {
            UserDefaults.standard.set(newValue, forKey: Coding.breakTime)
        } get {
            return UserDefaults.standard.integerValue(forKey: Coding.breakTime, defaultValue: Constants.breakTime)
        }
    }
    var longBreakTime: Int {
        set {
            UserDefaults.standard.set(newValue, forKey: Coding.longBreakTime)
        } get {
            return UserDefaults.standard.integerValue(forKey: Coding.longBreakTime, defaultValue: Constants.longBreakTime)
        }
    }
    var longBreakEach: Int {
        set {
            UserDefaults.standard.set(newValue, forKey: Coding.longBreakEach)
        } get {
            return UserDefaults.standard.integerValue(forKey: Coding.longBreakEach, defaultValue: Constants.longBreakEach)
        }
    }
}

extension UserDefaults {
    func integerValue(forKey key: String, defaultValue: Int) -> Int {
        if let number = UserDefaults.standard.object(forKey: key) as? NSNumber {
            return number.intValue
        } else {
            return defaultValue
        }
    }
}

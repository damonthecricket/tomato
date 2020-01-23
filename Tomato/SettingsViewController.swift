//
//  SettingsViewController.swift
//  Tomato
//
//  Created by Damon Cricket on 23.01.2020.
//  Copyright © 2020 DC. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var pomodoroTimeTextField: UITextField?
    @IBOutlet weak var breakTimeTextField: UITextField?
    @IBOutlet weak var longBreakTimeTextField: UITextField?
    @IBOutlet weak var longBreakEachTextField: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let settings = SettingsService.shared
        pomodoroTimeTextField?.text = "\(settings.pomodoroTime/60)"
        breakTimeTextField?.text = "\(settings.breakTime/60)"
        longBreakTimeTextField?.text = "\(settings.longBreakTime/60)"
        longBreakEachTextField?.text = "\(settings.longBreakEach)"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let settings = SettingsService.shared
        settings.pomodoroTime = pomodoroTimeTextField!.integerValue*60
        settings.breakTime = breakTimeTextField!.integerValue*60
        settings.longBreakTime = longBreakTimeTextField!.integerValue*60
        settings.longBreakEach = longBreakEachTextField!.integerValue
        super.viewWillDisappear(animated)
    }
    
    @IBAction func closeButtonTap(sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, text.isEmpty {
            let settings = SettingsService.shared
            if textField == pomodoroTimeTextField {
                textField.text = "\(settings.pomodoroTime/60)"
            } else if textField == breakTimeTextField {
                textField.text = "\(settings.breakTime/60)"
            } else if textField == longBreakTimeTextField {
                textField.text = "\(settings.longBreakTime/60)"
            } else if textField == longBreakEachTextField {
                textField.text = "\(settings.longBreakEach)"
            }
        }
    }
}

extension UITextField {
    var integerValue: Int {
        return Int(text != nil ? text! : "0")!
    }
}

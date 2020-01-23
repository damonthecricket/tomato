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
        pomodoroTimeTextField?.text = "\(settings.pomodoroTime)"
        breakTimeTextField?.text = "\(settings.breakTime)"
        longBreakTimeTextField?.text = "\(settings.longBreakTime)"
        longBreakEachTextField?.text = "\(settings.longBreakEach)"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let settings = SettingsService.shared
        settings.pomodoroTime = pomodoroTimeTextField!.integerValue
        settings.breakTime = breakTimeTextField!.integerValue
        settings.longBreakTime = longBreakTimeTextField!.integerValue
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
                textField.text = "\(settings.pomodoroTime)"
            } else if textField == breakTimeTextField {
                textField.text = "\(settings.breakTime)"
            } else if textField == longBreakTimeTextField {
                textField.text = "\(settings.longBreakTime)"
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

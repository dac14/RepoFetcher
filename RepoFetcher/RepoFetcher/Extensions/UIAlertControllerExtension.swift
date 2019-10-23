//
//  UIAlertControllerExtension.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 23/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import UIKit

extension UIAlertController {
    static func alert(title: String? = nil, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("general_alert_ok_button_message", comment: ""), style: .default)
        alert.addAction(action)
        
        return alert
    }
}

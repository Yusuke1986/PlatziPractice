//
//  PushNotificationsController.swift
//  PlatziFinanzas
//
//  Created by 松岡裕介 on 2019/04/11.
//  Copyright © 2019 Platzi. All rights reserved.
//

import UIKit
import UserNotifications

class PushNotificationsController {
    init(application: UIApplication) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert]) { (success, error) in
            DispatchQueue.main.async {
                application.registerForRemoteNotifications()
            }
        }
    }
}

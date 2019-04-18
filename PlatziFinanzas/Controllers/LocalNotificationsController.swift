//
//  LocalNotificationsController.swift
//  PlatziFinanzas
//
//  Created by 松岡裕介 on 2019/04/11.
//  Copyright © 2019 Platzi. All rights reserved.
//

import Foundation
import UserNotifications

class LocalNotificationsController {
    init() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (success, error) in
            if success {
                self.addNotifications()
            }
        }
    }
    
    func addNotifications() {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Hiciste alguna compra el dia de hoy?"
        content.body = "Recuerda agregar los gastos del dia de hoy"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: 5.0,
            repeats: false
        )
        
        let request = UNNotificationRequest(
            identifier: "internseconds",
            content: content,
            trigger: trigger
        )
        
        center.add(request) { (error) in
            guard let error = error else { return }
            
            print(error.localizedDescription)
        }
    }
    
}

//
//  ViaNotificationCenter.swift
//  BLE MS SDK
//
//  Created by Bie Yaqing on 24/4/18.
//  Copyright © 2018 Bie Yaqing. All rights reserved.
//

import Foundation
import UserNotifications
import NotificationCenter

class ViaNotificationCenter {
    var notificationCenter: Any?;
    var notificationOptions: Any?;
    var trigger: Any?;
    let identifier = "ViaLocalNotification";
    
    func initiate() {
        if #available(iOS 10.0, *) {
            notificationCenter = UNUserNotificationCenter.current();
            // notificationOptions = [UNAuthorizationOptions.alert, UNAuthorizationOptions.sound, UNAuthorizationOptions.badge];
            notificationOptions = UNAuthorizationOptions.alert;
            trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false);
            (notificationCenter as! UNUserNotificationCenter).getNotificationSettings { (settings) in
                if settings.authorizationStatus != .authorized {
                    (self.notificationCenter as! UNUserNotificationCenter).requestAuthorization(options: self.notificationOptions as! UNAuthorizationOptions) { (granted, error) in
                        if !granted {
                            print("[VIATICK]: notification not alowed");
                        }
                    }
                }
            }
        } else if #available(iOS 9.0, *) {
            notificationCenter = UILocalNotification();
            notificationOptions = UIUserNotificationSettings(types: [.alert, .sound, .badge], categories: nil);
            UIApplication.shared.registerUserNotificationSettings(notificationOptions as! UIUserNotificationSettings);
        }
    }
    
    func shootNotification(title: String, body: String) {
        if #available(iOS 10.0, *) {
            let content: UNMutableNotificationContent = UNMutableNotificationContent();
            content.title = title;
            content.body = body;
            content.sound = UNNotificationSound.default();
            let request: UNNotificationRequest = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger as? UNNotificationTrigger);
            (notificationCenter as! UNUserNotificationCenter).add(request) { (error) in
                if error != nil {
                    print("[VIATICK]: notification error");
                }
            }
        } else if #available(iOS 9.0, *) {
            (notificationCenter as! UILocalNotification).fireDate = NSDate(timeIntervalSinceNow: 0.1) as Date;
            (notificationCenter as! UILocalNotification).alertTitle = title;
            (notificationCenter as! UILocalNotification).alertBody = body;
            (notificationCenter as! UILocalNotification).soundName = UILocalNotificationDefaultSoundName;
            UIApplication.shared.scheduleLocalNotification(notificationCenter as! UILocalNotification);
        }
    }
}


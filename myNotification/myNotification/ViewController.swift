//
//  ViewController.swift
//  myNotification
//
//  Created by 姜守栋 on 2018/1/16.
//  Copyright © 2018年 Nick.Inc. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().getNotificationSettings { (setting) in
            switch setting.authorizationStatus {
                
            case .notDetermined:
                UNUserNotificationCenter.current()
                    .requestAuthorization(options: [.alert, .sound, .badge]) { (accepted, error) in
                        if !accepted {
                            print("用户不允许消息通知")
                        }
                }
            case .denied:
                DispatchQueue.main.async {
                    let alertVC = UIAlertController(title: "消息推送已关闭",
                                                    message: "想要及时获取消息。点击“设置”，开启通知。",
                                                    preferredStyle: .alert)
                    let cancleAction = UIAlertAction(title: "取消",
                                                     style: .cancel,
                                                     handler: nil)
                    let settingsAction = UIAlertAction(title: "设置",
                                                       style: .default,
                                                       handler:
                        { (action) in
                            let url = URL(string: UIApplicationOpenSettingsURLString)
                            if let url = url, UIApplication.shared.canOpenURL(url) {
                                if #available(iOS 10, *) {
                                    UIApplication.shared.open(url,
                                                              options: [:],
                                                              completionHandler: { (success) in
                                                                
                                    })
                                } else {
                                    UIApplication.shared.canOpenURL(url)
                                }
                            }
                    })
                    alertVC.addAction(cancleAction)
                    alertVC.addAction(settingsAction)
                    self.present(alertVC, animated: true, completion: nil)
                }
            case .authorized:
                return
            }
        }
        
        let content = UNMutableNotificationContent()
        content.title = "拜访北京利星行有限公司"
        content.body = "2018-01-16 18:00"
        content.badge = 1
        var componet = DateComponents()
        componet.year = 2018
        componet.month = 1
        componet.day = 16
        componet.hour = 18
        componet.minute = 14
        let trigger = UNCalendarNotificationTrigger(dateMatching: componet, repeats: false)
        
        let requestIdentifier = "com.jiang.myNotification"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if error == nil {
                print("Time Interval Notification scheduled: \(requestIdentifier)")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  HealioApp.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/25/24.
//

import SwiftUI
import FirebaseCore
import FirebaseMessaging
import UserNotifications


class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    
    // Запрос разрешения на уведомления
    UNUserNotificationCenter.current().delegate = self
    let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
    UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { granted, error in
      print("Permission granted: \(granted)")
    }
    
    application.registerForRemoteNotifications()
    
    Messaging.messaging().delegate = self
    
    return true
  }
  
  // Обработка регистрации устройства для удаленных уведомлений
  func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    Messaging.messaging().apnsToken = deviceToken
  }
  
  // Обработка получения FCM токена
  func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
    print("FCM Token: \(fcmToken ?? "")")
  }
  
  // Обработка получения уведомлений
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    completionHandler([.alert, .badge, .sound])
  }
}

@main
struct HealioApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var purchaseManager = PurchaseManager()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(purchaseManager)
        }
    }
}

struct RootView: View {
    @EnvironmentObject var purchaseManager: PurchaseManager

    var body: some View {
        Group {
            if isFirstLaunch() {
                ContentView()
            } else {
                if purchaseManager.isSubscribed {
                    TabsView()
                } else {
                    TryPremiumView()
                }
            }
        }
        .onAppear {
            purchaseManager.checkSubscriptionStatus()
        }
    }

    // Проверка первого запуска
    private func isFirstLaunch() -> Bool {
        let hasLaunchedBefore = UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
        if !hasLaunchedBefore {
            UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
            return true
        }
        return false
    }
}

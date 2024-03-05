//
//  Chat_RealtimeDBApp.swift
//  Chat-RealtimeDB
//
//  Created by 유지호 on 3/5/24.
//

import SwiftUI
import FirebaseCore

@main
struct Chat_RealtimeDBApp: App {
    @UIApplicationDelegateAdaptor(Appdelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ChatView()
        }
    }
}

class Appdelegate: NSObject, UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
}

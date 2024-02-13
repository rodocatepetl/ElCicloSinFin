//
//  LifeCycleApp.swift
//  LifeCycle
//
//  Created by Rodolfo Castillo on 13/02/24.
//

import SwiftUI

@main
struct LifeCycleApp: App {
    init() {
        print("App initialized")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    func scene(_ scene: any Scene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        print("Scene will connect")
    }
    
    func sceneDidBecomeActive(_ scene: any Scene) {
        print("Scene did become active")
    }
    
    func sceneWillResignActive(_ scene: any Scene) {
        print("Scene will resign active")
    }
    
    func sceneDidEnterBackground(_ scene: any Scene) {
        print("Scene did enter background")
    }
    
    func sceneWillEnterForeground(_ scene: any Scene) {
        print("Scene will enter foreground")
    }
    
    func sceneDidDisconnect(_ scene: any Scene) {
        print("Scene did disconnect")
    }
}

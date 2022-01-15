//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Mahmudul Hasan on 2022-01-03.
//

import SwiftUI

@main
struct LandmarksApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    @StateObject private var modelData = ModelData()
    
    @UIApplicationDelegateAdaptor(SwiftUIAppDelegate.self) private var delegate
    
    init(){
        print("Init")
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }.onChange(of: scenePhase) { newValue in
            print(newValue)
        }
    }
}

//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Mahmudul Hasan on 2022-01-03.
//

import SwiftUI

@main
struct LandmarksApp: App {

    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        .commands {
            LandmarkCommands()
        }

#if os(macOS)
        Settings {
            LandmarkSettings()
        }
#endif
    }
}

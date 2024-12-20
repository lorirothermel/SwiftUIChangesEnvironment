//
//  SwiftUIChangesEnvironmentApp.swift
//  SwiftUIChangesEnvironment
//
//  Created by Lori Rothermel on 12/12/24.
//

import SwiftUI

@main
struct SwiftUIChangesEnvironmentApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(Light())
        }
    }
}

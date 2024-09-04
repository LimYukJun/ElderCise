//
//  Project2_4amApp.swift
//  Project2_4am
//
//  Created by T Krobot on 20/7/24.
//

import SwiftUI

@main
struct Project2_4amApp: App {
    @StateObject var manager = HealthManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)

        }
    }
}

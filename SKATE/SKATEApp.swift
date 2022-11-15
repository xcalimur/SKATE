//
//  SKATEApp.swift
//  SKATE
//
//  Created by Cami Mata on 11/13/22.
//

import SwiftUI

@main
struct SKATEApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewManager())
        }
    }
}

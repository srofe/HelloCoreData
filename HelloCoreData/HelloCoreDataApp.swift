//
//  HelloCoreDataApp.swift
//  HelloCoreData
//
//  Created by Simon Rofe on 9/4/21.
//

import SwiftUI

@main
struct HelloCoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(manager: CoreDataManager.inMemory)
        }
    }
}

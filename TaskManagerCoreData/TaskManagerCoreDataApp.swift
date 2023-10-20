//
//  TaskManagerCoreDataApp.swift
//  TaskManagerCoreData
//
//  Created by Joel Lacerda on 20/10/23.
//

import SwiftUI

@main
struct TaskManagerCoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Task.self])
    }
}

//
//  toDoListApp.swift
//  toDoList
//
//  Created by Brandon Amezcua on 1/21/24.
//

import FirebaseCore
import SwiftUI

@main
struct toDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

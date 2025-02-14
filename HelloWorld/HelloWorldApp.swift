//
//  HelloWorldApp.swift
//  HelloWorld
//
//  Created by ksd on 04/02/2025.
//

import SwiftUI

@main
struct HelloWorldApp: App {
    @State private var movieController = MovieController()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(movieController)
        }
    }
}

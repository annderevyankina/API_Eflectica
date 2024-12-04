//
//  APIEflecticaApp.swift
//  APIEflectica
//
//  Created by Анна on 02.12.2024.
//

import SwiftUI

@main
struct APIEflecticaApp: App {
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false  

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                MainTabView()
            } else {
                LoginView()
            }
        }
    }
}

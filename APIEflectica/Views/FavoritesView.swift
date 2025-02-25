// FavoritesView.swift
// APIEflectica
//
// Created by Анна on 24.02.2025.
//
import SwiftUI

struct FavoritesView: View {
    @ObservedObject var userManager: UserManager  // Принимаем userManager
    @State private var shouldRestartOnboarding = false // Состояние для перезапуска онбординга

    var body: some View {
        VStack {
            Button("Сбросить онбординг") {
                UserDefaults.standard.removeObject(forKey: "hasSeenOnboarding")
                shouldRestartOnboarding = true // Меняем состояние, чтобы сбросить онбординг
            }
            .fullScreenCover(isPresented: $shouldRestartOnboarding) {
                OnboardingView() // Показываем онбординг заново
            }

            Text("Избранное")
                .font(.headline)
                .padding()

            List {
                ForEach(userManager.user.favorites) { effect in
                    Text(effect.name) // Отображаем имя эффекта
                }
            }
        }
        .navigationBarTitle("Избранное", displayMode: .inline)
    }
}

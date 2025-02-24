// FavoritesView.swift
// APIEflectica
//
// Created by Анна on 24.02.2025.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var userManager: UserManager  // Принимаем userManager

    var body: some View {
        VStack {
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

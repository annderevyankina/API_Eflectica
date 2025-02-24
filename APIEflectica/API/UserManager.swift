//
//  UserManager.swift
//  APIEflectica
//
//  Created by Анна on 24.02.2025.
//

import Foundation
import Combine

class UserManager: ObservableObject {
    @Published var user: User
    private var cancellables = Set<AnyCancellable>()
    
    // Инициализируем с пустым пользователем, который будет заполнен с помощью API
    init() {
        self.user = User(id: 0, email: "", username: "", bio: "", contact: "", portfolio: "", isAdmin: false, avatar: "", encryptedPassword: "", favorites: [])
    }

    // Загрузка данных пользователя
    func loadUserData(userId: Int) {
        ApiService().fetchUserData(userId: userId) { result in
            switch result {
            case .success(let user):
                self.user = user
            case .failure(let error):
                print("Ошибка при загрузке данных пользователя: \(error)")
            }
        }
    }

    // Добавить эффект в избранное
    func addEffectToFavorites(effect: Effect) {
        if !user.favorites.contains(where: { $0.id == effect.id }) {
            user.favorites.append(effect)
        }
    }
    
    // Удалить эффект из избранного
    func removeEffectFromFavorites(effect: Effect) {
        user.favorites.removeAll { $0.id == effect.id }
    }
}

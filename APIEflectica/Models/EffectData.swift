//
//  EffectData.swift
//  APIEflectica
//
//  Created by Анна on 24.02.2025.
//

import Foundation

struct EffectCard: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var description: String
    var tags: [String]
    
    // Инициализатор для преобразования из модели Effect
    init(from effect: Effect) {
        self.title = effect.name  // Используем название эффекта как title
        self.description = effect.description
        self.tags = effect.tagList  // Теги из Effect для карточки
    }
}

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
    var imageURL: String

    // Инициализатор для преобразования из модели Effect
    init(from effect: Effect) {
        self.title = effect.name
        self.description = effect.description
        self.tags = effect.tagList.map { $0.replacingOccurrences(of: "_", with: " ") } 
        self.imageURL = effect.img.url
    }
}

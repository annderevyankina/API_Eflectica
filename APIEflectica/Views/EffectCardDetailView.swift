//
//  EffectCardDetailView.swift
//  APIEflectica
//
//  Created by Анна on 24.02.2025.
//

import SwiftUI

struct EffectCardDetailView: View {
    var effectCard: EffectCard
    @State private var navigateToCollection = false
    
    // Пример коллекций (можно заменить на реальные данные)
    let exampleCollections: [CollectionCard] = [
        CollectionCard(from: Collection(id: 1, name: "Design Resources", description: "A collection of design tools and resources", userId: 1, tagList: ["design", "tools", "resources"])),
        CollectionCard(from: Collection(id: 2, name: "Animation Presets", description: "Presets for animation workflows", userId: 2, tagList: ["animation", "presets"]))
    ]

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text(effectCard.title)
                    .font(.largeTitle)
                    .bold()
                
                Text(effectCard.description)
                    .font(.body)
                    .padding(.bottom, 10)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Инструкция:")
                        .font(.headline)
                    Text("""
                    1. Зарегистрируйтесь на сайте
                    2. Нажмите на кнопку купить (ничего оплачивать не нужно будет)
                    3. Выберите способ установки aescripts + aeplugins
                    4. Выберите вашу систему
                    5. Установите приложение для скачивания плагинов
                    6. После установки вам будет предложен один плагин к установке
                    7. Нажмите на кнопку установить. Теперь все готово! Зайдите в After Effects и наслаждайтесь работой с плагином
                    """)
                        .font(.callout)
                        .foregroundColor(.gray)
                }

                Spacer()

                NavigationLink(destination: CollectionsView(), isActive: $navigateToCollection) {
                    Button(action: {
                        navigateToCollection = true
                    }) {
                        Text("Добавить в коллекцию")
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding(.top, 20)
            }
            .padding()
        }
    }
}

//
//  CardDetailView.swift
//  APIEflectica
//
//  Created by Анна on 04.12.2024.
//

import Foundation
import SwiftUI

struct CardDetailView: View {
    var card: Card
    @State private var navigateToCollection = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text(card.title)
                    .font(.largeTitle)
                    .bold()
                
                Text(card.description)
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

                NavigationLink(destination: CollectionView(), isActive: $navigateToCollection) {
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

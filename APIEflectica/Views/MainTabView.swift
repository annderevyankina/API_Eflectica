//
//  MainTabView.swift
//  APIEflectica
//
//  Created by Анна on 03.12.2024.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false  // Храним состояние авторизации

    var body: some View {
        Button(action: {
            // Сбрасываем статус авторизации
            isLoggedIn = false
        }) {
            Text("Выйти")
                .foregroundColor(.blue)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
        
        TabView {
            QuestionsView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Обсуждения")
                }
            
            CardListView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Поиск")
                }
            
            CollectionView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Коллекции")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Профиль")
                }
            
            FavoriteView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Избранное")
                }
        }
        
    }
}

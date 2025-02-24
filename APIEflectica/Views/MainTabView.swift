//
//  MainTabView.swift
//  APIEflectica
//
//  Created by Анна on 03.12.2024.
//

import SwiftUI

struct MainTabView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    @State private var selectedTab = 0

    // Состояния для хранения данных
    @State private var questionCards: [QuestionCard] = []
    @State private var collectionCards: [CollectionCard] = []
    @State private var effectCards: [EffectCard] = []  // Здесь хранится список эффектов
    
    // Экземпляр ApiService
    private let apiService = ApiService()

    // Экземпляр UserManager
    @StateObject private var userManager = UserManager()

    // Загрузка данных при загрузке представления
    func loadData() {
        apiService.fetchQuestions(page: 1, userId: nil) { result in
            switch result {
            case .success(let questions):
                self.questionCards = questions.map { QuestionCard(from: $0) }
            case .failure(let error):
                print("Ошибка при загрузке вопросов: \(error)")
            }
        }
        
        apiService.fetchCollections(page: 1) { result in
            switch result {
            case .success(let collections):
                self.collectionCards = collections.map { CollectionCard(from: $0) }
            case .failure(let error):
                print("Ошибка при загрузке коллекций: \(error)")
            }
        }
        
        apiService.fetchEffects(page: 1, category: nil) { result in
            switch result {
            case .success(let effects):
                self.effectCards = effects.map { effect in
                    // Используем инициализатор from для создания EffectCard из Effect
                    EffectCard(from: effect)
                }
            case .failure(let error):
                print("Ошибка при загрузке эффектов: \(error)")
            }
        }

        // Загрузка данных пользователя с API
        userManager.loadUserData(userId: 1) // Здесь можно использовать реальный userId
    }

    var body: some View {
        NavigationView {
            ZStack {
                TabView(selection: $selectedTab) {
                    // Передаем реальные данные в QuestionsView
                    QuestionsView(questionCards: questionCards)
                        .tabItem {
                            Image(selectedTab == 0 ? "questIconActive" : "questIcon")
                        }
                        .tag(0)

                    // Передаем реальные данные в EffectsView
                    EffectsView(effectCards: effectCards, userManager: userManager) // Передаем userManager
                        .tabItem {
                            Image(selectedTab == 1 ? "mainIconActive" : "mainIcon")
                        }
                        .tag(1)

                    // Передаем реальные данные в CollectionsView
                    CollectionsView()
                        .tabItem {
                            Image(selectedTab == 2 ? "colIconActive" : "colIcon")
                        }
                        .tag(2)

                    // Передаем userManager в FavoritesView
                    FavoritesView(userManager: userManager)
                        .tabItem {
                            Image(selectedTab == 3 ? "favIconActive" : "favIcon")
                        }
                        .tag(3)
                }
                .onAppear {
                    loadData() // Загружаем данные при загрузке вью
                }
                
                VStack {
                    if selectedTab == 1 {
                        HStack {
                            NavigationLink(destination: ProfileView()) {
                                Image("defaultProfile")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color("ordinaryGrey"), lineWidth: 1.5))
                                    .padding(10)
                            }
                            Spacer()
                            Button(action: {}) {
                                Image("notifyIcon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 36, height: 36)
                                    .padding(10)
                            }
                        }
                        .padding(.horizontal)
                        .background(Color.white.opacity(0.8))
                        .frame(height: 50)
                    }
                    Spacer()
                }
            }
        }
    }
}

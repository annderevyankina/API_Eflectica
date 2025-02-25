//
//  ContentView.swift
//  APIEflectica
//
//  Created by Анна on 02.12.2024.
//

import SwiftUI

struct ContentView: View {
    let apiService = ApiService()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
//        .task {
//            apiService.fetchUsers(page: 1) { user in
//                print(user)
//            }
//        }
        .task {
            apiService.fetchCollections(page: 1) { coll in
                print(coll)
            }
        }
        .task {
            apiService.fetchEffects(page: 1, category: nil) { effect in
                print(effect)
            }
        }
        .task {
            apiService.fetchQuestions(page: 1, userId: nil) { quest in
                print(quest)
            }
        }

    }
}

#Preview {
    ContentView()
}

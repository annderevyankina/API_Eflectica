//
//  QuestionsView.swift
//  APIEflectica
//
//  Created by Анна on 03.12.2024.
//

import SwiftUI

struct QuestionsView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, World!")
                    .padding()
            }
            .navigationBarTitle("Вопросы", displayMode: .inline)
        }
    }
}

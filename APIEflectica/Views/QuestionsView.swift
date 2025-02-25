//
//  QuestionsView.swift
//  APIEflectica
//
//  Created by Анна on 03.12.2024.
//

import SwiftUI

struct QuestionsView: View {
    var questionCards: [QuestionCard]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(questionCards) { questionCard in
                        QuestionCardView(questionCard: questionCard)
                            .frame(maxWidth: .infinity) 
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("Вопросы", displayMode: .inline)
        }
    }
}

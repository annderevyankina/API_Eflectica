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
                    }
                }
                .padding()
            }
            .navigationBarTitle("Вопросы", displayMode: .inline) 
        }
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView(questionCards: [
            QuestionCard(from: Question(id: 1, title: "Как научиться программировать?", description: "Какие ресурсы и методы наиболее эффективны для изучения программирования?", media: nil, tagList: ["программирование", "обучение", "ресурсы"])),
            QuestionCard(from: Question(id: 2, title: "Какие книги почитать для развития лидерских качеств?", description: "Какие книги помогут развить лидерские навыки?", media: nil, tagList: ["лидерство", "книги", "развитие"]))
        ])
        .previewLayout(.sizeThatFits)
    }
}

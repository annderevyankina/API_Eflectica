//
//  QuestionCardView.swift
//  APIEflectica
//
//  Created by Анна on 24.02.2025.
//

import SwiftUI

struct QuestionCardView: View {
    var questionCard: QuestionCard

    var body: some View {
        VStack(alignment: .leading) {
            Text(questionCard.title)
                .font(.headline)
                .padding(.bottom, 2)
            
            Text(questionCard.description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .lineLimit(2)  
            
            HStack {
                ForEach(questionCard.tags, id: \.self) { tag in
                    Text(tag)
                        .font(.footnote)
                        .padding(5)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(5)
                }
            }
            .padding(.top, 5)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct QuestionCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCardView(questionCard: QuestionCard(from: Question(id: 1, title: "Как научиться программировать?", description: "Какие ресурсы и методы наиболее эффективны для изучения программирования?", media: nil, tagList: ["программирование", "обучение", "ресурсы"])))
            .previewLayout(.sizeThatFits)
    }
}

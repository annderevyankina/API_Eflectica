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
        VStack(alignment: .leading, spacing: 8) {
            Text(questionCard.title)
                .font(.headline)
            
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
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading) // Растягиваем по ширине
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

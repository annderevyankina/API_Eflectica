//
//  CardView.swift
//  Eflectica
//
//  Created by Анна on 01.12.2024.
//

import Foundation
import SwiftUI

struct CardView: View {
    var card: Card
    var body: some View {
        VStack(alignment: .leading) {
            Text(card.title)
                .font(.custom("BasisGrotesquePro-Medium", size: 20))
            
            Text(card.description)
                .font(.custom("BasisGrotesquePro-Regular", size: 16))
                .lineLimit(2)
                .padding(.top, 5)
            
            HStack {
                ForEach(card.tags, id: \.self) { tag in
                    Text(tag)
                        .font(.custom("BasisGrotesquePro-Regular", size: 14))
                        .padding(5)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                }
            }
            .padding(.top, 5)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color("borderColor"), lineWidth: 2)
        )
        .padding(.vertical, 8)
    }
}

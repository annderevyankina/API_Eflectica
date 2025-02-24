// EffectsView.swift
// APIEflectica
//
// Created by Анна on 24.02.2025.
//

import SwiftUI

struct EffectsView: View {
    var effectCards: [EffectCard]
    @ObservedObject var userManager: UserManager // Добавляем userManager
    
    @State private var selectedEffect: EffectCard?

    var body: some View {
        NavigationView {
            VStack {
                Text("Все эффекты")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding()

                List {
                    ForEach(effectCards) { effect in
                        EffectCardView(effectCard: effect)
                            .onTapGesture {
                                selectedEffect = effect
                            }
                            .listRowSeparator(.hidden)
                            .padding(.vertical, 2)
                    }
                }
                .listStyle(PlainListStyle())
                .padding(.horizontal, 16)
            }
            .navigationBarTitle("", displayMode: .inline)
            .sheet(item: $selectedEffect) { effect in
                EffectCardDetailView(effectCard: effect)
                    .navigationBarTitle(effect.title, displayMode: .inline)
            }
        }
    }
}

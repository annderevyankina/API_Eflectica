//
//  CardListView.swift
//  Eflectica
//
//  Created by Анна on 01.12.2024.
//

import Foundation
import SwiftUI

struct CardListView: View {
    let apiService = ApiService()

    @State private var cards: [Card] = []
    @State private var modalType: ModalType? = nil
    @State private var selectedCard: Card?
    @State private var selectedTag: String = "All"
    @State private var searchText: String = ""

    enum ModalType: Identifiable {
        case addCard
        case viewCard(Card)

        var id: String {
            switch self {
            case .addCard: return "addCard"
            case .viewCard(let card): return card.title
            }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                Text("Все эффекты")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding()

                List {
                    ForEach(cards) { card in
                        CardView(card: card)
                            .onTapGesture {
                                modalType = .viewCard(card)
                            }
                            .listRowSeparator(.hidden)
                            .padding(.vertical, 2)
                    }
                    .onDelete(perform: deleteCard)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
                .listStyle(PlainListStyle())
                .padding(.horizontal, 16)
            }
            .navigationBarTitle("", displayMode: .inline)
            .sheet(item: $modalType) { modal in
                switch modal {
                case .addCard:
                    AddCardView(cards: $cards)
                case .viewCard(let card):
                    CardDetailView(card: card)
                        .navigationBarTitle(card.title, displayMode: .inline)
                }
            }
            .task {
                fetchEffectsFromAPI()
            }
        }
    }

    private func deleteCard(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
    }

    private func fetchEffectsFromAPI() {
        apiService.fetchEffects(page: 1, category: nil) { result in
            switch result {
            case .success(let effects):
                let newCards = effects.map { effect in
                    Card(
                        title: effect.name,
                        description: effect.description,
                        tags: effect.devices.split(separator: ",").map { String($0) }
                    )
                }
                DispatchQueue.main.async {
                    cards = newCards
                }
            case .failure(let error):
                print("Error fetching effects: \(error.localizedDescription)")
            }
        }
    }
}

struct AddCardView: View {
    @Binding var cards: [Card]
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var tags: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Card Information")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    TextField("Tags (comma separated)", text: $tags)
                }
                
                Button("Add Card") {
                    let tagList = tags.split(separator: ",").map {
                        String($0).trimmingCharacters(in: .whitespaces)
                    }
                    
                    let newCard = Card(title: title, description: description, tags: tagList)
                    cards.append(newCard)
                }
            }
            .navigationBarTitle("Add Card")
            .navigationBarItems(trailing: Button("Done") {
            })
        }
    }
}

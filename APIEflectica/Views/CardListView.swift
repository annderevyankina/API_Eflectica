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
    @State private var showModal = false
    @State private var selectedCard: Card?
    @State private var selectedTag: String = "All"
    @State private var searchText: String = ""
    
//    var filteredCards: [Card] {
//        let filteredByTag = selectedTag == "All"
//            ? cards
//            : cards.filter { $0.tags.contains(selectedTag) }
//        
//        if searchText.isEmpty {
//            return filteredByTag
//        } else {
//            return filteredByTag.filter {
//                $0.title.contains(searchText) || $0.description.contains(searchText)
//            }
//        }
//    }
    
    var body: some View {
        NavigationView {
            VStack {
//                Picker("Filter by Tag", selection: $selectedTag) {
//                    Text("All").tag("All")
//                    ForEach(cards.flatMap { $0.tags }, id: \.self) { tag in
//                        Text(tag).tag(tag)
//                    }
//                }
//                .pickerStyle(SegmentedPickerStyle())
//                .padding()
                
                TextField("Search", text: $searchText)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                List {
                    ForEach(cards) { card in
                        CardView(card: card)
                            .onTapGesture {
                                selectedCard = card
                                showModal = true
                            }
                    }
                    .onDelete(perform: deleteCard)
                }
            }
            .navigationBarTitle("Cards")
            .sheet(item: $selectedCard) { card in
                CardDetailView(card: card)
                    .navigationBarTitle(card.title, displayMode: .inline) 

            }
            .navigationBarItems(trailing: Button(action: {
                showModal.toggle()
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showModal) {
                AddCardView(cards: $cards)
            }
            .task {
                fetchEffectsFromAPI()
            }
        }
    }
    
    // Метод для удаления карточек
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

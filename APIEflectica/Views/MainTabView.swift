//
//  MainTabView.swift
//  APIEflectica
//
//  Created by Анна on 03.12.2024.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    @State private var selectedTab = 0

    var body: some View {
        NavigationView {
            ZStack {
                TabView(selection: $selectedTab) {
                    QuestionsView()
                        .tabItem {
                            Image(selectedTab == 0 ? "questIconActive" : "questIcon")
                        }
                        .tag(0)

                    CardListView()
                        .tabItem {
                            Image(selectedTab == 1 ? "mainIconActive" : "mainIcon")
                        }
                        .tag(1)

                    CollectionView()
                        .tabItem {
                            Image(selectedTab == 2 ? "colIconActive" : "colIcon")
                        }
                        .tag(2)

                    FavoriteView()
                        .tabItem {
                            Image(selectedTab == 3 ? "favIconActive" : "favIcon")
                        }
                        .tag(3)
                }
                
                VStack {
                    HStack {
                        NavigationLink(destination: ProfileView()) {
                            Image(systemName: "person.circle")
                                .font(.title)
                                .padding()
                                .foregroundColor(Color("ordinaryGrey"))
                        }
                        Spacer()
                        Button(action: {
                        }) {
                            Image(systemName: "bell")
                                .font(.title)
                                .padding()
                                .foregroundColor(Color("ordinaryGrey"))
                        }
                    }
                    .padding(.top, 10)
                    .padding(.horizontal)
                    .background(Color.white.opacity(0.8))
                    Spacer()
                }
            }
        }
    }
}

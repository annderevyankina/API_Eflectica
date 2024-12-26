//
//  CollectionView.swift
//  APIEflectica
//
//  Created by Анна on 03.12.2024.
//

import SwiftUI

struct CollectionView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Text("Collection 1")
                    Text("Collection 2")
                }
                .padding(.top, 16)
            }
            .navigationBarTitle("Коллекции", displayMode: .inline)
        }
    }
}

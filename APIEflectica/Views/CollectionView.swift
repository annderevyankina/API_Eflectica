//
//  CollectionView.swift
//  APIEflectica
//
//  Created by Анна on 03.12.2024.
//

import SwiftUI

struct CollectionView: View {
    var body: some View {
        VStack {
            Text("Your Collections")
                .font(.title)
                .padding()

            List {
                Text("Collection 1")
                Text("Collection 2")
            }
        }
        .navigationBarTitle("Коллекции", displayMode: .inline)
    }
}

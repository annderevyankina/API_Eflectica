//
//  SplashScreenView.swift
//  module_project
//
//  Created by Анна on 28.10.2024.
//

import Foundation
import SwiftUI

struct SplashScreenView: View {
    @State private var isMainActive = false
    @State private var opacity = 0.5
    
    var body: some View {
        ZStack {
            Color("accentColor")
                .ignoresSafeArea()

            if isMainActive {
                MainTabView()
            } else {
                VStack {
                    VStack {
                        Image("A_Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 250)
                            .offset(y: -20)

                    }
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        withAnimation (.easeIn(duration: 0.8)) {
                            self.isMainActive = true
                        }
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

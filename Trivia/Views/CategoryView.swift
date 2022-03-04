//
//  ContentView.swift
//  Trivia
//
//  Created by Alexis Orellano on 2/10/22.
//

import SwiftUI

struct CategoryView: View {
    @StateObject var triviaManager = TriviaManager()
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                VStack {
                    ReusableText(text: "Choose Group", size: 30)
                    CategoryListView()
                        
                }
            }
            .padding(.top, 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}

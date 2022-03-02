//
//  ContentView.swift
//  Trivia
//
//  Created by Alexis Orellano on 2/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("background2")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .ignoresSafeArea()
            VStack {
                ReusableText(text: "Choose Category", size: 30)
                    .padding()
                Spacer()
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

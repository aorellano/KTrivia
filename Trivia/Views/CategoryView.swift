//
//  ContentView.swift
//  Trivia
//
//  Created by Alexis Orellano on 2/10/22.
//

import SwiftUI

struct CategoryView: View {

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.cyan.opacity(0.9), Color.purple.opacity(0.9)], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            Circle()
                .frame(width: 300)
                .foregroundColor(Color.blue.opacity(0.8))
                .blur(radius: 12)
                .offset(x: -100, y: -180)
            
            Circle()
                .frame(width: 300)
                .foregroundColor(Color.blue.opacity(0.8))
                .blur(radius: 12)
                .offset(x: 100, y:180)
            
          
            
            VStack {
                ReusableText(text: "Choose Group", size: 30)
                    
                
                CategoryListView()
                
            }
            .padding(.top, 100)
            
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}

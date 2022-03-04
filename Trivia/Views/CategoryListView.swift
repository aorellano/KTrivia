//
//  CategoryListView.swift
//  Trivia
//
//  Created by Alexis Orellano on 3/2/22.
//

import SwiftUI

struct CategoryListView: View {
    var groups = ["Twice", "Blackpink", "Bts", "Stray Kids", "Stayc", "All"]
    var body: some View {
    
        VStack {
            List {
                ForEach(groups, id: \.self) { group in
                    ZStack {
                        NavigationLink(destination: QuestionView(groupName: group)
                                        .environmentObject(TriviaManager())
                        ){
                            EmptyView()
                        }.opacity(0)
                        RoundedRectangle(cornerRadius: 10)
                        
                            .fill(.white)
                            .frame(height: 80)

                            .shadow(radius: 8)
                            .overlay(
                                Text(group)
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                            )
                            
                            .padding(EdgeInsets(top:5, leading: -10, bottom: 0, trailing: -10))
                    }
            }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }
            
            .onAppear {
                UITableView.appearance().backgroundColor = .clear
                UITableView.appearance().showsVerticalScrollIndicator = false
            }
        }
    }
}

struct ContentView_Preiews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}

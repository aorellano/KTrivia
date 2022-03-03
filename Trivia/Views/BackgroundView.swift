//
//  BackgroundView.swift
//  Trivia
//
//  Created by Alexis Orellano on 3/2/22.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
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
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}

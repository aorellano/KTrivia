//
//  BackgroundView.swift
//  Trivia
//
//  Created by Alexis Orellano on 3/2/22.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Image("background2")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .ignoresSafeArea()
            
        }
        .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}

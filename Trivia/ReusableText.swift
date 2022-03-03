//
//  ReusableText.swift
//  Trivia
//
//  Created by Alexis Orellano on 3/1/22.
//

import Foundation
import SwiftUI

struct ReusableText: View {
    var text: String
    var size: Int
    var body: some View {
        Text("Choose Group")
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .foregroundColor(.white)
    }
}

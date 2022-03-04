//
//  QuestionView.swift
//  Trivia
//
//  Created by Alexis Orellano on 3/2/22.
//

import SwiftUI

struct QuestionView: View {
    var groupName: String
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(spacing: 40) {
                HStack {
                    ReusableText(text: groupName, size: 30)
                    Spacer()
                    Text("1 out of 5")
                        .foregroundColor(.white)
                }
                
                ProgressBar(progress: 40)
                VStack(alignment: .leading, spacing: 20) {
                    Text("What was the name of Twice's first album?")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                    
                    AnswerRow(answer: Answer(text: "Scientist", isCorrect: false))
                    AnswerRow(answer: Answer(text: "Twicetagram", isCorrect: true))
                    AnswerRow(answer: Answer(text: "Formula of Love: 0+T=<3", isCorrect: false))
                    AnswerRow(answer: Answer(text: "Eyes Wide Open", isCorrect: false))
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(groupName: "name")
    }
}

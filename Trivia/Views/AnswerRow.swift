//
//  AnswerRow.swift
//  Trivia
//
//  Created by Alexis Orellano on 3/2/22.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var triviaManager: TriviaManager
    var answer: Answer
    @State private var backgroundColor = Color.white
    @State private var isSelected = false

    var body: some View {
        HStack(spacing: 20) {
            Text(answer.text)
                .fontWeight(.semibold)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(Color.black)
        .background(triviaManager.answerSelected ? (isSelected ? (answer.isCorrect ? .green: .red) : .white) : .white)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !triviaManager.answerSelected {
                isSelected = true
                triviaManager.selectAnswer(answer: answer)
            }
            isSelected = true
            triviaManager.goToNextQuestion()
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "hi", isCorrect: false))
            .environmentObject(TriviaManager())
    }
}

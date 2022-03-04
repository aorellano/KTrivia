//
//  QuestionView.swift
//  Trivia
//
//  Created by Alexis Orellano on 3/2/22.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    
    var groupName: String
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(spacing: 40) {
                HStack {
                    ReusableText(text: groupName, size: 20)
                    Spacer()
                    Text("\(triviaManager.index + 1) out of \(triviaManager.length)")
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                }
                
                .padding(.top, 20)
            
                
                ProgressBar(progress: triviaManager.progress)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(triviaManager.question)
                        .foregroundColor(.white)
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                    Spacer()
                    
                    ForEach(triviaManager.answerChoices, id: \.id) { answer in
                        AnswerRow(answer: answer)
                            .environmentObject(triviaManager)
                    }
  
                }
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarHidden(true)
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(groupName: "Group Name")
            .environmentObject(TriviaManager())
    }
}

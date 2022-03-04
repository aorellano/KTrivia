//
//  Trivia.swift
//  Trivia
//
//  Created by Alexis Orellano on 3/3/22.
//

import Foundation

struct Trivia: Decodable {
    var results: [Result]
    
    struct Result: Decodable, Identifiable {
        var id: Int
        var category: String
        var type: String
        var question: String
        var correct: String
        var incorrectAnswers: [String]
        
        var formattedQuestion: AttributedString {
            do {
                return try AttributedString(markdown: question)
            } catch {
                print("Error setting formattedQuestion: \(error)")
                return ""
            }
        }
        
        var answers: [Answer] {
            do {
                let correctAnswer = [Answer(text: try AttributedString(markdown: correct), isCorrect: true)]
                let incorrects = try incorrectAnswers.map { answer in
                    Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                }
                let allAnswers = correctAnswer + incorrects
                return allAnswers.shuffled()
                    
            } catch {
                print("Error setting answers: \(error)")
                return []
            }
        }
    }
    

}

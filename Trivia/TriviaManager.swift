//
//  TriviaManager.swift
//  Trivia
//
//  Created by Alexis Orellano on 3/1/22.
//

import Foundation
import SwiftUI

class TriviaManager: ObservableObject {
    private(set) var trivia: [Trivia.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score = 0
    
    init() {
        Task.init {
            await fetchTrivia()
        }
    }
    
    func fetchTrivia() async {
        
        let jsonData = readLocalJSONFile(forName: "TriviaQuestions")
        if let data = jsonData {
            if let trivia = parse(jsonData: data) {
                print(trivia)
            }
        }
       
  
    }
    
    func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    func parse(jsonData: Data) -> Trivia? {
        do {

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Trivia.self, from: jsonData)
            print("data \(decodedData)")
            
            DispatchQueue.main.async {
                self.trivia = decodedData.results
                self.length = self.trivia.count
                self.setQuestion()
                
            }
        } catch {
            print("Error fetching trivia: \(error)")
            
        }
        return nil
    }
    
    
    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length) * 350)
        
        if index < length {
            let currentTriviaQuestion = trivia[index]
            question = currentTriviaQuestion.question
            answerChoices = currentTriviaQuestion.answers
        }
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
}

/* Create data to be saved
let myString = “Saving data with FileManager is easy!”
guard let data = myString.data(using: .utf8) else {
    print(“Unable to convert string to data”)
    return
}
 Save the data
do {
 try data.write(to: fileURL)
 print(“File saved: \(fileURL.absoluteURL)”)
} catch {
 Catch any errors
 print(error.localizedDescription)
}
*/

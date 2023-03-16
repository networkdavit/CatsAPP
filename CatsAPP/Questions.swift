//
//  Questions.swift
//  CatsAPP
//
//  Created by Davit Hayrapetyan on 16.03.23.
//

import Foundation

struct Questions: Identifiable, Decodable {
    let id: Int
    let text: String
    let imageURL: String
    let answers: [String]
}

struct Question {
    let text: String
    let answers: [String]
}

struct Result: Decodable {
    let id: Int
    let answer_pattern: String
    let result: String
    let imageURL: String
}

class QuestionStore: ObservableObject{
    @Published var questions = [Questions]()
    
    func loadQuestions(){
        guard let url = URL(string: "http://localhost:3000/api/v1/questions") else {
            print("Invalid URL")
            return
        }
//        guard let url = URL(string: "http://143.42.17.186:3000/api/v1/questions") else {
//            print("Invalid URL")
//            return
//        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode([Questions].self, from: data)
                DispatchQueue.main.async {
                    self.questions = decodedResponse
                    print(self.questions)
                }
                
            } catch let error {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
}

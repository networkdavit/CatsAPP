//
//  QuizView.swift
//  CatsAPP
//
//  Created by Davit Hayrapetyan on 15.03.23.
//

import SwiftUI
import URLImage

struct Question {
    let text: String
    let answers: [String]
}

struct QuizView: View {
    let questions: [Question] = [
        Question(text: "What is the capital of France?", answers: ["Paris", "London", "Berlin"]),
        Question(text: "What is the largest planet in our solar system?", answers: ["Jupiter", "Saturn", "Mars"]),
        Question(text: "What is the tallest mountain in the world?", answers: ["Mount Everest", "K2", "Makalu"])
    ]
    
    @State private var selectedAnswers = Array(repeating: -1, count: 3)
    @State private var currentQuestion = 0
    @State private var showResults = false
    
    var body: some View {
        VStack {
            if !showResults {
                QuestionView(question: questions[currentQuestion], selectedAnswer: $selectedAnswers[currentQuestion]) {
                    self.nextQuestion()
                }
            } else {
                ResultView(answers: selectedAnswers.map { index in
                    index == -1 ? "Not answered" : questions[currentQuestion].answers[index]
                }, restartAction: {
                    self.selectedAnswers = Array(repeating: -1, count: 3)
                    self.currentQuestion = 0
                    self.showResults = false
                })
            }
        }
    }
    
    private func nextQuestion() {
        if currentQuestion < questions.count - 1 {
            currentQuestion += 1
        } else {
            showResults = true
        }
    }
}

struct QuestionView: View {
    let question: Question
    @Binding var selectedAnswer: Int
    let answerAction: () -> Void
    
    var body: some View {
        VStack {
           
            
            Text(question.text)
                .font(.title)
                .padding()
            
            ForEach(0..<question.answers.count) { index in
                Button(action: {
                    self.selectedAnswer = index
                    self.answerAction()
                }) {
                    Text(question.answers[index])
                        .font(.title2)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(30)
                }
            }
        }
    }
}

struct ResultView: View {
    let answers: [String]
    let restartAction: () -> Void
    
    var body: some View {
        VStack {
            Text("Quiz Results")
                .font(.largeTitle)
                .padding()
            
            ForEach(0..<answers.count) { index in
                HStack {
                    Text("Question \(index+1):")
                        .font(.headline)
                        .padding()
                    
                    Text(answers[index])
                        .padding()
                    
                    Spacer()
                }
            }
            
            Spacer()
            
            Button(action: {
                self.restartAction()
            }) {
                Text("Restart Quiz")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}


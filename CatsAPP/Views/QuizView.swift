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
    @ObservedObject var questionStore = QuestionStore()
    @State private var selectedAnswers = Array(repeating: -1, count: 3)
    @State private var currentQuestion = 0
    @State private var showResults = false
    
    var body: some View {
        VStack {
            if !showResults {
                if questionStore.questions.count > currentQuestion {
                    QuestionView(question: questionStore.questions[currentQuestion], selectedAnswer: $selectedAnswers[currentQuestion]) {
                        self.nextQuestion()
                    }
                } else {
                    Text("Loading...")
                        .font(.title)
                        .padding()
                }
            } else {
                ResultView(questionStore: questionStore, selectedAnswers: selectedAnswers, restartAction: {
                    self.selectedAnswers = Array(repeating: -1, count: 3)
                    self.currentQuestion = 0
                    self.showResults = false
                })
            }
        }
        .onAppear {
            self.questionStore.loadQuestions()
        }
    }
    
    private func nextQuestion() {
        if currentQuestion < questionStore.questions.count - 1 {
            currentQuestion += 1
        } else {
            showResults = true
        }
    }
}

struct QuestionView: View {
    let question: Questions
    @Binding var selectedAnswer: Int
    let answerAction: () -> Void
    
    var body: some View {
        VStack {
            URLImage(URL(string: question.imageURL)!) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
            }
            .padding()
            
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
    let questionStore: QuestionStore
    let selectedAnswers: [Int]
    let restartAction: () -> Void
    var results: String {
            var string = ""
            for index in selectedAnswers.indices {
                string.append("\(selectedAnswers[index])")
            }
            return string
        }
    
    var body: some View {
        VStack {
            Text("Quiz Results")
                .font(.largeTitle)
                .padding()
            
            ForEach(0..<selectedAnswers.count) { index in
                let question = questionStore.questions[index]
                let selectedAnswerIndex = selectedAnswers[index]
                
                HStack {
                    Text("Question \(index+1):")
                        .font(.headline)
                        .padding()
                    
                    if selectedAnswerIndex >= 0 {
                        Text(question.answers[selectedAnswerIndex])
                            .padding()
                    } else {
                        Text("Not answered")
                            .padding()
                    }
                    
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
        Button(action: {
            getResult()
                }) {
                    Text("Get the Result")
                }
    }
    
    func getResult(){
        let alert = UIAlertController(title: "Alert", message: "\(results)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
}


struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}


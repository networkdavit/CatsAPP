//
//  QuizView.swift
//  CatsAPP
//
//  Created by Davit Hayrapetyan on 15.03.23.
//

import SwiftUI
import URLImage


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
    
    @State private var message: String = ""
    
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
            Text(message)
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
        .onAppear {
            getResult()
        }

    }
    
    func getResult() {
        let urlString = "http://localhost:3000/api/v1/questions/result?answer_id=\(results)"
        print(urlString, "URL STRING")
        guard let url = URL(string: urlString) else {
            print("Error: cannot create URL")
            return
        }

        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if error != nil || data == nil {
                print("Error: No data was retrieved from the URL")
                return
            }

            do {
                print(String(data: data!, encoding: .utf8))

                let decoder = JSONDecoder()
                let result = try decoder.decode(Result.self, from: data!)
                let message = result.result
                self.message = result.result

            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                return
            }
        })

        task.resume()
    }
}


struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}


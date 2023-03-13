//
//  Advice.swift
//  CatsAPP
//
//  Created by Davit Hayrapetyan on 11.03.23.
//

import Foundation

struct Advice: Identifiable, Decodable {
    let id: Int
    let title: String
    let description: String
}

//class AdviceStore: ObservableObject {
//    @Published var advice = [
//        Advice(id: 1, title: "Persian", description: "The Persian cat is a long-haired breed of cat characterized by its round face and short muzzle. It is also known as the 'Persian Longhair' in the English-speaking countries."),
//        Advice(id: 2, title: "Siamese", description: "The Siamese cat is a breed of domestic cat that originated in Thailand. It is characterized by its blue eyes and distinctive color-point coat.")
//    ]
//}


class AdviceStore: ObservableObject {
    @Published var advice = [Advice]()
    
    func loadAdvice() {
        guard let url = URL(string: "http://localhost:3000/api/v1/advice") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode([Advice].self, from: data)
                DispatchQueue.main.async {
                    self.advice = decodedResponse
                }
            } catch let error {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}

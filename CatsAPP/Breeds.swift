//
//  Breeds.swift
//  CatsAPP
//
//  Created by Davit Hayrapetyan on 11.03.23.


import Foundation
import URLImage

struct Breed: Identifiable, Decodable {
    let id: Int
    let title: String
    let description: String
    let age: String
    let origin: String
    let isFavorite: Int
    let pros: String
    let cons: String
    let imageURL: URL?
    let advice: String
}

class BreedStore: ObservableObject {
    @Published var breeds = [Breed]()
    
    func loadBreeds() {
        guard let url = URL(string: "http://localhost:3000/api/v1/breeds") else {
            print("Invalid URL")
            return
        }
//        guard let url = URL(string: "http://143.42.17.186:3000/api/v1/breeds") else {
//            print("Invalid URL")
//            return
//        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode([Breed].self, from: data)
                DispatchQueue.main.async {
                    self.breeds = decodedResponse
                }
                
            } catch let error {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}


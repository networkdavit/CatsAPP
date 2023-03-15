//
//  Breeds.swift
//  CatsAPP
//
//  Created by Davit Hayrapetyan on 11.03.23.
////
//import Foundation
//import URLImage
//
//
//struct Breed: Identifiable {
//    let id: Int
//    let title: String
//    let description: String
//    let age: Int
//    let origin: String
//    let isFavorite: Bool
//    let pros: String
//    let cons: String
//}
//
//class BreedStore: ObservableObject {
//    @Published var breeds = [
//        Breed(id: 1, title: "Persian", description: "The Persian cat is a long-haired breed of cat characterized by its round face and short muzzle. It is also known as the 'Persian Longhair' in the English-speaking countries.", age: 3, origin: "Iran", isFavorite: true, pros: "Affectionate, calm, good with children", cons: "Requires grooming", imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmdQ_x0sQd240X2YwTQRmqWyfMVQtLV9wBYA&usqp=CAU")),
//        Breed(id: 2, title: "Siamese", description: "The Siamese cat is a breed of domestic cat that originated in Thailand. It is characterized by its blue eyes and distinctive color-point coat.", age: 2, origin: "Thailand", isFavorite: false, pros: "Intelligent, vocal, affectionate", cons: "Can be demanding", imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmdQ_x0sQd240X2YwTQRmqWyfMVQtLV9wBYA&usqp=CAU")
//    ]
//}


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

//class BreedStore: ObservableObject {
//  @Published var breeds = [
//      Breed(id: 1, title: "Persian", description: "The Persian cat is a long-haired breed of cat characterized by its round face and short muzzle. It is also known as the 'Persian Longhair' in the English-speaking countries.", age: 3, origin: "Iran", isFavorite: true, pros: "Affectionate, calm, good with children", cons: "Requires grooming", imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmdQ_x0sQd240X2YwTQRmqWyfMVQtLV9wBYA&usqp=CAU")),
//      Breed(id: 2, title: "Siamese", description: "The Siamese cat is a breed of domestic cat that originated in Thailand. It is characterized by its blue eyes and distinctive color-point coat.", age: 2, origin: "Thailand", isFavorite: false, pros: "Intelligent, vocal, affectionate", cons: "Can be demanding", imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmdQ_x0sQd240X2YwTQRmqWyfMVQtLV9wBYA&usqp=CAU"))
//  ]
//}

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


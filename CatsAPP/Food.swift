import Foundation
import URLImage

struct Food: Identifiable, Decodable {
    let id: Int
    let brand: String
    let cat_type: String
    let reason: String
    let imageURL: URL?
}


class FoodStore: ObservableObject {
    @Published var food = [Food]()
    
    func loadFood() {
        guard let url = URL(string: "http://localhost:3000/api/v1/food") else {
            print("Invalid URL")
            return
        }
//        guard let url = URL(string: "http://143.42.17.186:3000/api/v1/food") else {
//            print("Invalid URL")
//            return
//        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode([Food].self, from: data)
                DispatchQueue.main.async {
                    self.food = decodedResponse
                }
               
            } catch let error {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}


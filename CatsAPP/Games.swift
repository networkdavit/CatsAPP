import Foundation
import URLImage

struct Games: Identifiable, Decodable {
    let id: Int
    let title: String
    let video_id: String
    let description: String
}


class GamesStore: ObservableObject {
    @Published var games = [Games]()
    
    func loadGames() {
        guard let url = URL(string: "http://localhost:3000/api/v1/games") else {
            print("Invalid URL")
            return
        }
//        guard let url = URL(string: "http://143.42.17.186:3000/api/v1/games") else {
//            print("Invalid URL")
//            return
//        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode([Games].self, from: data)
                DispatchQueue.main.async {
                    self.games = decodedResponse
                }
               
            } catch let error {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}


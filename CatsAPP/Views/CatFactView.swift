import SwiftUI

struct CatFactView: View {

    @Binding var catFact: CatFactResponse?
    @State private var isLoading = false

    var body: some View {
        Button(action: {
            isLoading = true
            fetchCatFact()
        }, label: {
            Text("Get a Random Cat Fact")
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(Color.blue)
                .cornerRadius(10)
        })
        .buttonStyle(BorderlessButtonStyle())
        .padding(.bottom, 8)
        .disabled(isLoading)
        .overlay(isLoading ? ProgressView() : nil)
    }

    func fetchCatFact() {
        guard let url = URL(string: "https://catfact.ninja/fact") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            isLoading = false
            guard let data = data else {
                print("Error fetching cat fact: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            if let factResponse = try? JSONDecoder().decode(CatFactResponse.self, from: data) {
                DispatchQueue.main.async {
                    self.catFact = factResponse
                }
            }
        }.resume()
    }
}


struct CatFactResponse: Decodable, Identifiable {
    let id = UUID()
    let fact: String
    let length: Int
}


struct CatFactView_Previews: PreviewProvider {
    static var previews: some View {
        CatFactView(catFact: .constant(nil))
    }
}

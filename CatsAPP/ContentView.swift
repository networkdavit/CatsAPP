//
//  ContentView.swift
//  CatsAPP
//
//  Created by Davit Hayrapetyan on 11.03.23.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var breedStore = BreedStore()
    @ObservedObject var adviceStore = AdviceStore()

    @State private var catFact: CatFactResponse? = nil

    let gridItems = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        TabView {
            NavigationView {
                ScrollView {
                    CatFactView(catFact: $catFact)
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ForEach(breedStore.breeds) { breed in
                            NavigationLink(destination: BreedDetailView(breed: breed)) {
                                BreedGridCellView(breed: breed)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)

                }
                .navigationTitle("Cat Breeds")
            }
            .tabItem {
                Label("Breeds", systemImage: "list.bullet")
            }

            NavigationView {
                VStack {
                    CatFactView(catFact: $catFact)
                    List(adviceStore.advice) { advice in
                        NavigationLink(destination: AdviceDetailView(advice: advice)) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(advice.title)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                    .lineLimit(2)
                                Text(advice.description)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .lineLimit(2)
                            }
                            .padding(8)
                        }
                    }
                }
                .navigationTitle("Advice for Cat Owners")

            }
            .tabItem {
                Label("Advice", systemImage: "lightbulb")
            }
        }
        .alert(item: $catFact) { fact in
            Alert(title: Text("Cat Fact"), message: Text(fact.fact), dismissButton: .default(Text("OK")))
        }
    }

    var id: String {
        return "ContentView"
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



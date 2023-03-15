//
//  ContentView.swift
//  CatsAPP
//
//  Created by Davit Hayrapetyan on 11.03.23.
//

import SwiftUI

struct ContentView: View {


    @ObservedObject var breedStore = BreedStore()
    @ObservedObject var foodStore = FoodStore()
    @ObservedObject var gamesStore = GamesStore()

    @State private var catFact: CatFactResponse? = nil

    init() {
        breedStore.loadBreeds()
        foodStore.loadFood()
        gamesStore.loadGames()
    }
    
    let gridItems = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        
        //                .frame(height: 300)
        TabView {
            NavigationView {
                ScrollView {
                    CatFactView(catFact: $catFact)
                    BreedRowView(breedStore: breedStore)
                }
                .navigationTitle("Cat Breeds")
            }
            .tabItem {
                Label("Breeds", systemImage: "list.bullet")
            }

            NavigationView {
                VStack {
                    CatFactView(catFact: $catFact)
                    FoodListView(foodStore: foodStore)
                }
                .navigationTitle("Food for your cat")
            }
            .tabItem {
                Label("Food", systemImage: "cart.fill")
            }
            NavigationView {
                VStack {
                    CatFactView(catFact: $catFact)
                    GamesListView(gamesStore: gamesStore)
                }
                .navigationTitle("Interactive games to play")
            }
            .tabItem {
                Label("Games", systemImage: "gamecontroller")
            }
            NavigationView {
                    QuizView()
            }
            .tabItem {
                Label("Quiz", systemImage: "square.stack.3d.up.fill")
            }
        }
        .alert(item: $catFact) { fact in
            Alert(title: Text("Cat Fact"), message: Text(fact.fact), dismissButton: .default(Text("Cool!")))
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



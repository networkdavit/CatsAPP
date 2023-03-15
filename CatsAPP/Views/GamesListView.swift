//
//  GamesView.swift
//  CatsAPP
//
//  Created by Davit Hayrapetyan on 15.03.23.
//

import SwiftUI

struct GamesListView: View {
    @ObservedObject var gamesStore = GamesStore()
    
    var body: some View {
        List(gamesStore.games) { game in
            NavigationLink(destination: GamesDetailView(games: game)) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(game.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    Text(game.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
            }
        }
        .navigationTitle("Interactive games to play")
    }
}


//struct GamesView_Previews: PreviewProvider {
//    static var previews: some View {
//        GamesListView()
//    }
//}

//
//  GamesDetailView.swift
//  CatsAPP
//
//  Created by Davit Hayrapetyan on 15.03.23.
//

import SwiftUI

struct GamesDetailView: View {
    let games: Games
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            YouTubePlayerView(videoID: games.video_id)
                .frame(height: 300)
            Text(games.title)
                .font(.title)
                .foregroundColor(.primary)
            Text(games.description)
                .font(.headline)
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding()
    }
}

//struct GamesDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        GamesDetailView()
//    }
//}


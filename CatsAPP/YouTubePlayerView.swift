//
//  YouTubePlayerView.swift
//  CatsAPP
//
//  Created by Davit Hayrapetyan on 15.03.23.
//

import SwiftUI
import WebKit

struct YouTubePlayerView: UIViewRepresentable {
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {
            return
        }
        
        let request = URLRequest(url: youtubeURL)
        uiView.load(request)
    }
}

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            YouTubePlayerView(videoID: "VIDEO_ID_HERE")
//                .frame(height: 300)
//        }
//    }
//}
//struct YouTubePlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        YouTubePlayerView()
//    }
//}

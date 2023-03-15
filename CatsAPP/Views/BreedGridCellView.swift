//
//  BreedGridCellView.swift
//  CatsAPP
//
//  Created by Davit Hayrapetyan on 11.03.23.
//

import SwiftUI
import URLImage

struct BreedGridCellView: View {
    let breed: Breed

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let imageURL = breed.imageURL {
                URLImage(imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 100)
                        .clipped()
                        .cornerRadius(10)
                }
            } else {
                Image(systemName: "globe")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 100)
                    .clipped()
                    .cornerRadius(10)
            }
            
            Text(breed.title)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text(breed.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
        }
        .padding(10)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
    }
}

//
//struct BreedGridCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        BreedGridCellView()
//    }
//}

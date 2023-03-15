//
//  BreedDetailView.swift
//  CatsAPP
//
//  Created by Davit Hayrapetyan on 11.03.23.
//

import SwiftUI
import URLImage

struct BreedDetailView: View {
    var breed: Breed
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let imageURL = breed.imageURL {
                    URLImage(imageURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .clipped()
                            .cornerRadius(10)
                    }
                } else {
                    Image(systemName: "globe")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 100)
                        .clipped()
                        .cornerRadius(10)
                }
                
                Text(breed.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                Text(breed.description)
                    .font(.body)
                    .foregroundColor(.gray)
                
                HStack {
                    Text("Origin:")
                        .font(.headline)
                    Spacer()
                    Text(breed.origin)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Text("Age:")
                        .font(.headline)
                    Spacer()
                    Text("\(breed.age) years old")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Pros:")
                        .font(.headline)
                    Text(breed.pros)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Cons:")
                        .font(.headline)
                    Text(breed.cons)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("Advice:")
                        .font(.headline)
                    Text(breed.advice)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding()
            .navigationBarTitle(Text(breed.title), displayMode: .inline)
        }
    }
}


//struct BreedDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        BreedDetailView(breed: Breed)
//    }
//}

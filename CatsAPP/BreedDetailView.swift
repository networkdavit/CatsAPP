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
        VStack(alignment: .leading) {
            
            if let imageURL = breed.imageURL {
                URLImage(imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
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
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.vertical, 16)
            
            Text(breed.description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 16)
            
            HStack {
                Text("Origin:")
                    .font(.headline)
                Spacer()
                Text(breed.origin)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 8)
            
            HStack {
                Text("Age:")
                    .font(.headline)
                Spacer()
                Text("\(breed.age) years old")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 8)
            
            HStack {
                Text("Pros:")
                    .font(.headline)
                Spacer()
                Text(breed.pros)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 8)
            
            HStack {
                Text("Cons:")
                    .font(.headline)
                Spacer()
                Text(breed.cons)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 16)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle(Text(breed.title), displayMode: .inline)
    }
}

//struct BreedDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        BreedDetailView()
//    }
//}

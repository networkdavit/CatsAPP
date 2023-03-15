//
//  FoodDetailView.swift
//  CatsAPP
//
//  Created by Davit Hayrapetyan on 15.03.23.
//

import SwiftUI
import URLImage

struct FoodDetailView: View {
    let food: Food
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let imageURL = food.imageURL {
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
            Text(food.brand)
                .font(.title)
                .foregroundColor(.primary)
            Text(food.cat_type)
                .font(.headline)
                .foregroundColor(.secondary)
            Text(food.reason)
                .font(.headline)
                .foregroundColor(.accentColor)
            Spacer()
        }
        .padding()
        .navigationTitle(food.brand)
    }
}

//struct FoodDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        FoodDetailView()
//    }
//}

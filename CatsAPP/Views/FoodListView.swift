//
//  FoodRowView.swift
//  CatsAPP
//
//  Created by Davit Hayrapetyan on 15.03.23.
//


import SwiftUI

struct FoodListView: View {
    @ObservedObject var foodStore = FoodStore()
    
    var body: some View {
        List(foodStore.food) { food in
            NavigationLink(destination: FoodDetailView(food: food)) {

                VStack(alignment: .leading, spacing: 8) {
                    Text(food.brand)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    Text(food.cat_type)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                    
                }
            }
        }
        .navigationTitle("Food for your cat")
    }
}


//struct FoodListView_Preview: PreviewProvider {
//    static var previews: some View {
//        FoodListView()
//    }
//}

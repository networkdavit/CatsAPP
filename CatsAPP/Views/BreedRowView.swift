//
//  ListRowView.swift
//  CatsAPP
//
//  Created by Davit Hayrapetyan on 11.03.23.
//

import SwiftUI

struct BreedRowView: View {
    @ObservedObject var breedStore: BreedStore
    let gridItems = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
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
}


//struct ListRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListRowView()
//    }
//}

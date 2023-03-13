//
//  ListRowView.swift
//  CatsAPP
//
//  Created by Davit Hayrapetyan on 11.03.23.
//

import SwiftUI

struct BreedRowView: View {
    let breed: Breed
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(breed.title)
                    .font(.headline)
                HStack {
                    Image(systemName: "clock")
                    Text("\(breed.age) years old")
                }
                HStack {
                    Image(systemName: "globe")
                    Text(breed.origin)
                }
            }
            Spacer()
            if breed.isFavorite == 1 {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
        }
    }
}


//struct ListRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListRowView()
//    }
//}

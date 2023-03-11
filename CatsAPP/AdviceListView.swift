//
//  AdviceListView.swift
//  CatsAPP
//
//  Created by Davit Hayrapetyan on 11.03.23.
//

import SwiftUI

struct AdviceListView: View {
    @ObservedObject var adviceStore = AdviceStore()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(adviceStore.advice) { advice in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(advice.title)
                            .font(.headline)
                        Text(advice.description)
                            .lineLimit(2)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal, 16)
                }
            }
            .padding(.vertical, 8)
        }
        .navigationTitle("Advice for Cat Owners")
    }
}


//struct AdviceListView_Previews: PreviewProvider {
//    static var previews: some View {
//        AdviceListView()
//    }
//}

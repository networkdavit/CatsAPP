//
//  AdviceDetailView.swift
//  CatsAPP
//
//  Created by Davit Hayrapetyan on 11.03.23.
//

import SwiftUI

struct AdviceDetailView: View {
    
    let advice: Advice
    
    var body: some View {
        VStack {
            Text(advice.title)
                .font(.title)
                .padding(.bottom, 8)
            Text(advice.description)
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 16)
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct AdviceDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        AdviceDetailView()
//    }
//}

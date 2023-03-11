//
//  Advice.swift
//  CatsAPP
//
//  Created by Davit Hayrapetyan on 11.03.23.
//

import Foundation

struct Advice: Identifiable {
    let id: Int
    let title: String
    let description: String
}

class AdviceStore: ObservableObject {
    @Published var advice = [
        Advice(id: 1, title: "Persian", description: "The Persian cat is a long-haired breed of cat characterized by its round face and short muzzle. It is also known as the 'Persian Longhair' in the English-speaking countries."),
        Advice(id: 2, title: "Siamese", description: "The Siamese cat is a breed of domestic cat that originated in Thailand. It is characterized by its blue eyes and distinctive color-point coat.")
    ]
}

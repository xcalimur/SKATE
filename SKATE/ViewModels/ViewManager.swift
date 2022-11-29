//
//  ViewManager.swift
//  SKATE
//
//  Created by Cami Mata on 11/14/22.
//

import Foundation

class ViewManager: ObservableObject {
    @Published var board = false
    @Published var clothes = false
    @Published var showCart = false
    @Published var op = 0.0
    @Published var logoScale = 1.0
    @Published var itemDetail = false
    @Published var selection = "placeholder"
    @Published var itemViewOffset = 0.0
    @Published var cart: [Skateboard] = []
    @Published var skateboards: [Skateboard] = []
    @Published var selectedBoard = Skateboard(id: 1, image: "board_1", name: "placeholder", price: "$89.99")

}

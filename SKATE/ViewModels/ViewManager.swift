//
//  ViewManager.swift
//  SKATE
//
//  Created by Cami Mata on 11/14/22.
//

import Foundation
import UIKit

class ViewManager: ObservableObject {
    @Published var board = false
    @Published var clothes = false
    @Published var showCart = false
    @Published var scaleCart = 1.0
    @Published var op = 0.0
    @Published var logoScale = 1.0
    @Published var itemDetail = false
    @Published var skateboards: [Skateboard] = []
    @Published var cart: [Skateboard] = []
    @Published var cartDictionary: [Skateboard:Int] = [:]
    @Published var selectedBoard = Skateboard(id: 1, image: "board_1", heroImage: "board_1_hero3", name: "placeholder", price: "$89.99")
    
    let widthAvailableSpace = UIScreen.main.bounds.width
    let heightAvailableSpace = UIScreen.main.bounds.height
    
    init(board: Bool = false, clothes: Bool = false, showCart: Bool = false, scaleCart: Double = 1.0, op: Double = 0.0, logoScale: Double = 1.0, itemDetail: Bool = false, skateboards: [Skateboard], cart: [Skateboard], cartDictionary: [Skateboard : Int], selectedBoard: Skateboard = Skateboard(id: 1, image: "board_1", heroImage: "board_1_hero3", name: "placeholder", price: "$89.99")) {
        self.board = board
        self.clothes = clothes
        self.showCart = showCart
        self.scaleCart = scaleCart
        self.op = op
        self.logoScale = logoScale
        self.itemDetail = itemDetail
        self.skateboards = skateboards
        self.cart = cart
        self.cartDictionary = cartDictionary
        self.selectedBoard = selectedBoard
    }
    
    func getSkateboardData() {
        do {
            let res =  try StaticJSONMapper.decode(file: "SkateboardsData", type: SkateboardDataResponse.self)
            skateboards = res.data
            dump(skateboards)
        } catch {
            print(error)
        }
    }
    
    func returnToHomeScreen() {
        op = 0.0
        logoScale = 1.0
        board = false
        showCart = false
        itemDetail = false
    }
    
    func popUpCart() {
        scaleCart = 0.7
        showCart.toggle()
        itemDetail = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.scaleCart = 1.0
        }
    }
    
    func showDetailView(board: Skateboard) {
        selectedBoard = board
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.itemDetail = true
        }
    }
    
    func addToCart(board: Skateboard) {
       //cart.append(board)
        
        cartDictionary.updateValue((cartDictionary[board] ?? 0) + 1, forKey: board)
    
        dump(cartDictionary)
    }
    
    func itemCountinCart(board: Skateboard) -> Int {
        return cart.filter{$0.id == board.id}.count
    }

}

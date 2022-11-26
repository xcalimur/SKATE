//
//  Skateboard.swift
//  SKATE
//
//  Created by Cami Mata on 11/26/22.
//

import Foundation

struct Skateboard: Identifiable {
    private let image: String
    private let name : String
    private let price : Int
    internal let id : Int
    
    init(image: String, name: String, price: Int, id: Int) {
        self.image = image
        self.name = name
        self.price = price
        self.id = id
    }
    
}

//
//  Skateboard.swift
//  SKATE
//
//  Created by Cami Mata on 11/26/22.
//

import Foundation

struct Skateboard: Codable, Hashable, Identifiable {
    let id : Int
    let image, heroImage, name, price: String
}

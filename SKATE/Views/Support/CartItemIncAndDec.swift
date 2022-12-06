//
//  CartItemIncAndDec.swift
//  SKATE
//
//  Created by Cami Mata on 12/3/22.
//

import SwiftUI

struct CartItemIncAndDec: View {
    
    @EnvironmentObject var scene : ViewManager
    
    @State var count = 1
    @State var plusSize = 1.0
    @State var minusSize = 1.0
    
    let board : Skateboard
    
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 5)
                .fill(.white)
                .shadow(radius: 3,y: 3)
                .overlay {
                    Image(systemName: "plus")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                }
                .scaleEffect(plusSize)
                .animation(.spring(dampingFraction: 0.8,blendDuration: 0.5), value: plusSize)
                .onTapGesture {
                    plusSize = 0.7
                    scene.addToCart(board: board)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        plusSize = 1.0
                    }
                }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 5)
                .fill(.black.opacity(0.1))
                .overlay {
                    Text("\(scene.cartDictionary[board] ?? 0)")
                        .foregroundColor(.gray)
                }
            
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 5)
                .fill(scene.cartDictionary[board] == 1 ? .red: .white)
                .shadow(radius: 3,y:3)
                .overlay {
                    Image(systemName: "minus")
                        .font(.system(size: 20))
                        .foregroundColor(scene.cartDictionary[board] == 1 ? .white: .gray)
                }
                .scaleEffect(minusSize)
                .animation(.spring(dampingFraction: 0.8,blendDuration: 0.5), value: scene.cartDictionary[board])
                .animation(.spring(dampingFraction: 0.8,blendDuration: 0.5), value: minusSize)
                .onTapGesture {
                    minusSize = 0.7
                    if scene.cartDictionary[board] == 1 {
                        scene.cartDictionary.removeValue(forKey: board)
                    } else {
                        scene.cartDictionary.updateValue((scene.cartDictionary[board] ?? 0) - 1, forKey: board)
                        
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        minusSize = 1.0
                    }
                }
        }
    }
}

struct CartItemIncAndDec_Previews: PreviewProvider {
    static var previews: some View {
        CartItemIncAndDec(board: Skateboard(id: 1, image: "board_1", heroImage: "board_1_hero", name: "Almost Radiate", price: "$90"))
            .environmentObject(ViewManager(skateboards: [], cart: [], cartDictionary: [:]))
    }
}

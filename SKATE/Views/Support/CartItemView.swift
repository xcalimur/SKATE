//
//  CartItemView.swift
//  SKATE
//
//  Created by Cami Mata on 12/3/22.
//

import SwiftUI

struct CartItemView: View {
    
    @EnvironmentObject var scene : ViewManager
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing:0) {
                ForEach(scene.cart, id: \.id) {board in
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .frame(height: 100)
                        .frame(maxWidth: scene.widthAvailableSpace,
                               minHeight: 100)
                        .padding()
                        .shadow(radius: 10)
                        .overlay {
                            HStack {
                                
                                Image(systemName: "gear")
                                    .font(.system(size: 50))
                                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                                
                                VStack(spacing: 0) {
                                    
                                    Text(board.name)
                                        .font(.subheadline)
                                    
                                    Divider()
                                        .padding([.top,.bottom], 10)
                                    
                                    CartItemIncAndDec(board: board)
                                        
                                    
                                    
                                }
                                .padding()
                            }
                            .padding()
                        }
                }
            }
        }
    }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView()
            .environmentObject(ViewManager(cart: [Skateboard(id: 1, image: "board_1", heroImage: "board_1_hero", name: "Almost Radiate", price: "$90"),Skateboard(id: 1, image: "board_1", heroImage: "board_1_hero", name: "Almost Radiate", price: "$90")], skateboards: []))
    }
}

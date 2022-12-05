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
                
                Divider()
                
                ForEach(scene.cart, id: \.id) {board in
                   
                    VStack(spacing: 0) {
                        
                        HStack {
                            
                            Image(board.heroImage)
                                .resizable()
                                .scaledToFill()
                                .padding([.top,.bottom,.trailing])
                                .onTapGesture {
                                    scene.popUpCart()
                                    scene.showDetailView(board: board)
                                }
                            
                            VStack(spacing: 0) {
                                Spacer()
                                Text(board.name)
                                    .font(.subheadline)
                                    
                                Spacer()
                                Divider()
                                    .padding([.top,.bottom], 10)
                                Spacer()
                                
                                CartItemIncAndDec(board: board)
                                    .padding([.bottom,.trailing,.leading])
                                
                                Spacer()

                            }
                            .padding(.trailing)
                            
                            
                        }
                        
                        
                        
                        Divider()
                    }
                        
                       
                }
            }
        }
    }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView()
            .environmentObject(ViewManager(cart: [Skateboard(id: 1, image: "board_1", heroImage: "board_1_hero", name: "Almost Radiate", price: "$90"),Skateboard(id: 2, image: "board_1", heroImage: "board_3_hero", name: "Almost Radiate", price: "$90")], skateboards: []))
    }
}

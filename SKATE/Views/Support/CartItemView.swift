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
                
                ForEach(Array(scene.cartDictionary.keys), id: \.id) { key in
                    VStack(spacing: 0) {
                        
                        HStack {
                            
                            Image(key.heroImage)
                                .resizable()
                                .scaledToFill()
                                .padding([.top,.bottom,.trailing])
                                .onTapGesture {
                                    scene.popUpCart()
                                    scene.showDetailView(board: key)
                                }
                            
                            VStack(spacing: 0) {
                                Spacer()
                                Text(key.name)
                                    .font(.subheadline)
                                    
                                Spacer()
                                Divider()
                                    .padding([.top,.bottom], 10)
                                Spacer()
                                
                                CartItemIncAndDec(board: key)
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
            .environmentObject(ViewManager(skateboards: [], cart: [], cartDictionary: [Skateboard(id: 1, image: "board_1", heroImage: "board_1_hero", name: "Brand Name", price: "$99.99"):1]))
    }
}

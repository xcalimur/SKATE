//
//  CartView.swift
//  SKATE
//
//  Created by Cami Mata on 11/27/22.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var scene : ViewManager
    
    var body: some View {
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                Image(systemName: "line.3.horizontal.decrease")
                     .font(.system(size: 20))
                     .opacity(0.7)
                     .padding()
                     .onTapGesture {
                         scene.showCart.toggle()
                     }
                
                VStack (alignment: .leading){
                    Text("Cart")
                        .font(Font.title.bold())
                        .padding([.leading,.trailing])
                    
                    Text("\(scene.cart.count) items")
                        .font(.caption)
                        .padding([.leading,.trailing])
                    
                    CartItemView()
                    
                    Spacer()
                    RoundedRectangle(cornerRadius: 15)
                        .fill(scene.cartDictionary == [:] ? .gray : .red)
                        .frame(maxWidth: .infinity, maxHeight: 70)
                        .shadow(radius: 10)
                        .animation(.spring(dampingFraction: 0.8,blendDuration: 0.5), value: scene.cartDictionary)
                        .overlay {
                            Text("Check Out")
                                .font(Font.headline.bold())
                                .foregroundColor(Color.white)
                                .shadow(color: .white, radius: 2)
                        }
                        .padding()
                        .padding()
                }

                Spacer()
                
            }
            
        }
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(ViewManager(skateboards: [], cart: [], cartDictionary: [:]))
    }
}

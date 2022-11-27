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
                //Spacer()
                VStack (alignment: .leading){
                    Text("Cart")
                        .font(Font.title.bold())
                    
                    Text("\(scene.cart.count) items")
                        .font(.caption)
                    
                    Divider()
                    Spacer()
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.secondary)
                        .frame(maxWidth: .infinity, maxHeight: 70)
                        .shadow(radius: 10)
                        .overlay {
                            Text("Check out")
                                .font(Font.headline.bold())
                                .foregroundColor(Color.white)
                                .shadow(color: .white, radius: 2)
                        }
                        .padding(.top, 10)
                }
                .padding([.bottom,.leading,.trailing])
                
                
                
                Spacer()
                
            }
            
        }
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(ViewManager())
    }
}

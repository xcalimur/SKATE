//
//  ItemDetailView.swift
//  SKATE
//
//  Created by Cami Mata on 11/19/22.
//

import SwiftUI

struct ItemDetailView: View {
    @EnvironmentObject var scene : ViewManager
    
    var item : Skateboard
    
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
                        scene.itemDetail = false
                    }
                
                Spacer()
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                
               Spacer()
                VStack(alignment: .leading) {
                    
                    Text(item.name)
                        .font(.headline)
                    Text("item #")
                        .font(.subheadline)
                    Divider()
                    HStack {
                        Text(item.price)
                        Spacer()
                        Text("size : 8.25")
                    }
                 
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.red)
                        .frame(maxWidth: .infinity, maxHeight: 70)
                        .shadow(radius: 10)
                        .overlay {
                            Text("Add To Cart")
                                .font(Font.headline.bold())
                                .foregroundColor(Color.white)
                                .shadow(color: .white, radius: 2)
                        }
                        .padding(.top, 10)
                        .onTapGesture {
                            scene.addToCart(board: item)
                        }
                  

                }
                .padding()
                
                Spacer()
            }
            
            
        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView( item: Skateboard(id: 1, image: "board_1", heroImage: "board_1_hero3", name: "Almost", price: "$89.99"))
            .environmentObject(ViewManager(skateboards: [], cart: [], cartDictionary: [:]))
    }
}

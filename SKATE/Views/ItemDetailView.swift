//
//  ItemDetailView.swift
//  SKATE
//
//  Created by Cami Mata on 11/19/22.
//

import SwiftUI

struct ItemDetailView: View {
    @EnvironmentObject var scene : ViewManager
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack {
            
               Image(systemName: "line.3.horizontal.decrease")
                    .font(.system(size: 20))
                    .padding()
                    .onTapGesture {
                        scene.itemDetail.toggle()
                    }
                
                Spacer()
                Image("board_1")
                    .resizable()
                    .scaledToFit()
                
               Spacer()
                VStack(alignment: .leading) {
                    
                    Text("Board Title Name")
                        .font(.headline)
                    Text("item #")
                        .font(.subheadline)
                    Divider()
                    HStack {
                        Text("$89.99")
                        Spacer()
                        Text("size : 8.25")
                    }
                 
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.red)
                        .frame(maxWidth: .infinity, maxHeight: 70)
                        .shadow(radius: 10)
                        .overlay {
                            Text("Add To Bag")
                                .font(Font.headline.bold())
                                .foregroundColor(Color.white)
                                .shadow(color: .white, radius: 2)
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
        ItemDetailView()
            .environmentObject(ViewManager())
    }
}

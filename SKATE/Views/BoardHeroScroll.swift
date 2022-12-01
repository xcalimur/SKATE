//
//  BoardHeroScroll.swift
//  SKATE
//
//  Created by Cami Mata on 11/30/22.
//

import SwiftUI

struct BoardHeroScroll: View {
    
    @EnvironmentObject var scene : ViewManager
    
    @State var avaliableSpace = UIScreen.main.bounds.width
    
    @State var scaleCart = 1.0
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 11) {
                ForEach(scene.skateboards, id: \.id) {board in
                 
                    Image(board.heroImage)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: avaliableSpace)
                        .padding(.trailing,60)
                        .shadow(radius: 5)
                        .onTapGesture {
                            
                            scene.selectedBoard = board
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                scene.itemDetail = true
                            }
                            
                        }
                  
                }
            }
            .padding(.bottom,5)
        }
       
    }
    
}

struct BoardHeroScroll_Previews: PreviewProvider {
    static var previews: some View {
        BoardHeroScroll()
            .environmentObject(ViewManager())
    }
}

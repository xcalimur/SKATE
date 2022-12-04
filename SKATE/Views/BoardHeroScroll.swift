//
//  BoardHeroScroll.swift
//  SKATE
//
//  Created by Cami Mata on 11/30/22.
//

import SwiftUI

struct BoardHeroScroll: View {
    
    @EnvironmentObject var scene : ViewManager
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 11) {
                ForEach(scene.skateboards, id: \.id) {board in
                 
                    Image(board.heroImage)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: scene.widthAvailableSpace)
                        .padding(.trailing,60)
                        .shadow(radius: 5)
                        .onTapGesture {
                            scene.showDetailView(board: board)
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
            .environmentObject(ViewManager(cart: [], skateboards: []))
    }
}

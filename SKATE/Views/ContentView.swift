//
//  ContentView.swift
//  SKATE
//
//  Created by Cami Mata on 11/13/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var scene : ViewManager
    @Namespace var namespace
    
    var body: some View {
        VStack {
            ZStack {
                
                Image("skater")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(edges: .all)
                
                    
                
                VStack {
                    Image("skatelogo")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 150*scene.logoScale)
                        .scaleEffect(scene.logoScale)
                        .onTapGesture {
                            withAnimation(.spring(blendDuration: 1.0)){
                                scene.op = 0.0
                                scene.buy = false
                                scene.logoScale = 1.0
                                scene.logoOffset = -20
                            }
                        }

                    if !scene.buy {
                        HomeView()
                            
                    } else {
                        BoardView()
                    }

                }
            }
    
        }
        .environmentObject(scene)
 
    }
}

struct ContentView_Previews: PreviewProvider {
    
   
    
    static var previews: some View {
        ContentView()
            .environmentObject(ViewManager())
            
    }
}


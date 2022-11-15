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
                
                ImageSlider()
                    .ignoresSafeArea()
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

                
                    
                
                VStack {
                        Image("skatelogo")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 150*scene.logoScale)
                            .scaleEffect(scene.logoScale)
                            .onTapGesture {
                                withAnimation(.spring(blendDuration: 1.0)){
                                    scene.op = 0.0
                                    scene.board = false
                                    scene.logoScale = 1.0
                                    scene.logoOffset = -20
                                }
                        }
                        
                  

                    if !scene.board{
                        Spacer()
                        HomeView()
                            .frame(maxWidth: .infinity, maxHeight: 100)
                            
                            
                    } else {
                        BoardView()
                            //.padding([.trailing, .leading])
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


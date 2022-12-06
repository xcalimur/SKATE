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
                
                
                VStack {
                    HStack(spacing: 100) {
                        Image("skatelogo")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 150*scene.logoScale)
                            .scaleEffect(scene.logoScale)
                            .onTapGesture {
                                withAnimation(.spring(blendDuration: 1.0)){
                                    scene.returnToHomeScreen()
                                }
                            }
                        
                        if scene.board {
                            
                            Image(systemName: "bag.circle")
                                .font(.system(size: 50))
                                .padding(.trailing,30)
                                .foregroundColor(.red)
                                .opacity(scene.op)
                                .scaleEffect(scene.scaleCart)
                                .animation(.spring(dampingFraction: 0.8,blendDuration: 0.5), value: scene.scaleCart)
                                .onTapGesture {
                                    scene.popUpCart()
                                }
                        }
                        
                    }
                    
                    if !scene.board{
                        Spacer()
                        HomeView()
                            .frame(maxWidth: .infinity, maxHeight: 130)
                            .padding([.trailing,.leading], 15)
                        
                        
                    } else {
                        BoardView()
                    }
                    
                }
            }
            
        }
        .environmentObject(scene)
        .onAppear {
            scene.getSkateboardData()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
   
    
    static var previews: some View {
        ContentView()
            .environmentObject(ViewManager(skateboards: [], cart: [], cartDictionary: [:]))
            
    }
}

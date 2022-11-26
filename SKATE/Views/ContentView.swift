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
    
    @State var swipe = false
    
    var body: some View {
        VStack {
            ZStack {
                
                ImageSlider()
                    .ignoresSafeArea()
  
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

extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

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
    @State var scaleCart = 1.0
    
    
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
                                    scene.op = 0.0
                                    scene.logoScale = 1.0
                                    scene.board = false
                                    scene.showCart = false
                                    scene.itemDetail = false
                                    }
                        }
                        
                        if scene.board {
                            
                            Image(systemName: "bag.circle")
                                .font(.system(size: 50))
                                .padding(.trailing,30)
                                .foregroundColor(.red)
                                .opacity(scene.op)
                                //.shadow(color: .red, radius: 5)
                                .scaleEffect(scaleCart)
                                .animation(.spring(dampingFraction: 0.8,blendDuration: 0.5), value: scaleCart)
                                .onTapGesture {
                                    scaleCart = 0.7
                                    scene.showCart.toggle()
                                    scene.itemDetail = false
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                        scaleCart = 1.0
                                    }
                                }
                                
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

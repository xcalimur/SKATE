//
//  HomeView.swift
//  SKATE
//
//  Created by Cami Mata on 11/14/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var scene : ViewManager
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white)
                .mask(LinearGradient(gradient: Gradient(colors: [.black, .clear, .clear, .clear]), startPoint: .bottom, endPoint: .top))
            .ignoresSafeArea(edges: .bottom)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    Circle()
                        .foregroundColor(.white)
                        .shadow(radius: 15)
                        .padding()
                        .frame(width:120)
                        .overlay {
                            Image(systemName: "banknote")
                                .font(.system(size: 40))
                                .foregroundColor(.red)
                        }
                        .onTapGesture {
                            withAnimation(.spring(blendDuration: 1.0)){
                                scene.buy.toggle()
                                scene.logoScale = 0.7
                                scene.logoOffset = -50
                            }
                            
                        }
                    
                    Spacer()
                    Spacer()
                    
                    Circle()
                        .foregroundColor(.white)
                        .shadow(radius: 15)
                        .padding()
                        .frame(width:120)
                        .overlay {
                            Image(systemName: "bag.badge.plus")
                                .font(.system(size: 40))
                                .foregroundColor(.red)
                        }
                    
                    Spacer()
                  
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ViewManager())
    }
}

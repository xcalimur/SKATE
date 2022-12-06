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
                
                HStack {
                  
                    ButtonFormat(buttonSize: 120, iconSize: 45, imageName: "bandage", action: Actions.board)
                    
                    Spacer()
             
                    ButtonFormat(buttonSize: 120, iconSize: 40, imageName: "bag.badge.plus", action: Actions.cart)

                }
                .padding([.leading,.trailing])
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ViewManager(skateboards: [], cart: [], cartDictionary: [:]))
            .background(.gray)
            .previewLayout(.fixed(width: 500, height: 200))
    }
}

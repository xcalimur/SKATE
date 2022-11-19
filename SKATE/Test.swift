//
//  MainView.swift
//  SKATE
//
//  Created by Cami Mata on 11/13/22.
//

import SwiftUI

struct Test: View {
    
    @State var swipe = false
    
    var body: some View {
        ZStack {
            ImageSlider()
                .ignoresSafeArea()
                .if(swipe) { view in
                    view
                        .offset(y: -500)
                        
                }
                .animation(.easeInOut, value: swipe)
                .transition(.move(edge: .bottom))
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                    .onEnded({ value in
                                        
                                        if value.translation.height < 0 {
                                            swipe = true
                                        }

                                        if value.translation.height > 0 {
                                            swipe = false
                                        }
                                    }))
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}

//
//  ButtonFormat.swift
//  SKATE
//
//  Created by Cami Mata on 11/14/22.
//

import SwiftUI

struct ButtonFormat: View {
    
    @EnvironmentObject var scene : ViewManager
    
    var buttonSize : CGFloat
    var iconSize : CGFloat
    var imageName : String
    var action : Actions
    
    var body: some View {
        Circle()
            .foregroundColor(.white)
            .shadow(radius: 10)
            //.padding()
            .frame(width: buttonSize)
            .overlay {
                Image(systemName: imageName)
                    .font(.system(size: iconSize))
                    .foregroundColor(.red)
            }
            .onTapGesture {
                withAnimation(.spring(blendDuration: 1.0)){
                    if action == Actions.board {
                        scene.board.toggle()
                    } else if action == Actions.clothes {
                        scene.clothes.toggle()
                    }
                    scene.logoScale = 0.7
                }
                
            }
    }
}

struct ButtonFormat_Previews: PreviewProvider {
    
    var test = false
    
    static var previews: some View {
        ButtonFormat(buttonSize: 120, iconSize: 40, imageName: "banknote", action: Actions.board)
            .environmentObject(ViewManager())
    }
}

//
//  BoardView.swift
//  SKATE
//
//  Created by Cami Mata on 11/14/22.
//

import SwiftUI

struct BoardView: View {
    
    @EnvironmentObject var scene : ViewManager
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(),spacing: 10), GridItem(.flexible(),spacing: 10)],spacing: 20) {
                ForEach(0...5, id: \.self) {_ in
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.ultraThinMaterial)
                        //.padding([.trailing,.leading], 20)
                        .frame(height: 250)
                        .opacity(scene.op)
                        .overlay {
                            VStack {
                                Image("board_1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .opacity(scene.op)
                                
                                Text("Brand Name")
                                    .font(.headline)
                                    .opacity(scene.op)
                                Text("$40")
                                    .font(.subheadline)
                                    .opacity(scene.op)
                                
                            }
                            .padding()
                        }
                        .onAppear {
                            withAnimation(.spring(blendDuration: 1.0)) {
                                scene.op = 1.0
                            }
                        }
                       
                }
                
            }
        }
       
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
            .environmentObject(ViewManager())
    }
}

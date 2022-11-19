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
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.flexible(),spacing: 10), GridItem(.flexible(),spacing: 10)],spacing: 20) {
                ForEach(0...5, id: \.self) {_ in
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.ultraThinMaterial)
                        .padding([.trailing,.leading], 20)
                        .padding([.top,.bottom])
                        .frame(height: 280)
                        .opacity(scene.op)
                        .overlay {
                            VStack {
                                Spacer()
                                Image("board_1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .opacity(scene.op)
                                Spacer()
                                Text("Brand Name")
                                    .foregroundColor(.black)
                                    .opacity(0.7)
                                    .font(.headline)
                                    .opacity(scene.op)
                                
                                Text("$40")
                                    .foregroundColor(.black)
                                    .opacity(0.7)
                                    .font(.footnote)
                                    .opacity(scene.op)
                                Spacer()
                                
                            }
                            .padding()
                        }
                        .onAppear {
                            withAnimation(.spring(blendDuration: 2.0)) {
                                scene.op = 1.0
                            }
                        }
                        .onTapGesture {
                            scene.itemDetail.toggle()
                        }
                    
                    
                }
                
            }
        }
        
        .mask(
            LinearGradient(gradient: Gradient(stops: [ .init(color: .clear, location: 0), .init(color: .black, location: 0.03)]), startPoint: .top, endPoint: .bottom)
        )
        .mask(
            LinearGradient(gradient: Gradient(stops: [ .init(color: .clear, location: 0), .init(color: .black, location: 0.03)]), startPoint: .bottom, endPoint: .top)
        )
        
        ZStack {
            if scene.itemDetail {
                ItemDetailView()
                    .transition(.move(edge: .bottom))
                    .animation(.spring(), value: scene.itemDetail)
            }
        }
        .zIndex(2.0)
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
            .environmentObject(ViewManager())
            .background(.blue)
    }
}

//
//  BoardGridView.swift
//  SKATE
//
//  Created by Cami Mata on 11/29/22.
//
import SwiftUI

struct BoardGridView: View {
    
    @EnvironmentObject var scene : ViewManager
   
    
    var body: some View {
        
        
        
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.flexible(),spacing: 10), GridItem(.flexible(),spacing: 10)],spacing: 10) {
                ForEach(scene.skateboards, id: \.id) {board in
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.thinMaterial)
                        .frame(height: 280)
                        .opacity(scene.op)
                        .shadow(color: .black.opacity(0.5), radius: 3,y: 5)
                        .overlay {
                            VStack {
                                Spacer()
                                Image(board.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .opacity(scene.op)
                                
                                Divider()
                                Text(board.name)
                                    .foregroundColor(.black)
                                    .opacity(0.7)
                                    .font(.footnote.bold())
                                    .opacity(scene.op)
                                
                                Text(board.price)
                                    .foregroundColor(.black)
                                    .opacity(0.7)
                                    .font(.footnote)
                                    .opacity(scene.op)
                                
                            }
                            .padding()
                        }
                        .onTapGesture {
                            
                            scene.selectedBoard = board
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                scene.itemDetail = true
                            }
                            
                        }
                    
                }
                
            }
            .padding([.top,.bottom])
            .padding([.trailing,.leading], 10)
        }
        .onAppear {
            withAnimation(.spring(blendDuration: 2.0)) {
                scene.op = 1.0
            }
        }
        
        .mask(
            LinearGradient(gradient: Gradient(stops: [ .init(color: .clear, location: 0), .init(color: .black, location: 0.03)]), startPoint: .top, endPoint: .bottom)
        )
        .mask(
            LinearGradient(gradient: Gradient(stops: [ .init(color: .clear, location: 0), .init(color: .black, location: 0.03)]), startPoint: .bottom, endPoint: .top)
        )
        
        
        
        
    }
}

struct BoardGridView_Previews: PreviewProvider {
    static var previews: some View {
        BoardGridView()
            .environmentObject(ViewManager())
            .background(.gray)
    }
}



//
//  BoardView.swift
//  SKATE
//
//  Created by Cami Mata on 11/14/22.
//

import SwiftUI

struct BoardView: View {
    
    @EnvironmentObject var scene : ViewManager
    @State private var skateboards: [Skateboard] = []
    
    var body: some View {
        ZStack {
            
            
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.flexible(),spacing: 10), GridItem(.flexible(),spacing: 10)],spacing: 10) {
                    ForEach(skateboards, id: \.id) {board in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.thinMaterial)
                            .padding([.trailing,.leading], 10)
                            .padding([.top,.bottom])
                            .frame(height: 280)
                            .opacity(scene.op)
                            .overlay {
                                VStack {
                                    Spacer()
                                    Image(board.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .opacity(scene.op)
                                       
                                    Spacer()
                                    Text(board.name)
                                        .foregroundColor(.black)
                                        .opacity(0.7)
                                        .font(.headline)
                                        .opacity(scene.op)
                                    
                                    Text(board.price)
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
            
            ItemDetailView()
                .cornerRadius(20)
                .ignoresSafeArea()
                .offset(y : scene.itemDetail ? 0 : UIScreen.main.bounds.height)
                .animation(.spring( dampingFraction: 0.9, blendDuration: 1.0), value: scene.itemDetail)
            
            CartView()
                .cornerRadius(20)
                .ignoresSafeArea()
                .offset(y : scene.showCart ? 0 : UIScreen.main.bounds.height)
                .animation(.spring( dampingFraction: 0.9, blendDuration: 1.0), value: scene.showCart)
            
            
        }
        .onAppear {
            do {
                let res =  try StaticJSONMapper.decode(file: "SkateboardsData", type: SkateboardDataResponse.self)
                skateboards = res.data
            } catch {
                print(error)
            }
        }
        
            
       
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
            .environmentObject(ViewManager())
            .background(.red)
    }
}

struct SwipeToDismissModifier: ViewModifier {
    var onDismiss: () -> Void
    @State private var offset: CGSize = .zero

    func body(content: Content) -> some View {
        content
            .offset(y: offset.height)
            .animation(.interactiveSpring(), value: offset)
            .simultaneousGesture(
                DragGesture()
                    .onChanged { gesture in
                        if gesture.translation.width < 50 {
                            offset = gesture.translation
                        }
                    }
                    .onEnded { _ in
                        if abs(offset.height) > 100 {
                            onDismiss()
                        } else {
                            offset = .zero
                        }
                    }
            )
    }
}

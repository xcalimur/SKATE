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
    @State private var selectedBoard = Skateboard(id: 1, image: "board_1", name: "Almost", price: "$89.99")
    
    var body: some View {
        ZStack {
            
            
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.flexible(),spacing: 10), GridItem(.flexible(),spacing: 10)],spacing: 10) {
                    ForEach(skateboards, id: \.id) {board in
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
                                        .font(.subheadline.bold())
                                        .opacity(scene.op)
                                    
                                    Text(board.price)
                                        .foregroundColor(.black)
                                        .opacity(0.7)
                                        .font(.footnote)
                                        .opacity(scene.op)
                                    
                                }
                                .padding()
                            }
                            .onAppear {
                                
                                withAnimation(.spring(blendDuration: 2.0)) {
                                    //selectedBoard = board
                                    scene.op = 1.0
                                }
                            }
                            .onTapGesture {
                                
                                    selectedBoard = board
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                        scene.itemDetail.toggle()
                                    }

                            }
                        
                        
                    }
                    
                }
                .padding([.top,.bottom])
                .padding([.trailing,.leading], 10)
            }
            
            .mask(
                LinearGradient(gradient: Gradient(stops: [ .init(color: .clear, location: 0), .init(color: .black, location: 0.03)]), startPoint: .top, endPoint: .bottom)
            )
            .mask(
                LinearGradient(gradient: Gradient(stops: [ .init(color: .clear, location: 0), .init(color: .black, location: 0.03)]), startPoint: .bottom, endPoint: .top)
            )
            
            
            ItemDetailView(item: selectedBoard)
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
            .background(.gray)
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

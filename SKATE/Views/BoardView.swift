//
//  BoardView.swift
//  SKATE
//
//  Created by Cami Mata on 11/14/22.
//

import SwiftUI

struct BoardView: View {
    
    @EnvironmentObject var scene : ViewManager
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height
    @State var currentDragOffsetY: CGFloat = 0
    @State var endDragOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            
            
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
            
            ItemDetailView()
                .cornerRadius(15)
                .ignoresSafeArea()
                .offset(y : scene.itemDetail ? 0 : UIScreen.main.bounds.height)
                .animation(.spring( dampingFraction: 0.9, blendDuration: 1.0), value: scene.itemDetail)
            
            
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

//
//  BoardView.swift
//  SKATE
//
//  Created by Cami Mata on 11/14/22.
//

import SwiftUI

struct BoardView: View {
    
    @EnvironmentObject var scene : ViewManager

    @State var selection = 0
    
    var body: some View {
        ZStack (alignment: .bottom){
            
            TabView(selection: $selection) {
                
                    BoardGridView()
                    .background(BackgroundHelper())
                    .tabItem {
                        Label("grid", systemImage: "rectangle.split.2x2.fill")
                           
                    }
                
     
                    BoardSwipeView()
                    .background(BackgroundHelper())
                    .tabItem {
                        Label("swipe", systemImage: "rectangle.fill.on.rectangle.fill")
                           
                    }
                    
                
            }
            .shadow(radius: 10)
            .onAppear {
                UITabBar.appearance().backgroundColor = UIColor(Color.white)
            }
            .accentColor(.red)
            
            
            ItemDetailView(item: scene.selectedBoard)
                .cornerRadius(20)
                .ignoresSafeArea()
                .offset(y : scene.itemDetail ? 0 : UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 0.3), value: scene.itemDetail)
                //.animation(.spring( dampingFraction: 0.9, blendDuration: 1.0), value: scene.itemDetail)
                //.modifier(SwipeToDismissModifier(onDismiss: {}))
            
            CartView()
                .cornerRadius(20)
                .ignoresSafeArea()
                .offset(y : scene.showCart ? 0 : UIScreen.main.bounds.height)
                .animation(.spring( dampingFraction: 0.9, blendDuration: 1.0), value: scene.showCart)
            
            
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

struct BackgroundHelper: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            // find first superview with color and make it transparent
            var parent = view.superview
            repeat {
                if parent?.backgroundColor != nil {
                    parent?.backgroundColor = UIColor.clear
                    break
                }
                parent = parent?.superview
            } while (parent != nil)
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
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

//
//  BoardView.swift
//  SKATE
//
//  Created by Cami Mata on 11/14/22.
//

import SwiftUI

struct BoardView: View {
    
    @EnvironmentObject var scene : ViewManager

    @State var selection1 = 0
    
    var body: some View {
        ZStack (alignment: .bottom){
            
            TabView(selection: $selection1) {
                
                    BoardGridView()
                    .background(BackgroundHelper())
                    .tabItem {
                        Label("grid", systemImage: "rectangle.split.2x2.fill")
                           
                    }
                
     
                    BoardHeroScroll()
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
                .offset(y : scene.itemDetail ? 0 : scene.heightAvailableSpace)
                .shadow(radius: 10)
                .animation(.easeInOut(duration: 0.3), value: scene.itemDetail)
            
            CartView()
                .cornerRadius(20)
                .ignoresSafeArea()
                .offset(y : scene.showCart ? 0 : scene.heightAvailableSpace)
                .shadow(radius: 10)
                .animation(.easeInOut(duration: 0.3), value: scene.showCart)
            
            
        }
   
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
            .environmentObject(ViewManager(cart: [], skateboards: [Skateboard(id: 1, image: "board_1", heroImage: "board_1_hero", name: "Almost Radiate", price: "$90")]))
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


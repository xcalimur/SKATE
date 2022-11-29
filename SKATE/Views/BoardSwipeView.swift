//
//  BoardSwipeView.swift
//  SKATE
//
//  Created by Cami Mata on 11/28/22.
//

import SwiftUI

struct BoardSwipeView: View {
    
    @EnvironmentObject var scene : ViewManager
    
    @State var selection = 0

    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                ForEach(0...20, id: \.self){ _ in
                    Image("board_1_hero")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(.bottom,100)
                        .overlay {
                            VStack(alignment: .leading) {
                                Spacer()
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.ultraThinMaterial)
                                    .frame(width: UIScreen.main.bounds.width*0.6, height: 150)
                                    .overlay(alignment: .topLeading) {
                                        
                                        VStack(alignment: .leading) {
                                            Text("Brand Name Title")
                                            Divider()
                                            Text("$$$")
                                                .font(.caption)
                                        }
                                        .padding()
                                        
                                    }
                            }
                        }
                        
                }
                .padding(.bottom,10)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
    }
}

struct BoardSwipeView_Previews: PreviewProvider {
    static var previews: some View {
        BoardSwipeView()
            .environmentObject(ViewManager())
        
    }
}

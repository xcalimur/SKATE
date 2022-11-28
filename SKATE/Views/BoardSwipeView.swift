//
//  BoardSwipeView.swift
//  SKATE
//
//  Created by Cami Mata on 11/28/22.
//

import SwiftUI

struct BoardSwipeView: View {
    
    @State private var selectedBoard = Skateboard(id: 1, image: "board_1", name: "Almost", price: "$89.99") // fix this, selectedBoard is always default
    
    var body: some View {
        TabView(selection: $selectedBoard) {
            ForEach(0...5, id: \.self){ _ in
                RoundedRectangle(cornerRadius: .infinity)
                    .fill(.black)
                    .frame(width: UIScreen.main.bounds.width*0.9)
                    .overlay {
                        VStack {
                            Spacer()
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.gray)
                                .frame(width: UIScreen.main.bounds.width*0.9, height: 200)
                        }
                    }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct BoardSwipeView_Previews: PreviewProvider {
    static var previews: some View {
        BoardSwipeView()
        
    }
}

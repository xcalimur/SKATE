//
//  playground.swift
//  SKATE
//
//  Created by Cami Mata on 11/27/22.
//

import SwiftUI



struct playground: View {
    @State var selection = 0

    var body: some View {
        ZStack {
            TabView(selection: $selection) {
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
}

struct playground_Previews: PreviewProvider {
    static var previews: some View {
        playground()
    }
}

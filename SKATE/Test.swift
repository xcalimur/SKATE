//
//  MainView.swift
//  SKATE
//
//  Created by Cami Mata on 11/13/22.
//

import SwiftUI

struct Test: View {
    var body: some View {
        VStack {
            Image("skatelogo")
                .resizable()
                .frame(width: 200, height: 100)
                .scaleEffect(0.5)
                .scaledToFit()
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible(),spacing: 10), GridItem(.flexible(),spacing: 10)],spacing: 20) {
                    ForEach(0...5, id: \.self) {_ in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.ultraThinMaterial)
                            //.padding([.trailing,.leading], 20)
                            .frame(height: 250)
                            .overlay {
                                VStack {
                                    Image("board_1")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                  
                                    
                                    Text("Brand Name")
                                        .font(.headline)
                                      
                                    Text("$40")
                                        .font(.subheadline)
                                    
                                    
                                }
                                .padding()
                            }
                           
                    }
                    
                }
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}

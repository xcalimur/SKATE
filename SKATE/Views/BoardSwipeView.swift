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
    @State var avaliableSpace = UIScreen.main.bounds.width*0.5

    var body: some View {
        
        TabView(selection: $selection) {
            ForEach(0...10, id: \.self){ _ in
                Image("board_1_hero")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.bottom,100)
                    .offset(y:10)
                    .shadow(radius: 5)
                    .overlay {
                        VStack(alignment: .leading) {
                            Spacer()
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.white)
                                .frame(width: avaliableSpace, height: 120)
                                .shadow(radius: 10)
                                .overlay(alignment: .topLeading) {
                                    
                                    VStack(alignment: .leading) {
                                        Text("Brand Name Title")
                                            .font(.subheadline)
                                        Divider()
                                        HStack(alignment: .top) {
                                            Text("$$$")
                                                .font(.caption)
                                            Spacer()
                                            RoundedRectangle(cornerRadius: 15)
                                                .fill(.red)
                                                .frame(width: avaliableSpace * 0.3, height: 30)
                                                .overlay {
                                                    Image(systemName: "plus")
                                                        .foregroundColor(.white)
                                                }
                                        }
                                    
                                    }
                                    .padding()
                                    
                                }
                        }
                    }
                
            }
            .padding(.bottom,10)
        }
        .padding(.bottom,20)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
       
        
    }
}

struct BoardSwipeView_Previews: PreviewProvider {
    static var previews: some View {
        BoardSwipeView()
            .environmentObject(ViewManager())
            .background(.gray)
        
    }
}

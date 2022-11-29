//
//  MainView.swift
//  SKATE
//
//  Created by Cami Mata on 11/13/22.
//

import SwiftUI

struct Test: View {
    
    var body: some View {
        Text("Hello World!")
            .padding()
            .onAppear {
                print("Users Response")
                
                dump (
                    try? StaticJSONMapper.decode(file: "SkateboardsData", type: SkateboardDataResponse.self)
                )
                
               
            }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}

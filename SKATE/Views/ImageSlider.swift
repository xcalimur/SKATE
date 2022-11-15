//
//  ImageSlider.swift
//  SKATE
//
//  Created by Cami Mata on 11/14/22.
//

import SwiftUI
import UIKit

struct ImageSlider: View {
    // 1
       private let images = ["skater", "skater2", "skater3"]
       
       var body: some View {
           // 2
           TabView {
               ForEach(images, id: \.self) { item in
                    //3
                    Image(item)
                       .resizable()
                       .aspectRatio(contentMode: .fill)
                       .ignoresSafeArea(edges: .all)
               }
           }
           .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
           .onAppear {
               setupAppearance()
           }
           
       }
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.5)
      }
    
}

struct ImageSlider_Previews: PreviewProvider {
    static var previews: some View {
            // 4
            ImageSlider()
                .previewLayout(.fixed(width: 400, height: 300))
           
        }
}

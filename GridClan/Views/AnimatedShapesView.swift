//
//  AnimatedShapesView.swift
//  GridClan
//
//  Created by Nima Salehi on 11/3/25.
//🎨 7. Animated Shapes Playground

import SwiftUI

struct AnimatedShapesView: View {
    @State private var animate = false

    var body: some View {
        Circle()
            .fill(animate ? Color.purple : Color.orange)
            .frame(width: animate ? 80 : 40, height: animate ? 80 : 40)
            .shadow(radius: animate ? 10 : 2)
            .animation(.easeInOut(duration: 0.8), value: animate)
            .onAppear { animate.toggle() }
            .onTapGesture { animate.toggle() }
    }
}

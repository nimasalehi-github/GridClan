//
//  GestureOverlayView.swift
//  GridClan
//
//  Created by Nima Salehi on 11/3/25.
// 🧠 8. Playground + ML Integration View

import SwiftUI

struct GestureOverlayView: View {
    @StateObject var gridVM = GridViewModel()
    @StateObject var gestureVM = GestureRecognizerViewModel()

    var body: some View {
        VStack {
            GridView(gridVM: gridVM, gestureVM: gestureVM)
                .frame(maxWidth: .infinity, maxHeight: 400)
                .border(Color.gray)
                .gesture(
                    DragGesture().onChanged { _ in gestureVM.recognizeDrag() }
                )

            AnimatedShapesView()
                .padding()

            Text("👋 Gesture ML Playground")
                .font(.title3)
                .padding(.bottom)
        }
        .padding()
    }
}

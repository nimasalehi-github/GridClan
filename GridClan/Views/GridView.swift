//
//  GridView.swift
//  GridClan
//
//  Created by Nima Salehi on 11/3/25.
// 🧭 6. Grid View (اصلی)

import SwiftUI

struct GridView: View {
    @ObservedObject var gridVM: GridViewModel
    @ObservedObject var gestureVM: GestureRecognizerViewModel

    var body: some View {
        GeometryReader { geo in
            let cellSize = geo.size.width / CGFloat(gridVM.size)
            ZStack {
                ForEach(gridVM.grid.flatMap { $0 }, id: \.id) { cell in
                    Rectangle()
                        .stroke(Color.gray.opacity(0.3), lineWidth: 0.5)
                        .frame(width: cellSize, height: cellSize)
                        .position(
                            x: CGFloat(cell.x) * cellSize + cellSize / 2,
                            y: CGFloat(cell.y) * cellSize + cellSize / 2
                        )
                }

                ForEach(gridVM.walls) { wall in
                    Rectangle()
                        .fill(wall.color)
                        .frame(width: cellSize, height: cellSize)
                        .position(
                            x: CGFloat(wall.position.x) * cellSize + cellSize / 2,
                            y: CGFloat(wall.position.y) * cellSize + cellSize / 2
                        )
                        .onTapGesture {
                            gestureVM.recognizeTap()
                            gridVM.toggleWall(at: wall.position)
                        }
                }
            }
        }
        .overlay(
            VStack {
                Text(gestureVM.message)
                    .font(.headline)
                    .padding(.top)
                Spacer()
            }
        )
    }
}

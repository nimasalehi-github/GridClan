//
//  GameGridView.swift
//  GridClan
//
//  Created by Nima Salehi on 11/3/25.
//

import SwiftUI

struct GameGridView: View {
    @ObservedObject var vm: GameGridViewModel
    @ObservedObject var gm: GestureManager

    var body: some View {
        GeometryReader { geo in
            let cellSize = geo.size.width / CGFloat(vm.size)

            ZStack {
                // Draw grid
                ForEach(vm.grid.flatMap { $0 }, id: \.id) { cell in
                    Rectangle()
                        .stroke(Color.gray.opacity(0.3), lineWidth: 0.5)
                        .frame(width: cellSize, height: cellSize)
                        .position(
                            x: CGFloat(cell.x) * cellSize + cellSize / 2,
                            y: CGFloat(cell.y) * cellSize + cellSize / 2
                        )
                        .onTapGesture {
                            gm.onTap()
                            vm.addObject(at: cell)
                        }
                        .onLongPressGesture {
                            gm.onLongPress()
                            vm.removeObject(at: cell)
                        }
                }

                // Draw objects
                ForEach(vm.objects) { obj in
                    ObjectView(object: obj, size: cellSize)
                }
            }
        }
    }
}


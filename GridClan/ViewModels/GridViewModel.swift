//
//  GridViewModel.swift
//  GridClan
//
//  Created by Nima Salehi on 11/3/25.
//🧩 4. Grid ViewModel (مدیریت ۴۴×۴۴ گرید و دیوارها)

import SwiftUI
import Combine

final class GridViewModel: ObservableObject {
    @Published var grid: [[GridCell]] = []
    @Published var walls: [WallBlock] = []

    let size = 44

    init() {
        generateGrid()
        placeInitialWalls()
    }

    func generateGrid() {
        grid = (0..<size).map { x in
            (0..<size).map { y in GridCell(x: x, y: y) }
        }
    }

    func placeInitialWalls() {
        for _ in 0..<300 {
            let randomX = Int.random(in: 0..<size)
            let randomY = Int.random(in: 0..<size)
            let cell = grid[randomX][randomY]
            let wall = WallBlock(position: cell, color: .gray)
            walls.append(wall)
        }
    }

    func toggleWall(at cell: GridCell) {
        if let index = walls.firstIndex(where: { $0.position == cell }) {
            walls.remove(at: index)
        } else {
            walls.append(WallBlock(position: cell))
        }
    }
}

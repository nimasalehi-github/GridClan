//
//  GameGridViewModel.swift
//  GridClan
//
//  Created by Nima Salehi on 11/3/25.
//

import SwiftUI
import Combine

final class GameGridViewModel: ObservableObject {
    @Published var grid: [[GameCell]] = []
    @Published var objects: [GameObject] = []
    @Published var selectedType: ObjectType = .wall
    @Published var hintMessage: String = ""

    let size = 44

    init() {
        generateGrid()
        placeSampleWalls()
    }

    func generateGrid() {
        grid = (0..<size).map { x in
            (0..<size).map { y in GameCell(x: x, y: y) }
        }
    }

    func placeSampleWalls() {
        for _ in 0..<300 {
            let x = Int.random(in: 0..<size)
            let y = Int.random(in: 0..<size)
            let cell = grid[x][y]
            objects.append(GameObject(type: .wall, cell: cell))
        }
    }

    func addObject(at cell: GameCell) {
        guard !objects.contains(where: { $0.cell == cell }) else {
            hintMessage = "⚠️ Already occupied!"
            return
        }
        let newObj = GameObject(type: selectedType, cell: cell)
        objects.append(newObj)
        hintMessage = "✅ Added \(selectedType.rawValue)"
    }

    func removeObject(at cell: GameCell) {
        objects.removeAll(where: { $0.cell == cell })
        hintMessage = "🧹 Removed object"
    }

    func suggestSmartLayout() {
        hintMessage = "💡 Suggestion: Spread defenses evenly!"
    }
}

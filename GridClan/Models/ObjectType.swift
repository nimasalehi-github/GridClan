//
//  ObjectType.swift
//  GridClan
//
//  Created by Nima Salehi on 11/3/25.
//

import SwiftUI

enum ObjectType: String, CaseIterable {
    case wall = "Wall"
    case cannon = "Cannon"
    case statue = "Statue"
    case building = "Building"

    var color: Color {
        switch self {
        case .wall: return .gray
        case .cannon: return .red
        case .statue: return .purple
        case .building: return .brown
        }
    }

    var size: Int {
        switch self {
        case .wall: return 1
        case .cannon: return 2
        case .statue: return 2
        case .building: return 3
        }
    }
}

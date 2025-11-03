//
//  GridCell.swift
//  GridClan
//
//  Created by Nima Salehi on 11/3/25.
//⚙️ 1. Grid Model (44×44)

import Foundation
import SwiftUI

struct GridCell: Identifiable, Hashable {
    let id = UUID()
    var x: Int
    var y: Int
    var isOccupied: Bool = false
}

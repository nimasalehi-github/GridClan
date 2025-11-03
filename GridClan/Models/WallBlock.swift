//
//  WallBlock.swift
//  GridClan
//
//  Created by Nima Salehi on 11/3/25.
//🧱 2. Wall Model

import Foundation
import SwiftUI

struct WallBlock: Identifiable, Hashable {
    let id = UUID()
    var position: GridCell
    var color: Color = .gray
}

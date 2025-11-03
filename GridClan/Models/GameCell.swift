//
//  GameCell.swift
//  GridClan
//
//  Created by Nima Salehi on 11/3/25.
//

import Foundation
import SwiftUI

struct GameCell: Identifiable, Hashable {
    let id = UUID()
    var x: Int
    var y: Int
    var occupied: Bool = false
}

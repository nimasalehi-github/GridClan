//
//  GameObject.swift
//  GridClan
//
//  Created by Nima Salehi on 11/3/25.
//

import SwiftUI

struct GameObject: Identifiable, Hashable {
    let id = UUID()
    var type: ObjectType
    var cell: GameCell
}

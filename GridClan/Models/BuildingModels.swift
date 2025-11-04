//
//  BuildingModels.swift
//  GridClan
//
//  Created by Nima Salehi on 11/4/25.
//

import Foundation

struct BuildingDatabase: Codable {
    let version: String
    let updated_at: String
    var buildings: [Building]
}

struct Building: Identifiable, Codable {
    let id: String
    var name_en: String
    var name_fa: String
    var category: String
    var belongs_to: [String]
    var grid_size: GridSize
    var max_level: Int
    var description: String
    var image_url: String?
    var position: GridPosition?   // ← اضافه شد
}

struct GridSize: Codable {
    let w: Int
    let h: Int
}

struct GridPosition: Codable {
    let x: Int
    let y: Int
}

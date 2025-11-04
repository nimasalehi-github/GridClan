//
//  BuildingView.swift
//  GridClan
//
//  Created by Nima Salehi on 11/4/25.
//

import Foundation
import SwiftUI

struct BuildingView: View {
    let building: Building
    
    var body: some View {
        VStack(spacing: 2) {
            RoundedRectangle(cornerRadius: 3)
                .fill(colorForCategory(building.category))
                .frame(width: CGFloat(building.grid_size.w * 8),
                       height: CGFloat(building.grid_size.h * 8))
                .overlay(
                    Text(String(building.name_fa.prefix(2)))
                        .font(.caption2)
                        .foregroundColor(.white)
                )
            
            Text(building.name_en)
                .font(.system(size: 6))
                .foregroundColor(.primary)
        }
    }
    
    private func colorForCategory(_ category: String) -> Color {
        switch category {
        case "Core": return .orange
        case "Defense": return .red
        case "ResourceProducer": return .yellow
        case "ResourceStorage": return .blue
        case "Wall": return .gray
        case "Decoration": return .green
        default: return .purple
        }
    }
}

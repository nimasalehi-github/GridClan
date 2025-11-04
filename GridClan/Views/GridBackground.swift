//
//  GridBackground.swift
//  GridClan
//
//  Created by Nima Salehi on 11/4/25.
//

import Foundation
import SwiftUI

struct GridBackground: View {
    let gridSize: Int
    var body: some View {
        Canvas { context, size in
            let step = size.width / CGFloat(gridSize)
            for i in 0...gridSize {
                let offset = CGFloat(i) * step
                context.stroke(Path(CGRect(x: offset, y: 0, width: 0.5, height: size.height)), with: .color(.gray.opacity(0.2)))
                context.stroke(Path(CGRect(x: 0, y: offset, width: size.width, height: 0.5)), with: .color(.gray.opacity(0.2)))
            }
        }
    }
}

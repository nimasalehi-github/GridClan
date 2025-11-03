//
//  ObjectView.swift
//  GridClan
//
//  Created by Nima Salehi on 11/3/25.
//

import SwiftUI

struct ObjectView: View {
    var object: GameObject
    var size: CGFloat

    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(object.type.color)
            .frame(width: size * CGFloat(object.type.size),
                   height: size * CGFloat(object.type.size))
            .position(
                x: CGFloat(object.cell.x) * size + size / 2,
                y: CGFloat(object.cell.y) * size + size / 2
            )
            .shadow(radius: 3)
            .animation(.easeInOut(duration: 0.3), value: object.cell)
    }
}

//
//  GridBackground.swift
//  GridClan
//
//  Created by Nima Salehi on 11/4/25.
//

import SwiftUI

/// 🎯 پس‌زمینه‌ی شبکه‌ای برای نمایش زمین بازی
/// - Parameter gridSize: تعداد خانه‌ها در هر بعد (مثلاً 44)
struct GridBackground: View {
    let gridSize: Int
    
    var body: some View {
        GeometryReader { geo in
            let cellSize = geo.size.width / CGFloat(gridSize)
            Path { path in
                // خطوط عمودی
                for i in 0...gridSize {
                    let x = CGFloat(i) * cellSize
                    path.move(to: CGPoint(x: x, y: 0))
                    path.addLine(to: CGPoint(x: x, y: geo.size.height))
                }
                // خطوط افقی
                for j in 0...gridSize {
                    let y = CGFloat(j) * cellSize
                    path.move(to: CGPoint(x: 0, y: y))
                    path.addLine(to: CGPoint(x: geo.size.width, y: y))
                }
            }
            .stroke(Color.gray.opacity(0.3), lineWidth: 0.5)
        }
    }
}


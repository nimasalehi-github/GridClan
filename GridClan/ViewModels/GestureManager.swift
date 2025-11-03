//
//  GestureManager.swift
//  GridClan
//
//  Created by Nima Salehi on 11/3/25.
//

import SwiftUI

final class GestureManager: ObservableObject {
    @Published var gestureText: String = "Ready"

    func onTap() { gestureText = "Tap" }
    func onDrag() { gestureText = "Dragging..." }
    func onLongPress() { gestureText = "Long Press - Removing" }
}

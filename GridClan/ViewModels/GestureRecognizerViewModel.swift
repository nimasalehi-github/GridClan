//
//  GestureRecognizerViewModel.swift
//  GridClan
//
//  Created by Nima Salehi on 11/3/25.
// ✋ 5. Gesture Recognizer ViewModel

import SwiftUI

final class GestureRecognizerViewModel: ObservableObject {
    @Published var lastGesture: GestureType? = nil
    @Published var message: String = "Try a gesture!"

    func recognizeTap() {
        lastGesture = .tap
        message = "👆 Tap detected!"
    }

    func recognizeDrag() {
        lastGesture = .drag
        message = "👆 Drag detected!"
    }

    func recognizePinch() {
        lastGesture = .pinch
        message = "🤏 Pinch detected!"
    }

    func recognizeRotate() {
        lastGesture = .rotate
        message = "🔄 Rotation detected!"
    }
}

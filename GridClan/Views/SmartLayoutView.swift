//
//  SmartLayoutView.swift
//  GridClan
//
//  Created by Nima Salehi on 11/4/25.
//

import Foundation
import SwiftUI

/*---------------------------------------------------------
  SmartLayoutView — نمای اصلی نمایش چیدمان
  نسخه 1.0 — پشتیبانی از ChatGPT Dynamic Data + نمایش اسم/مکان
 ----------------------------------------------------------*/
struct SmartLayoutView: View {
    @StateObject private var dataProvider = DataProvider()
    @State private var selectedVillage: String = "HomeVillage"
    
    // تنظیم گرید
    let gridSize = 44
    
    var body: some View {
        VStack {
            // 🔹 انتخاب Base
            Picker("Village Type", selection: $selectedVillage) {
                Text("🏠 Home Village").tag("HomeVillage")
                Text("🔨 Builder Base").tag("BuilderBase")
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            Divider().padding(.vertical, 5)
            
            // 🔹 گرید اصلی نمایش ساختمان‌ها
            ScrollView([.horizontal, .vertical]) {
                ZStack {
                    // 1️⃣ رسم گرید
                    GridBackground(gridSize: gridSize)
                    
                    // 2️⃣ رسم ساختمان‌ها
                    ForEach(buildingsForSelectedVillage()) { building in
                        if let pos = building.position {
                            BuildingView(building: building)
                                .position(
                                    x: CGFloat(pos.x) * 16 + 8,
                                    y: CGFloat(pos.y) * 16 + 8
                                )
                        }
                    }
                }
                .frame(width: CGFloat(gridSize) * 16, height: CGFloat(gridSize) * 16)
                .background(Color.black.opacity(0.05))
                .border(Color.gray, width: 1)
            }
            .padding(.bottom)
            
            // 🔹 آخرین آپدیت
            if let date = dataProvider.lastUpdate {
                Text("آخرین بروزرسانی ChatGPT: \(date.formatted(date: .numeric, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.bottom, 4)
            }
        }
        .navigationTitle("📐 Smart Layout AI")
        .onAppear {
            Task { await dataProvider.fetchLatestData() }
        }
    }
    
    private func buildingsForSelectedVillage() -> [Building] {
        dataProvider.buildings
            .filter { $0.belongs_to.contains(selectedVillage) }
            .map { b in
                var copy = b
                copy.position = b.position ?? randomPosition()
                return copy
            }
    }
    
    private func randomPosition() -> GridPosition {
        GridPosition(x: Int.random(in: 0..<gridSize), y: Int.random(in: 0..<gridSize))
    }
}

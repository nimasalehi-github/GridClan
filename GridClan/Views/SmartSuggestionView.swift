//
//  SmartSuggestionView.swift
//  GridClan
//
//  Created by Nima Salehi on 11/4/25.
//

import SwiftUI

struct SmartSuggestionView: View {
    @StateObject private var provider = DataProvider()
    @State private var selectedBase = "HomeVillage"
    let gridSize = 44

    var body: some View {
        VStack(spacing: 20) {
            Picker("Base Type", selection: $selectedBase) {
                Text("🏠 Home Village").tag("HomeVillage")
                Text("🔨 Builder Base").tag("BuilderBase")
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)

            ZStack {
                GridBackground(gridSize: gridSize)

                ForEach(filteredBuildings()) { building in
                    if let pos = building.position {
                        BuildingView(building: building)
                            .position(
                                x: CGFloat(pos.x) * 7 + 10,
                                y: CGFloat(pos.y) * 7 + 10
                            )
                    }
                }
            }
            .frame(width: 320, height: 320)
            .background(Color.gray.opacity(0.05))
            .cornerRadius(10)
            .border(Color.gray.opacity(0.3))

            if let date = provider.lastUpdate {
                Text("آخرین بروزرسانی ChatGPT: \(date.formatted(date: .numeric, time: .shortened))")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("💡 Smart Suggestions")
        .task {
            await provider.fetchLatestData()
        }
    }

    private func filteredBuildings() -> [Building] {
        provider.buildings.filter { $0.belongs_to.contains(selectedBase) }
    }
}
struct SmartSuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        SmartSuggestionView()
    }
}

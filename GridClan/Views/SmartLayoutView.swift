//
//  SmartLayoutView.swift
//  GridClan
//
//  Created by Nima Salehi on 11/4/25.
//

import SwiftUI

struct SmartLayoutView: View {
    @StateObject private var dataProvider = DataProvider()
    @State private var selectedVillage = "HomeVillage"
    let gridSize = 44

    var body: some View {
        VStack {
            Picker("Village Type", selection: $selectedVillage) {
                Text("🏠 Home Village").tag("HomeVillage")
                Text("🔨 Builder Base").tag("BuilderBase")
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)

            Divider().padding(.vertical, 5)

            ScrollView([.horizontal, .vertical]) {
                ZStack {
                    GridBackground(gridSize: gridSize)

                    ForEach(filteredBuildings()) { building in
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

    private func filteredBuildings() -> [Building] {
        dataProvider.buildings.filter { $0.belongs_to.contains(selectedVillage) }
    }
}

struct SmartLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        SmartLayoutView()
    }
}

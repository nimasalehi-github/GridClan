//
//  DataProvider.swift
//  GridClan
//
//  Created by Nima Salehi on 11/4/25.
//

import Foundation

@MainActor
final class DataProvider: ObservableObject {
    @Published var buildings: [Building] = []
    @Published var lastUpdate: Date?

    func fetchLatestData() async {
        guard let url = Bundle.main.url(forResource: "buildings", withExtension: "json") else {
            print("❌ buildings.json not found in bundle.")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(BuildingDatabase.self, from: data)
            buildings = decoded.buildings

            let iso = ISO8601DateFormatter()
            if let date = iso.date(from: decoded.updated_at) {
                lastUpdate = date
            }
        } catch {
            print("❌ Error decoding BuildingDatabase:", error)
        }
    }
}

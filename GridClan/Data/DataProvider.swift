//
//  DataProvider.swift
//  GridClan
//
//  Created by Nima Salehi on 11/3/25.
//

import Foundation

@MainActor
final class DataProvider: ObservableObject {
    @Published var buildings: [Building] = []
    @Published var lastUpdate: Date?

    /// Loads local JSON and prepares initial data
    func loadDatabase() {
        guard let url = Bundle.main.url(forResource: "buildings", withExtension: "json") else {
            print("❌ JSON file not found in bundle.")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let database = try decoder.decode(BuildingDatabase.self, from: data)
            self.buildings = database.buildings
            self.lastUpdate = ISO8601DateFormatter().date(from: database.updated_at)
            print("✅ Database loaded successfully. Version: \(database.version)")
        } catch {
            print("❌ Failed to decode JSON:", error)
        }
    }

    /// Simulated future dynamic update (ChatGPT-powered)
    func fetchLatestData() async {
        // این متد بعداً با اتصال ChatGPT برای به‌روزرسانی خودکار جایگزین می‌شود
        await MainActor.run {
            self.loadDatabase()
            print("🔁 Data refreshed from ChatGPT Dynamic Source (local simulation)")
        }
    }
}

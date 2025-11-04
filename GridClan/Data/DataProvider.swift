
//  DataProvider.swift
//  GridClan
//
//  Created by Nima Salehi on 11/3/25.
//

import Foundation

/// این کلاس وظیفه دارد فایل JSON مربوط به ساختمان‌ها را بارگذاری کند.
/// It loads the `buildings.json` file and decodes it into `BuildingDatabase`.
final class DataProvider {
    
    /// Loads the building database from the bundled JSON file.
    static func loadDatabase() -> BuildingDatabase? {
        // 1️⃣ آدرس فایل JSON در bundle
        guard let url = Bundle.main.url(forResource: "buildings", withExtension: "json") else {
            print("❌ JSON file not found in bundle.")
            return nil
        }
        
        do {
            // 2️⃣ خواندن داده‌ها
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            // 3️⃣ دیکود کردن
            let database = try decoder.decode(BuildingDatabase.self, from: data)
            print("✅ Database loaded successfully. Version: \(database.version)")
            return database
            
        } catch {
            print("❌ Failed to decode JSON:", error)
            return nil
        }
    }
}

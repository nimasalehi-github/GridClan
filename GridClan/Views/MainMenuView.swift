//
//  MainMenuView.swift
//  GridClan
//
//  Created by Nima Salehi on 11/4/25.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("🏰 GridClan AI System")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 40)

                Text("انتخاب بخش مورد نظر:")
                    .font(.headline)
                    .foregroundColor(.gray)

                NavigationLink(destination: SmartLayoutView()) {
                    Label("📐 Smart Layout", systemImage: "square.grid.3x3")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(12)
                }

                NavigationLink(destination: SmartSuggestionView()) {
                    Label("💡 Smart Suggestions", systemImage: "lightbulb")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange.opacity(0.2))
                        .cornerRadius(12)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("⚙️ Control Center")
        }
    }
}

// ✅ نسخه‌ی سازگار با Xcode 14
struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}

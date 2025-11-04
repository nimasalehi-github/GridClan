//
//  ControlPanelView.swift
//  GridClan
//
//  Created by Nima Salehi on 11/3/25.
//

import SwiftUI

struct ControlPanelView: View {
    @ObservedObject var vm: GameGridViewModel

    var body: some View {
        VStack {
            Picker("Select Type", selection: $vm.selectedType) {
                ForEach(ObjectType.allCases, id: \.self) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)

            Button("💡 Suggest Layout") {
                vm.suggestSmartLayout()
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 6)

            Text(vm.hintMessage)
                .font(.caption)
                .padding(.top, 4)
        }
    }
}


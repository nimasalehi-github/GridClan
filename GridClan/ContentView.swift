//
//  ContentView.swift
//  GridClan
//
//  Created by Nima Salehi on 10/31/25.
//

import SwiftUI

//struct ContentView: View {
//
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//
//        }
//        .padding()
//    }
//}

struct ContentView: View {
    @StateObject var vm = GameGridViewModel()
    @StateObject var gm = GestureManager()

    var body: some View {
        VStack {
            SmartSuggestionView()
            ControlPanelView(vm: vm)
            GameGridView(vm: vm, gm: gm)
                .frame(width: 400, height: 400)
                .border(Color.gray)
            Text("Gesture: \(gm.gestureText)")
                .font(.footnote)
                .padding(.top, 6)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

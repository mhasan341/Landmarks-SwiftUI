//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Mahmudul Hasan on 2023-09-16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
}

#Preview {
    ContentView()
        .environmentObject(ModelData())
}

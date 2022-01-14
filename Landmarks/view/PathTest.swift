//
//  PathTest.swift
//  Landmarks
//
//  Created by Mahmudul Hasan on 2022-01-15.
// Just to learn Path and Geometry Reader

import SwiftUI

struct PathTest: View {
    var body: some View {
        Path { path in
           path.move(to: CGPoint(x: 20, y: 0))
           path.addLine(to: CGPoint(x: 20, y: 200))
           path.addLine(to: CGPoint(x: 220, y: 200))
           path.addLine(to: CGPoint(x: 220, y: 0))
            path.addLine(to: CGPoint(x: 110, y: 100))
        }
        .fill(
           .linearGradient(
               Gradient(colors: [.green, .blue]),
               startPoint: .init(x: 0.5, y: 0),
               endPoint: .init(x: 0.5, y: 0.5)
           )
        )
    }
}

struct PathTest_Previews: PreviewProvider {
    static var previews: some View {
        PathTest()
    }
}

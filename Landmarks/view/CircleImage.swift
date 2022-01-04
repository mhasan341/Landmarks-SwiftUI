//
//  CircleImage.swift
//  Landmarks
//
//  Created by Mahmudul Hasan on 2022-01-04.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image
    
    var body: some View {
            image
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.purple,lineWidth: 5)
            }
            .overlay{
                Circle().stroke(.white,lineWidth: 3)
            }
            .shadow(color: .gray, radius: 10, x: 4, y: 4)
    } // end body
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}

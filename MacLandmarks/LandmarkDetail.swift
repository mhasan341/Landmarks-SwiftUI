//
//  LandmarkDetail.swift
//  MacLandmarks
//
//  Created by Mahmudul Hasan on 2023-09-16.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {

    var landmark: Landmark
    @EnvironmentObject var modelData: ModelData

    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }

    var body: some View {
        ScrollView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
                    destination.name = landmark.name
                    destination.openInMaps()
                }
                .padding()
            }

            VStack(alignment: .leading, spacing: 20){
                HStack(spacing: 24){
                    CircleImage(image: landmark.image.resizable())
                        .frame(width: 160, height: 160)

                    VStack(alignment: .leading) {
                        HStack{
                            Text(landmark.name)
                                .font(.title)
                                .foregroundColor(.blue)

                            FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                                .buttonStyle(.plain)
                        }


                        VStack(alignment: .leading) {

                            Text(landmark.park)
                            Spacer()
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                }
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)

            }
            .padding()
                .frame(maxWidth: 700)
                .offset(y: -50)

        }
        .navigationTitle(landmark.name)
    }
}

#Preview {
    LandmarkDetail(landmark: ModelData().landmarks[0])
        .environmentObject(ModelData())
}

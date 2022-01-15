//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Mahmudul Hasan on 2022-01-16.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profileToEdit: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profileToEdit.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profileToEdit.goalDate)!
        return min...max
    }
    
    
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profileToEdit.username)
            }
            
            Toggle(isOn: $profileToEdit.prefersNotifications) {
                Text("Enable Notifications").bold()
            }
            
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()
                
                Picker("Seasonal Photo", selection: $profileToEdit.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            DatePicker(selection: $profileToEdit.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date").bold()
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profileToEdit: .constant(.default))
    }
}

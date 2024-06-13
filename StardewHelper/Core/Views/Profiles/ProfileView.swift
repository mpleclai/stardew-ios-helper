//
//  ProfileView.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/30/24.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var vm: CoreDataViewModel

    @State private var editMode: Bool = false

    var body: some View {
        VStack {
            List {
                Section() {profileListView} header: {Text("Existing Profiles")}
                NavigationLink(destination: EditProfileView(vm: vm)) {addProfileViewButton}
            }
            .navigationBarTitle("User Profiles")
            .toolbar {
                Button(action: {editMode.toggle() }, label: {if editMode == true {Text("Done")} else {Text("Edit Profiles")}})
            }
        }
    }
}

#Preview {
    ProfileView(vm: CoreDataViewModel())
}

struct ProfileListItem: View {
    var profile: ProfileEntity

    var body: some View {
        Image(systemName: "person.crop.circle.fill").foregroundColor(colorStringToColor(colorString: profile.color ?? ""))
        VStack(alignment: .leading) {
            Text(profile.name ?? "").font(.headline)
            Text(formStringFromEntityDate(profile: profile)).font(.subheadline)
//            ForEach(Array(vm.collectedFish.keys), id: \.self) { key in
//                 Text(vm.collectedFish[key]?.name ?? "Error")
//            }
//            Text(String(profile.fishCollection ?? "Error"))
        }
        Spacer()
    }
}

extension ProfileView {
    private var addProfileViewButton : some View {
        HStack {
            Image(systemName: "person.crop.circle.fill.badge.plus")
            Text("Add new profile")
        }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }

    private var profileListView : some View {
        ForEach(vm.savedEntities, id: \.self) { profile in
            if editMode {
                HStack {
                    ProfileListItem(profile: profile)
                    NavigationLink(destination: {EditProfileView(profile: profile, vm: vm)}, label: {})
                }
            } else {
                Button(
                    action: {
//                        profileVM.selectedProfile = profile
//                        vm.fetchProfiles()
                        vm.selectProfile(profile: profile)
//                        vm.fetchProfiles()
                    },
                    label: {
                        HStack {
                            ProfileListItem(profile: profile)
                            if vm.selectedProfile == profile {
                                Image(systemName: "checkmark").foregroundColor(.green).imageScale(.large)
                            }
                        }
                    }
                ).foregroundColor(.primary)
            }
        }.onDelete(perform: vm.deleteProfile)
    }
}

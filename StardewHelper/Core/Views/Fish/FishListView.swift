//
//  FishListView.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 7/6/22.
//

import SwiftUI

struct FishListView: View {
    @EnvironmentObject private var fishVM: FishViewModel
    @ObservedObject var vm: CoreDataViewModel

    var body: some View {
        
        let sortedFish = fishVM.fish.sorted{$0.name < $1.name}

        VStack{
            if vm.selectedProfile != nil {
                List(sortedFish) { fish in
                    NavigationLink {
                        FishDetailView(fish: fish, vm: vm)
                    } label: {
                        FishRow(fish: fish, vm: vm)
                    }
                }
            }
        }
        .navigationTitle("Fish")
    }
}

struct FishListView_Previews: PreviewProvider {
    static var previews: some View {
        FishListView(vm: CoreDataViewModel()).environmentObject(FishViewModel())
    }
}

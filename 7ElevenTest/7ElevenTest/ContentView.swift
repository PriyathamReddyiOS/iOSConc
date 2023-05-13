//
//  ContentView.swift
//  7ElevenTest
//
//  Created by priyatham reddy on 5/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm: UserViewModel = UserViewModel()
    @State var showScreen = false
    
    var body: some View {
        NavigationView {
            List(vm.users, id: \.id, rowContent: { user in
                VStack {
                    NavigationLink(user.name) {
                        SubView()
                            .environmentObject(vm)
                    }
                   // Text(user.name)
                    Text(user.email)
                }
            })
            .onAppear {
                Task {
                    await vm.loadUsers()
                }
            }
        }
    }
}

struct SubView: View {
    @EnvironmentObject var vm: UserViewModel
    
    var body: some View {
        Text("Test")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

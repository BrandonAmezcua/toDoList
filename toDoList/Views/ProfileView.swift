//
//  ProfileView.swift
//  toDoList
//
//  Created by Brandon Amezcua on 1/21/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    @State var user: User?
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    // Avatar
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .frame(width: 125, height: 125)
                        .padding()
                    
                    // Info: Name, Email, Member Since
                    VStack(alignment: .leading) {
                        HStack{
                            Text("Name: ")
                            Text(user.name )
                        }
                        .padding()
                        HStack{
                            Text("Email: ")
                            Text(user.email )
                        }
                        .padding()
                        HStack{
                            Text("Member Since: ")
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }
                        .padding()
                    }
                    .padding()
                    
                    // Sign out
                    Button("Log Out") {
                        viewModel.logOut()
                    }
                    .tint(.red)
                    .padding()
                    
                    Spacer()
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
            viewModel.fetchUser()
            self.user = viewModel.findSpecificUser()
            self.user = viewModel.findSpecificUser()
            self.user = viewModel.findSpecificUser()
            print("\nself.user:")
            print(self.user ?? "")
        }
    }
    
    init() {
    }
}

#Preview {
    ProfileView()
}

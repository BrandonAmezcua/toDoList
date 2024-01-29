//
//  ContentView.swift
//  toDoList
//
//  Created by Brandon Amezcua on 1/21/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            // is signed in
            ToDoListView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}

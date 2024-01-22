//
//  RegisterView.swift
//  toDoList
//
//  Created by Brandon Amezcua on 1/21/24.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register",
                       subtitle: "Start organizing to do's",
                       angle: -15,
                       background: .orange)
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}

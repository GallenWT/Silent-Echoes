//
//  ContentView.swift
//  SSHHHH
//
//  Created by Roland Ramadan on 08/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                MenuViewControllerWrapper()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

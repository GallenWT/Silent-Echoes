//
//  Stage0GameplayView.swift
//  SSHHHH
//
//  Created by Glenn Leonali on 17/08/24.
//

import SwiftUI

struct Stage0GameplayView: View {
    @State private var openToiletDoor: Bool = false
    var body: some View {
        ScrollView(.horizontal) {
            ZStack {
                Image("hallway")
                    .resizable()
                    .scaledToFill()
                
                Rectangle()
                    .foregroundColor(.red)
                    .opacity(0.5)
                    .frame(width: 120, height: 210)
                    .position(x: 130, y: 130)
                    .onTapGesture {
                        openToiletDoor = true
                    }
            }
        }.defaultScrollAnchor(.center)
            .ignoresSafeArea()
            .scrollIndicators(.hidden)
            .navigationBarBackButtonHidden()
            .navigationDestination(isPresented: $openToiletDoor) {
                Stage0ToiletView()
            }
    }
}

#Preview {
    Stage0GameplayView()
}

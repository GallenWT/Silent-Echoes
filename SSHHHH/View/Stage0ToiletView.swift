//
//  Stage0ToiletView.swift
//  SSHHHH
//
//  Created by Glenn Leonali on 18/08/24.
//

import SwiftUI

struct Stage0ToiletView: View {
    @State private var doorIsOpen: Bool = false
    @State private var kevinFound: Bool = false
    
    var body: some View {
        ScrollView(.horizontal) {
            ZStack {
                Image(doorIsOpen ? "toilet2" : "toilet")
                    .resizable()
                    .scaledToFill()
                
                Rectangle()
                    .foregroundStyle(Color.red)
                    .opacity(doorIsOpen ? 0 : 0.5)
                    .frame(width: 150, height: 260)
                    .position(x: 1510, y: 145)
                    .onTapGesture {
                        doorIsOpen = true
                    }
                
                if doorIsOpen {
                    Rectangle()
                        .foregroundStyle(Color.blue)
                        .opacity(0.5)
                        .frame(width: 100, height: 130)
                        .position(x: 1510, y: 145)
                        .onTapGesture {
                            kevinFound = true
                        }
                }
            }
        }.defaultScrollAnchor(.center)
            .ignoresSafeArea()
            .scrollIndicators(.hidden)
            .navigationBarBackButtonHidden()
            .navigationDestination(isPresented: $kevinFound) {
                CreditView()
            }
    }
}

#Preview {
    Stage0ToiletView()
}

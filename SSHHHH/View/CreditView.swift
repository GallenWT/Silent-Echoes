//
//  GameOverView.swift
//  SSHHHH
//
//  Created by Glenn Leonali on 18/08/24.
//

import SwiftUI

struct CreditView: View {
    @State private var animate = false
    
    let credits = [
        "CREDITS",
        "Writer: Glenn Leonali",
        "Designer: Glenn Leonali",
        "Developer: Glenn Leonali",
        "Special Thanks: All My Friends and Mentors",
        "",
        "MUSIC",
        "Inspiring Cinematic Ambient - Aleksey Chistilin from Pixabay",
        "Happy Birthday (Music Box Version) - Cumpleaños Feliz from Youtube",
        "Tearful - Oleksii Kaplunskyi from Pixabay",
        "",
        "NANO CHALLENGE 2",
        "APPLE DEVELOPER ACADEMY @BINUS C7S1",
        "@GLENNLEONALI",
        ""
    ]
    
    var body: some View {
        VStack {
            Spacer()
            ForEach(credits, id: \.self) { credit in
                Text(credit)
                    .font(.system(size: 24, design: .monospaced))
            }
            .offset(y: animate ? -UIScreen.main.bounds.height*5/4 : UIScreen.main.bounds.height*5/4)
            .animation(Animation.linear(duration: 20), value: animate)
            
            Spacer()
        }
        .onAppear(){
            animate = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
               // Go back to MenuViewController
//                MenuViewControllerWrapper()
           }
        }
        .navigationBarBackButtonHidden()
    }
    
}

#Preview {
    CreditView()
}

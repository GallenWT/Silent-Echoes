//
//  SelectChapterView.swift
//  SSHHHH
//
//  Created by Nadhif Rahman Alfan on 19/08/24.
//

import SwiftUI

struct SelectChapterView : View {
    var body: some View {
        VStack{
            Text("This is Select Chapter View from SwiftUI")
            NavigationLink(destination: Stage0OpeningView(), label: {
                Text("Chapter 0")
            })
//            Button(action: {
////                chapter1.toggle()
//            }, label: {
//                Text("Chapter 0")
//            })
//            .disabled(!chapter0)
            Button(action: {
                
            }, label: {
                Text("Chapter 1")
            })
//            .disabled(!chapter1)
        }
    }
}

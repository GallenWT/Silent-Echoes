//
//  Stage0OpeningView.swift
//  SSHHHH
//
//  Created by Glenn Leonali on 16/08/24.
//

import SwiftUI

struct Stage0OpeningView: View {
    
    @State private var startTime: Date = Date()
    @State private var animateState: Bool = false
    @State private var imageName: String = "opening1"
    @State private var pause: Bool = false
    
    @State private var soulState: Int = 0
    @State private var bubbleState: Int = 0
    @State private var changePage: Bool = false
    
    var body: some View {
        TimelineView(.animation(minimumInterval: 1, paused: pause)) { context in
            
            ZStack {
                let seconds = context.date.timeIntervalSince(startTime)
                VStack {
                    Spacer()
                    Text("\(seconds)")
                        .font(.title2)
                        .foregroundStyle(Color.white)
                        .background(Color.blue)
                        .padding(100)
                }
                .zIndex(1)
                
                VStack{
                    Button{
                        pause.toggle()
                    }label: {
                        Text("Pause")
                            .background(Color.yellow)
                    }
                }
                
                ZStack {
                    if imageName == "opening7" {
                        HStack {
                            Image("soul\(soulState+1)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 75)
                                .position(x: 170, y: 170)
                                .animation(.easeInOut, value: soulState)
                            
                            Image("bubble-\(bubbleState+1)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70)
                                .position(x: 100+(.random(in: -15...15)), y: 70+(.random(in: -10...10)))
                                .animation(.spring(duration: 3, blendDuration: 0.5), value: seconds)
                                .onTapGesture {
                                    bubbleState+=1
                                    print("\(bubbleState)")
                                    if bubbleState % 3 == 0 {
                                        soulState += 1
                                    }
                                    
                                    if bubbleState == 9 {
                                        imageName = "opening8"
                                        animateState.toggle()
                                    }
                                }
                        }
                        .onDisappear(){
                            print("hstack disappear 1")
                            
                            DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                                print("hstack disappear 2")
                                changePage = true
                            }
                        }
                    }
                }
                .onChange(of: seconds) {
                    if seconds < 3 {
                        imageName = "opening1"
                        animateState.toggle()
                    }else if seconds > 3 && seconds < 6 {
                        imageName = "opening2"
                        animateState.toggle()
                    }else if seconds > 6 && seconds < 9 {
                        imageName = "opening3"
                        animateState.toggle()
                    }else if seconds > 9 && seconds < 12 {
                        imageName = "opening4"
                        animateState.toggle()
                    }else if seconds > 12 && seconds < 15 {
                        imageName = "opening5"
                        animateState.toggle()
                    }else if seconds > 15 && seconds < 18 {
                        imageName = "opening6"
                        animateState.toggle()
                    }else if seconds > 18 && seconds < 21 {
                        imageName = "opening7"
                        animateState.toggle()
                        //                        pause = true
                    }
                }
                .zIndex(0)
            }
        }
        .ignoresSafeArea(.all)
        .background(imageBg(imageName: imageName))
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $changePage){
            Stage0GameplayView()
        }
        .onAppear(){
            startTime = .now
        }
    }
    
    //    func imageView(imageName: String, seconds: TimeInterval, startOn: TimeInterval, duration: TimeInterval) -> some View {
    //        Image(imageName)
    //            .resizable()
    //            .scaledToFill()
    //            .opacity(seconds > startOn && seconds < (startOn+duration) ? 1 : 0)
    //            .animation(.easeInOut, value: seconds > startOn && seconds < (startOn+duration) ? 1 : 0)
    //    }
    
    func imageBg(imageName: String) -> some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .animation(.easeInOut(duration: 1.5), value: animateState ? 0 : 1)
    }
}

#Preview {
    Stage0OpeningView()
}

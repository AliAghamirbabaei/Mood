//
//  ContentView.swift
//  Mood
//
//  Created by Ali Aghamirbabaei on 4/8/22.
//

import SwiftUI

struct ContentView: View {
    @State private var moodState = 0
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("What is Your Mood?")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 50)
            
            Spacer()
            
            Picker("What is your mood?", selection: $moodState) {
                Text("Sad 😭").tag(0)
                Text("Love 😍").tag(1)
                Text("Happy 😄").tag(2)
                Text("Hungry 😋").tag(3)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            .preferredColorScheme(.dark)
            
            Spacer()
            
            GeometryReader {proxy in
                let size = proxy.size
                
                switch moodState {
                case 0:
                    LottieAnimationView(jsonFile: "sad", progress: $progress)
                        .frame(width: size.width, height: size.height)
                case 1:
                    LottieAnimationView(jsonFile: "love", progress: $progress)
                        .frame(width: size.width, height: size.height)
                case 2:
                    LottieAnimationView(jsonFile: "happy", progress: $progress)
                        .frame(width: size.width, height: size.height)
                case 3:
                    LottieAnimationView(jsonFile: "hungry", progress: $progress)
                        .frame(width: size.width, height: size.height)
                default:
                    LottieAnimationView(jsonFile: "happy", progress: $progress)
                        .frame(width: size.width, height: size.height)
                }
            }
            .frame(width: 300, height: 300)
            
            Spacer()
            
            HStack {
                Text("Low")
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                
                Spacer()
                
                Text("High")
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
            }
            .padding(.horizontal)
            
            Slider(value: $progress, in: 0.0...0.73)
                .padding(.horizontal, 40)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

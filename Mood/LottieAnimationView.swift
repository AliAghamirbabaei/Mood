//
//  LottieAnimationView.swift
//  Mood
//
//  Created by Ali Aghamirbabaei on 4/8/22.
//

import SwiftUI
import Lottie

struct LottieAnimationView: UIViewRepresentable {
    var jsonFile: String
    @Binding var progress: CGFloat
    
    func makeUIView(context: Context) -> UIView {
        let rootView = UIView()
        rootView.backgroundColor = .clear
        
        addAnimationView(rootView: rootView)
        
        return rootView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        uiView.subviews.forEach { view in
            if view.tag == 1009 {
                view.removeFromSuperview()
            }
        }
        
        addAnimationView(rootView: uiView)
    }
    
    func addAnimationView(rootView: UIView) {
        let animationView = AnimationView(name: jsonFile, bundle: .main)
        animationView.currentProgress = progress
        animationView.backgroundColor = .clear
        animationView.tag = 1009

        // Auto layout
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            animationView.widthAnchor.constraint(equalTo: rootView.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: rootView.heightAnchor),
        ]
        
        rootView.addSubview(animationView)
        
        rootView.addConstraints(constraints)
    }
}


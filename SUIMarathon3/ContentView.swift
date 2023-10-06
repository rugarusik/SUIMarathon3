//
//  ContentView.swift
//  SUIMarathon3
//
//  Created by Alina Golubeva on 05/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAnimating: Bool = false
    private let animationDuration: Double = 0.5
    private let animationDistance: CGFloat = 15.0
    
    var body: some View {
        Button(action: {
            withAnimation(.interpolatingSpring(stiffness: 100, damping: 10)) {
                isAnimating = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                isAnimating = false
            }
        }) {
            ZStack {
                Circle()
                    .frame (width: 90, height: 90)
                    .opacity(isAnimating ? 0.2 : 0)
                    .animation(.easeInOut(duration: 0.3), value: isAnimating)
                
                HStack(spacing: -6) {
                    ZStack {
                        Image(systemName: "play.fill")
                            .opacity(isAnimating ? 1 : 0)
                            .scaleEffect(isAnimating ? 1 : 0)
                        
                        Image(systemName: "play.fill")
                            .offset(x: isAnimating ? animationDistance : 0)
                            .scaleEffect(isAnimating ? 0.9 : 1)
                            .opacity(isAnimating ? 0.9 : 1)
                            .offset(x: isAnimating ? animationDistance : 0)
                    }
                    
                    Image(systemName: "play.fill")
                        .opacity(isAnimating ? 0.3 : 1)
                        .scaleEffect(isAnimating ? 0.2 : 1)
                }
                .font(.largeTitle)
            }
        }
    }
}

#Preview {
    ContentView()
}

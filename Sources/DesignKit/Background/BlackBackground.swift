//
//  BlackBackground.swift
//  DesignKit
//
//  Created by Bhavesh Chaudhari on 05/11/25.
//

import SwiftUI

public struct BlackBackground: View {
    public var cornerRadius: CGFloat = 0
    
    public init(cornerRadius: CGFloat = 0) {
        self.cornerRadius = cornerRadius
    }
    
    @State private var circleOffsets: [CGSize] = Array(repeating: .zero, count: 6)
    
    public var body: some View {
        ZStack {
            Rectangle() .fill(.ultraThinMaterial).frame(maxWidth: .infinity, maxHeight: .infinity)
            RadialGradient(
                colors: [
                    Color(red: 0.1, green: 0.3, blue: 0.8),
                    Color(red: 0.6, green: 0.2, blue: 0.8),
                    Color.black
                ],
                center: .topTrailing,
                startRadius: 100,
                endRadius: 800
            )
            .ignoresSafeArea()
            
            ForEach(0..<5, id: \.self) { index in
                Circle()
                        .fill(.ultraThinMaterial)
                    .frame(width: CGFloat.random(in: 100...160))
                    .overlay(
                        Circle()
                            .strokeBorder(Color.white.opacity(0.3), lineWidth: 1)
                    )
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                    .offset(circleOffsets[index])
                    .blur(radius: 10)
                    .onAppear {
                        animateCircle(index: index)
                    }
            }
        }.ignoresSafeArea()
        
    }
    
    private func animateCircle(index: Int) {
        withAnimation(
            Animation.easeInOut(duration: Double.random(in: 8...15))
                .repeatForever(autoreverses: true)
        ) {
            circleOffsets[index] = CGSize(
                   width: CGFloat.random(in: -200...200),
                   height: CGFloat.random(in: -300...300)
               )
        }
    }
}


struct DemoView: View {
    @State private var userName = ""
    @State private var isChecked = false
    var body: some View {
        ZStack(alignment: .bottom) {
            BlackBackground()
            VStack(spacing:20) {
               
                JigFloatingTextField(placeholderText: "User Name", height: 55)
                JigFloatingTextField(placeholderText: "Password", height: 55)
                JigPressableButton(title: "Login", buttonHeight: 55, action: {})
                JigCheckboxView(isChecked: $isChecked, title: "Please Select Term & Condition.")
            }.padding(.horizontal, 20)
        }
    }
}

#Preview {
    DemoView()
}




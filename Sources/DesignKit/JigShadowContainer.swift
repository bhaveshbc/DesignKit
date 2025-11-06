//
//  ShadowContainer.swift
//  DesignKit
//
//  Created by Bhavesh Chaudhari on 06/11/25.
//
import SwiftUI
public struct JigShadowContainer<Content: View>: View {
    var cornerRadius: CGFloat = 12
    var shadowColor: Color = .black.opacity(0.2)
    var shadowRadius: CGFloat = 8
    var shadowOffsetY: CGFloat = 4
    var backgroundColor: Color = .white
    
    @ViewBuilder var content: () -> Content
    
    public  var body: some View {
        content()
            .padding()
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .shadow(color: shadowColor,
                    radius: shadowRadius,
                    x: 0,
                    y: shadowOffsetY)
    }
}


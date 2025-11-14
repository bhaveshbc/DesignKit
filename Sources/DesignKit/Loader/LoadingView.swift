//
//  LoadingView.swift
//  DesignKit
//
//  Created by Bhavesh Chaudhari on 14/11/25.
//
import SwiftUI
public struct LoadingView: View {
    
    public let loaderColor: Color
    public let ballSize: CGFloat
    
    public init(loaderColor: Color = .primary, ballSize: CGFloat = 20) {
        self.loaderColor = loaderColor
        self.ballSize = ballSize
    }
    
   public var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                BallPulseSync(ballSize: ballSize, ballColor: loaderColor)
                Spacer()
            }
            .frame(height: 100)
            Spacer()
        }
    }
}

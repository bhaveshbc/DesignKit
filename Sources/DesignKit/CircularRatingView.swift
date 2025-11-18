//
//  CircularRatingView.swift
//  DesignKit
//
//  Created by Bhavesh Chaudhari on 18/11/25.
//

import SwiftUI

public struct CircularRatingView: View {
    
    let rating: Double
    let totalVotes: Int?
    
    @State private var animatedProgress: CGFloat = 0
    
    public init(rating: Double, totalVotes: Int?) {
        self.rating = rating
        self.totalVotes = totalVotes
    }
    
    var normalized: Double {
        rating / 10.0
    }
    
    var ratingColor: Color {
        switch rating {
        case 7...10: return .green
        case 5..<7: return .yellow
        default: return .red
        }
    }
    
    public var body: some View {
        VStack(spacing: 6) {
            ZStack {
                
                Circle()
                    .stroke(Color.gray.opacity(0.25), lineWidth: 8)
                
                Circle()
                    .trim(from: 0, to: animatedProgress)   // <— animate this
                    .stroke(
                        ratingColor,
                        style: StrokeStyle(lineWidth: 8, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))
                
                Text(String(format: "%.1f", rating))
                    .font(.headline)
                    .bold()
            }
            .frame(width: 60, height: 60)
            .onAppear {
                withAnimation(.easeOut(duration: 0.8)) {
                    animatedProgress = normalized
                }
            }
            
            if let votes = totalVotes {
                Text("\(votes) votes")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

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
    
    public init(rating: Double, totalVotes: Int?) {
        self.rating = rating
        self.totalVotes = totalVotes
    }
    
    var normalized: Double {
        rating / 10.0
    }
    
    // MARK: - Color based on rating
    var ratingColor: Color {
        switch rating {
        case 7...10: return .green
        case 5..<7: return .yellow
        default: return .red
        }
    }
    
    public   var body: some View {
        VStack(spacing: 6) {
            ZStack {
             
                Circle()
                    .stroke(Color.gray.opacity(0.25), lineWidth: 8)
                
                Circle()
                    .trim(from: 0, to: normalized)
                    .stroke(
                        ratingColor,
                        style: StrokeStyle(lineWidth: 8, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90)) // Start at top
                    .animation(.easeOut(duration: 0.6), value: rating)
                
                // Rating Text
                Text(String(format: "%.1f", rating))
                    .font(.headline)
                    .bold()
            }
            .frame(width: 60, height: 60)
            
            // Optional vote count
            if let votes = totalVotes {
                Text("\(votes) votes")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

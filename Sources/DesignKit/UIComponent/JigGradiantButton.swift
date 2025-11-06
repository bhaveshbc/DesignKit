//
//  JigGradiantButton.swift
//  DesignKit
//
//  Created by Bhavesh Chaudhari on 06/11/25.
//

import SwiftUI

struct GradientButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(12)
                .shadow(color: .purple.opacity(0.3), radius: 8, x: 0, y: 4)
        }
        .padding(.horizontal)
    }
}

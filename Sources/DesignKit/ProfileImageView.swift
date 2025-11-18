//
//  ProfileImageView.swift
//  DesignKit
//
//  Created by Bhavesh Chaudhari on 18/11/25.
//

import SwiftUI

public struct ProfileImageView: View {
    public   let image: Image?
    public let url: URL?
    var size: CGFloat = 120
    var ringWidth: CGFloat = 6
    var gradient: AngularGradient = AngularGradient(
        gradient: Gradient(colors: [Color.purple, Color.blue, Color.teal, Color.pink]),
        center: .center
    )
    var bodyColor: Color = Color(.systemBackground)

    public init(image: Image? = nil,
         url: URL? = nil,
         size: CGFloat = 120,
         ringWidth: CGFloat = 6,
         gradient: AngularGradient? = nil,
         bodyColor: Color = Color(.systemBackground)) {
        self.image = image
        self.url = url
        self.size = size
        self.ringWidth = ringWidth
        if let g = gradient { self.gradient = g }
        self.bodyColor = bodyColor
    }

    public var body: some View {
        ZStack {
            // Gradient ring
            Circle()
                .stroke(gradient, lineWidth: ringWidth)
                .frame(width: size, height: size)

            // Inner content (image or placeholder)
            Group {
                if let url = url {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let loaded):
                            loaded
                                .resizable()
                                .scaledToFill()
                        case .failure:
                            placeholder
                        @unknown default:
                            placeholder
                        }
                    }
                } else if let image = image {
                    image
                        .resizable()
                        .scaledToFill()
                } else {
                    placeholder
                }
            }
            .frame(width: size - ringWidth * 2, height: size - ringWidth * 2)
            .background(bodyColor)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.primary.opacity(0.03), lineWidth: 0.5)
            )
        }
        .frame(width: size, height: size)
        .shadow(color: Color.primary.opacity(0.12), radius: 6, x: 0, y: 3)
    }

    private var placeholder: some View {
        Circle()
            .fill(Color.gray.opacity(0.2))
            .overlay(
                Image(systemName: "person.fill")
                    .font(.system(size: (size - ringWidth * 2) * 0.45))
                    .foregroundColor(.gray)
            )
    }
}

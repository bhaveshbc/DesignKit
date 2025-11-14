//
//  EmptyStateView.swift
//  DesignKit
//
//  Created by Bhavesh Chaudhari on 14/11/25.
//
import SwiftUI

public struct EmptyStateView: View {
    
    public  let message: String
    
    public init(message: String) {
        self.message = message
    }
    
    public var body: some View {
        VStack {
            Spacer()
            Text(message)
                .font(.headline)
                .foregroundStyle(Color.black)
            Spacer()
        }
    }
}

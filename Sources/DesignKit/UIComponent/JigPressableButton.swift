//
//  JigPressableButton.swift
//  DesignKit
//
//  Created by Bhavesh Chaudhari on 06/11/25.
//
import SwiftUI
public struct JigPressableButton: View {
    
      var title: String
      var buttonHeight: CGFloat = 50
      var action: () -> Void

    @State private var isPressed = false
    
    public  init(title: String, buttonHeight: CGFloat, action: @escaping () -> Void) {
        self.title = title
        self.buttonHeight = buttonHeight
        self.action = action
    }
    
    public  var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .foregroundColor(Color.white)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(height: buttonHeight)
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(colors: [.pink, .orange],
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                )
                .cornerRadius(14)
                .shadow(color: .orange.opacity(0.3), radius: 10, x: 0, y: 6)
        }
    }
}

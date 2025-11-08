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
                .font(.caption2)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
                .frame(height: buttonHeight)
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(colors: [.pink, .orange],
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                )
                .cornerRadius(14)
                .scaleEffect(isPressed ? 0.97 : 1.0)
                .shadow(color: .orange.opacity(0.3), radius: 10, x: 0, y: 6)
        }
//        .buttonStyle(.plain)
//        .gesture(
//            DragGesture(minimumDistance: 0)
//                .onChanged { _ in withAnimation(.spring()) { isPressed = true } }
//                .onEnded { _ in
//                    withAnimation(.spring()) { isPressed = false }
//                    action()
//                }
//        )
       
    }
}

//
//  JigCheckbox.swift
//  DesignKit
//
//  Created by Bhavesh Chaudhari on 06/11/25.
//
import SwiftUI
struct JigCheckboxView: View {
    @Binding var isChecked: Bool
    var title: String
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            HStack(spacing: 10) {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .foregroundColor(isChecked ? .orange : .white)
                    .animation(.easeInOut(duration: 0.2), value: isChecked)
                
                Text(title)
                    .foregroundColor(.white)
            } .foregroundColor(.white)
            .padding(.vertical, 4)
        }
        .buttonStyle(.plain)
    }
}

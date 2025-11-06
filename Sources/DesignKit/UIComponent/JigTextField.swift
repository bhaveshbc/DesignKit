//
//  JigTextField.swift
//  DesignKit
//
//  Created by Bhavesh Chaudhari on 06/11/25.
//

import SwiftUI

public struct JigFloatingTextField: View {
    
    let placeholderText: String
    @State private var text: String = ""
    
    let animation: Animation = .spring(response: 0.1, dampingFraction: 0.8)
    
    @State private var placeholderOffset: CGFloat = 0
    @State private var textfieldOffset: CGFloat = 0
    @State private var scaleEffectValue: CGFloat = 1
    
    private var onTextAction: ((_ oldValue : String ,_ newValue : String) -> ())?
    var height: CGFloat = 50
    
    public  init(placeholderText: String, height: CGFloat = 50, onTextAction: ((_: String, _: String) -> Void)? = nil) {
        self.placeholderText = placeholderText
        self.onTextAction = onTextAction
        self.height = height
    }
    
    
    public var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Text(placeholderText)
                    .foregroundStyle($text.wrappedValue.isEmpty ? Color.white : Color.gray)
                    .font(.headline)
                    .offset(y: placeholderOffset)
                    .scaleEffect(scaleEffectValue, anchor: .leading)
                
                TextField("", text: $text)
                    .font(.headline)
                    .foregroundStyle(Color.white).offset(y: textfieldOffset)
            }
            .padding(.horizontal, 15)
            .frame(height: height)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray, lineWidth: 2)
            )
            .onChange(of: text) { oldValue, newValue in
                withAnimation(animation) {
                    placeholderOffset = $text.wrappedValue.isEmpty ? 0 : -15
                    scaleEffectValue = $text.wrappedValue.isEmpty ? 1 : 0.8
                    textfieldOffset =  $text.wrappedValue.isEmpty ? 0 : 10
                }
                
                onTextAction?(oldValue, newValue)
            }
        }
    }
}

extension JigFloatingTextField {
    public func onTextChange(_ onTextAction: ((_ oldValue : String ,_ newValue : String) -> ())?) -> Self {
        var view = self
        view.onTextAction = onTextAction
        return view
    }
}

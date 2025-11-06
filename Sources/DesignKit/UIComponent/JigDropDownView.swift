//
//  JigDropDownView.swift
//  DesignKit
//
//  Created by Bhavesh Chaudhari on 06/11/25.
//

import SwiftUI

struct JigCountryPickerView: View {
    
    let title: String
    var dropDownClicked: () -> Void
    
    var body: some View {
        Button(action: dropDownClicked) {
            HStack(spacing: 15) {
                Image(.india).resizable().frame(width: 45, height: 45)
                Text(title)
                    .foregroundStyle(.white)
                    .font(.headline)
                Spacer()
                Image(.whiteDropDown).resizable().frame(width: 20, height: 15)
            }
            .padding(.horizontal, 15)
            .frame(height: 55)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray, lineWidth: 2)
            )
        }
    }
}

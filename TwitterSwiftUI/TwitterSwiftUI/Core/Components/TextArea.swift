//
//  TextArea.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 3.12.2022.
//

import SwiftUI

struct TextArea: View {
    // MARK: - PROPERTIES
    @Binding var text : String
    let placeHolder : String
    
    init(_ placeHolder: String, text: Binding<String>) {
        self.placeHolder = placeHolder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
    // MARK: - BODY
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeHolder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            TextEditor(text: $text)
                .padding(4)
        } // : ZSTACK
        .font(.body)
    }
}

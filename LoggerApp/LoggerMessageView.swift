//
//  LoggerMessageView.swift
//  LoggerApp
//
//  Created by Inna Chystiakova on 06/09/2024.
//

import SwiftUI

struct LoggerMessageView: View {
    @Binding var message: String
    var title: String = "Send simple message"
    var fieldPlaceholder: String = "Send simple message"
    var buttonTitle: String = "Send"
    var buttonAction: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.footnote)
                .foregroundStyle(.blue)
            
            HStack(spacing: 15) {
                TextField(fieldPlaceholder, text: $message)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.leading)
                
                Button(action: buttonAction) {
                    Text(buttonTitle)
                }
                .foregroundStyle(.white)
                .frame(width: 100, height: 44)
                .background(Color.blue)
                .cornerRadius(10)
            }
        }
    }
}

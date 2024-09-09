//
//  ContentView.swift
//  MobileLogginApp
//
//  Created by Inna Chystiakova on 06/09/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = LoggerViewModel()
    @State private var message = ""
    @State private var increasedMessage = ""
    @State private var trimmedMessage = ""
    @State private var validMessage = ""
    
    var body: some View {
        VStack(spacing: 25) {
            VStack(spacing: 10) {
                Image(systemName: viewModel.resultFlag ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(viewModel.resultFlag ? .green : .red)
                    .font(.system(size: 50))
                Text("\(viewModel.resultMessage)")
                    .foregroundColor(viewModel.resultFlag ? .green : .red)
            }.hidden(shouldHide: viewModel.isHideImage)
            
            Spacer().frame(height: 20)
            
            LoggerMessageView(
                message: $message,
                title: "Send simple message",
                fieldPlaceholder: "Send a message",
                buttonTitle: "Send"
            ) {
                viewModel.postMessage(text: message)
            }
            
            LoggerMessageView(
                message: $increasedMessage,
                title: "Send message with length",
                fieldPlaceholder: "Minimum 3 characters",
                buttonTitle: "SEND"
            ) {
                viewModel.postIncreasedMessageMessage(text: increasedMessage)
            }
            
            LoggerMessageView(
                message: $trimmedMessage,
                title: "Send message with length",
                fieldPlaceholder: "Maximum 10 characters",
                buttonTitle: "SEND"
            ) {
                viewModel.postTrimmedMessage(text: trimmedMessage)
            }
            
            LoggerMessageView(
                message: $validMessage,
                title: "Send message with text format",
                fieldPlaceholder: "Only letters and digits",
                buttonTitle: "SenD"
            ) {
                viewModel.postValidMessage(text: validMessage)
            }

            Spacer()
            
            HStack(spacing: 160) {
                Text("Post all the messages above")
                    .font(.footnote)
                    .foregroundStyle(.blue)
                Button {
                    viewModel.postMultipleMessage(text: [
                        message,
                        increasedMessage,
                        trimmedMessage,
                        validMessage
                    ])
                } label: {
                    Text("Send")
                }
                .foregroundStyle(.white)
                .frame(width: 100, height: 44)
                .background(Color.blue)
                .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
    }
}

extension View {
    func hidden(shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}

#Preview {
    ContentView()
}

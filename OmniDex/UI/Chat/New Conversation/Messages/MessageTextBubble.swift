//
//  MessageTextBubble.swift
//  ChatApp
//
//  Created by Clay Suttner on 2/10/24.
//

import SwiftUI

struct MessageTextBubble: View {
    var message: Message

    var style: MessageStyle {
        MessageStyle(isUser: message.isUser)
    }

    var body: some View {
        VStack {
            if message.isLoading {
                EllipsesLoadingView()
            } else {
                ForEach(message.content) { content in
                    switch content {
                    case let .code(_, text):
                        ScrollView(.horizontal) {
                            Text(text)
                                .font(.footnote)
                                .monospaced()
                                .textSelection(.enabled)
                                .fixedSize(horizontal: false, vertical: true)
                                .foregroundColor(.white)
                                .padding(style.padding)
                        }
                        .background(.black)
                        .cornerRadius(style.padding)
                        
                    case let .plain(text):
                        Text(text)
                            .textSelection(.enabled)
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .frame(minHeight: style.minHeight)
        .padding(.vertical, style.padding / 2)
        .padding(.horizontal, style.padding)
        .background(style.accentColor)
        .clipShape(style.clipShape)
        .onChange(of: message.text) {
            UIImpactFeedbackGenerator().impactOccurred()
        }
    }
}

#Preview {
    MessageTextBubble(message: Mock.messageWithImage)
}

//
//  ChatCompletionResponse+MockResponse.swift
//  ChatApp
//
//  Created by Clay Suttner on 2/10/24.
//

import Foundation
import OpenAI

extension ChatCompletionResponse {
    static func mockResponse(message: OpenAI.ChatMessage) -> ChatCompletionResponse {
        ChatCompletionResponse(
            id: UUID().uuidString,
            choices: [
                ChatCompletionChoice(
                    index: 0,
                    delta: nil,
                    message: message,
                    logprobs: nil,
                    finishReason: nil
                ),
            ],
            created: Date(),
            model: "",
            systemFingerprint: nil,
            object: "",
            usage: ChatUsage(promptTokens: 0, completionTokens: 0, totalTokens: 0)
        )
    }
}

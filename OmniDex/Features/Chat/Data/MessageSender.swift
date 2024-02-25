//
//  MessageSender.swift
//  ChatApp
//
//  Created by Clay Suttner on 4/23/23.
//

import Foundation
import OpenAISwift

struct MessageSender {
    let role: Role

    var isUser: Bool {
        role == .user
    }

    var imageName: String {
        switch role {
        case .user:
            "Clay"
        case .assistant:
            "Robot"
        case .system:
            "tv"
        }
    }

    init(role: Role) {
        self.role = role
    }
}

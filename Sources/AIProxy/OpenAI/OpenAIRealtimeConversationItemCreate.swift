//
//  OpenAIRealtimeConversationItemCreate.swift
//
//
//  Created by Lou Zell on 10/12/24.
//

import Foundation

/// https://platform.openai.com/docs/api-reference/realtime-client-events/conversation/item/create
nonisolated public struct OpenAIRealtimeConversationItemCreate: Encodable {
    public let type = "conversation.item.create"
    public let item: OpenAIRealtimeConversationItem

    public init(item: OpenAIRealtimeConversationItem) {
        self.item = item
    }

    enum CodingKeys: String, CodingKey {
        case type
        case item
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)

        // Encode the protocol-typed `item` using a superEncoder for the `item` key.
        let itemEncoder = container.superEncoder(forKey: .item)
        try item.encode(to: itemEncoder)
    }
}
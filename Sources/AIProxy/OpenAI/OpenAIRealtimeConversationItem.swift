public protocol OpenAIRealtimeConversationItem: Encodable {
    var type: String { get }
}

struct OpenAIRealtimeFunctionCallOutputConversationItem: OpenAIRealtimeConversationItem {
    /// The ID of the function call this output is for.
    public let callID: String

    /// The output of the function call (free text, may be empty).
    public let output: String

    /// The type of the item. Always `function_call_output` for this struct.
    public let type = "function_call_output"

    public init(callID: String,
                output: String = "",) {
        self.callID = callID
        self.output = output
    }

    private enum CodingKeys: String, CodingKey {
        case callID = "call_id"
        case output
        case type
    }
}

struct OpenAIRealtimeUserMessageConversationItem: OpenAIRealtimeConversationItem {
    public let type = "message"
    public let role: String
    public let content: [Content]
    
    public init(role: String, text: String) {
        self.role = role
        self.content = [.init(text: text)]
    }
}

extension OpenAIRealtimeUserMessageConversationItem {
    struct Content: Encodable {
        public let type = "input_text"
        public let text: String
        
        public init(text: String) {
            self.text = text
        }
    }
}

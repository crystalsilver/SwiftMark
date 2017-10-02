//The MIT License (MIT)
//
//Copyright (c) 2017 Caleb Kleveter
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

public class Text: Renderer {
    public var regex: RegEx = "[^\\s]+"
    public var templates: [String] = ["$0"]
    public var renderer: MarkdownRenderer
    
    public required init(renderer: MarkdownRenderer) {
        self.renderer = renderer
    }
    
    public func tokenize(_ string: String) -> Token {
        return TextToken(value: string)
    }
    
    public func parse(_ token: Token) -> Node {
        guard case let TokenValue.string(value) = token.value else { fatalError("[SwiftMark] - Getting token value from TextToken") }
        return TextNode(value: value)
    }
    
    public func render(_ node: Node) -> String {
        guard case let NodeValue.string(value) = node.value else { fatalError("[SwiftMark] - Getting node value from TextNode") }
        return value
    }
    
    
}

public class TextToken: Token {
    public var renderer: Renderer.Type = Text.self
    public var value: TokenValue
    
    public init(value: String) {
        self.value = TokenValue.string(value)
    }
}

public class TextNode: Node {
    public var renderer: Renderer.Type = Text.self
    public var value: NodeValue
    
    public init(value: String) {
        self.value = NodeValue.string(value)
    }
}
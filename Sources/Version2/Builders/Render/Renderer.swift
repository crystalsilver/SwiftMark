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

/// A Markdown element renderer.
/// This covers the rendering of a single type of Markdown element to HTML (i.e. blockquote, h1, italic, etc.).
public protocol Renderer: TokenGenerator, NodeGenerator, NodeRenderer {
    
    /// The type of markdown element that the renderer handles (i.e. header, image, quote, etc.)
    var type: String { get }
    
    /// Tags for elements that will not be sub-rendered.
    var disallowedTags: [String] { get }
    
    /// The `MarkdownRenderer` that is using the Renderer.
    var renderer: MarkdownRenderer { get }
    
    /// Allows auto-initilization by a `MarkdownRenderer`.
    init()
}

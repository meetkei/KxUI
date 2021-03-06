//
//  Copyright (c) 2016 Keun young Kim <app@meetkei.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

#if os(iOS) || os(tvOS)
    public extension String {
        
        func estimatedHeight(_ width: CGFloat, font: UIFont) -> CGFloat {
            let s = NSString(string: self)
         #if swift(>=4.2)
         let attrs = [NSAttributedString.Key.font: font]
         #elseif swift(>=3.3)
            let attrs = [NSAttributedStringKey.font: font]
         #else
            let attrs = [NSFontAttributeName: font]
         #endif
         
            let rect = s.boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attrs, context: nil)
            return ceil(rect.height)
        }
        
        
        
        func estimatedWidth(_ font: UIFont) -> CGFloat {
            let s = NSString(string: self)
         #if swift(>=4.2)
         let attrs = [NSAttributedString.Key.font: font]
         #elseif swift(>=3.3)
         let attrs = [NSAttributedStringKey.font: font]
         #else
            let attrs = [NSFontAttributeName: font]
         #endif
            let rect = s.boundingRect(with: CGSize(width: 1000, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attrs, context: nil)
            return ceil(rect.width)
        }
    }
#elseif os(macOS)
    
    public extension String {
        @available(OSX 10.11, *)
        func estimatedHeight(_ width: CGFloat, font: NSFont) -> CGFloat {
            let s = NSString(string: self)
         #if swift(>=3.3)
            let attrs = [NSAttributedStringKey.font: font]
         #else
            let attrs = [NSFontAttributeName: font]
         #endif
            let rect = s.boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attrs, context: nil)
            return ceil(rect.height)
        }
        
        @available(OSX 10.11, *)
        func estimatedWidth(_ font: NSFont) -> CGFloat {
            let s = NSString(string: self)
         #if swift(>=3.3)
            let attrs = [NSAttributedStringKey.font: font]
         #else
            let attrs = [NSFontAttributeName: font]
         #endif
            let rect = s.boundingRect(with: CGSize(width: 1000, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attrs, context: nil)
            return ceil(rect.width)
        }
    }
#endif

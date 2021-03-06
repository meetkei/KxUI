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

public extension UIColor {
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Initializing a UIColor Object
    
    /**
     Initializes and returns a color object using the hexadecimal color string.
     
     - Parameter hexString: the hexadecimal color string.
     
     - Returns: An initialized color object. If *hexString* is not a valid hexadecimal color string, returns a color object whose grayscale value is 1.0 and whose alpha value is 1.0.
     */
    convenience init(hexString: String) {
        var red: CGFloat    = 1.0
        var green: CGFloat  = 1.0
        var blue: CGFloat   = 1.0
        var alpha: CGFloat  = 1.0
        
        if let color = hexString.parseHexColorString() {
            color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        }
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }

    
    var rgbHexString: String {
        return toHexString(includeAlpha: false)
    }
    
    var rgbaHexString: String {
        return toHexString(includeAlpha: true)
    }
    
    private func toHexString(includeAlpha: Bool) -> String {
        var normalizedR: CGFloat = 0
        var normalizedG: CGFloat = 0
        var normalizedB: CGFloat = 0
        var normalizedA: CGFloat = 0
        
        getRed(&normalizedR, green: &normalizedG, blue: &normalizedB, alpha: &normalizedA)
        
        let r = Int(normalizedR * 255)
        let g = Int(normalizedG * 255)
        let b = Int(normalizedB * 255)
        let a = Int(normalizedA * 255)
        
        if includeAlpha {
            return String(format: "#%02X%02X%02X%02X", r, g, b, a)
        }
        
        return String(format: "#%02X%02X%02X", r, g, b)
    }
}

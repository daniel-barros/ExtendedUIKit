//
//  UILabel.swift
//  ExtendedUIKit
//
//  Created by Daniel Barros López on 11/5/16.
//
//  Copyright (c) 2016 - 2017 Daniel Barros López
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

import ExtendedFoundation
import UIKit

public extension UILabel {
    
    /// A nil parameter will be ignored.
    convenience init(text: String, font: UIFont? = nil, textColor: UIColor? = nil, numberOfLines: Int? = nil) {
        self.init()
        self.text = text
        self.font =? font
        self.textColor =? textColor
        self.numberOfLines =? numberOfLines
    }
    
    /// Returns `true` if the label will truncate its text with the given size constraints.
    /// If `maximumNumberOfLines` is not specified, it takes into account the label's `numberOfLines` property.
    /// - warning: Not implemented for labels with attributed text.
    func truncatesText(withMaximumWidth maxWidth: CGFloat,
                       maximumHeight maxHeight: CGFloat,
                       maximumNumberOfLines maxNumberOfLines: Int? = nil) -> Bool {
        guard let text = text else {
            return false
        }
        let maxLines = maxNumberOfLines ?? numberOfLines
        if maxLines == 0 {
            return font.sizeOfString(string: text, withMaximumWidth: maxWidth, maximumNumberOfLines: maxLines).height > maxHeight
        } else {
            let heightForConstrainedNumberOfLines = font.sizeOfString(string: text, withMaximumWidth: maxWidth, maximumNumberOfLines: maxLines).height
            let unconstrainedHeight = font.sizeOfString(string: text, withMaximumWidth: maxWidth, maximumNumberOfLines: 0).height
            return heightForConstrainedNumberOfLines < unconstrainedHeight ||
                heightForConstrainedNumberOfLines > maxHeight
        }
        
    }
}

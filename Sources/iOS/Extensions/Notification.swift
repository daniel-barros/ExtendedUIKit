//
//  Notification.swift
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

import UIKit

public extension Notification {
    
    struct ProcessedInfo {
        
        private let notification: Notification
        
        fileprivate init(notification: Notification) {
            self.notification = notification
        }
    }
    
    /// Provides access to the information in userInfo with a friendlier interface.
    var processedInfo: ProcessedInfo {
        return ProcessedInfo(notification: self)
    }
}

// MARK: - Keyboard

extension Notification.ProcessedInfo {
    
    @available(*, unavailable, message: "Use keyboardFrame instead.")
    var keyboardHeight: CGFloat? { fatalError("\(#function) is obsolete.") }
    
    var keyboardFrameEnd: CGRect? {
        return (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
    }
    
    var keyboardAnimationDuration: Double? {
        return (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
    }
}

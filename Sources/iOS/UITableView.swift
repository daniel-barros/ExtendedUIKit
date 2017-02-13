//
//  UITableView.swift
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

public extension UITableView {
    
    func dequeueReusableCell<T>(for indexPath: IndexPath) -> T where T: Reusable {
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
    func register<T>(headerFooterViewClass: T.Type) where T: AnyObject, T: Reusable {
        register(headerFooterViewClass, forHeaderFooterViewReuseIdentifier: headerFooterViewClass.reuseIdentifier)
    }
    
    func dequeueReusableHeaderFooterView<T>() -> T? where T: Reusable {
        return dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T
    }
    
    /// Updates the `isFloating` property of all headers that conform to the `Flotable` protocol.
    /// - parameter topOffset: Offset applied when considering if a header is floating or not. A positive value will reduce the area in which the header is considered floating by the top.
    /// - parameter negativeOffset: Offset applied when considering if a header is floating or not. A negative value will reduce the area in which the header is considered floating by the bottom.
    func updateHeadersFloatingState(topOffset: CGFloat = 0, bottomOffset: CGFloat = 0) {
        var sectionHeight: CGFloat = 0
        var totalHeight: CGFloat = 0
        for section in 0..<numberOfSections {
            sectionHeight = rect(forSection: section).size.height
            totalHeight += sectionHeight
            if let header = headerView(forSection: section) {
                let headerOriginY = header.frame.origin.y
                if var floatableHeader = header as? Floatable {
                    let floatingYRange = (totalHeight - sectionHeight + topOffset + 1)...(totalHeight + bottomOffset - 1)
                    let headerYRange = headerOriginY...(headerOriginY + header.frame.height)
                    floatableHeader.isFloating = floatingYRange.contains(headerYRange)
                }
            }
        }
    }
    
    
    /// Updates its rows height with animation.
    func reloadRowHeights() {
        beginUpdates()
        endUpdates()
    }
}

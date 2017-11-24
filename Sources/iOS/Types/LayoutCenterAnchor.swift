//
//  LayoutCenterAnchor.swift
//  ExtendedUIKit iOS
//
//  Created by Daniel Barros López on 11/24/17.
//  Copyright © 2017 Daniel Barros. All rights reserved.
//

import UIKit

protocol CenterAnchorable {
    var centerYAnchor: NSLayoutYAxisAnchor { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
}

extension UIView: CenterAnchorable {}
extension UILayoutGuide: CenterAnchorable {}

/// A class for creating mutliple edge-based layout constraint objects in one line.
///
/// Example:
///
///     NSLayoutConstraint.activate(view.centerAnchor.constraint(equalTo: view.centerAnchor))
@available(iOS 11.0, *)
open class LayoutCenterAnchor {
    
    private let subject: CenterAnchorable
    
    /// Returns an array of constraints that define the centerX and centerY anchors position equal to another ones.
    /// - returns: Array containing constraints in this order: centerX, centerY.
    open func constraint(equalTo anchor: LayoutCenterAnchor) -> [NSLayoutConstraint] {
        return constraint(equalTo: anchor, offsetX: 0, offsetY: 0)
    }
    
    /// Returns an array of constraints that define the centerX and centerY anchors position equal to another ones with an offset.
    /// - returns: Array containing constraints in this order: centerX, centerY.
    open func constraint(equalTo anchor: LayoutCenterAnchor, offsetX: CGFloat = 0, offsetY: CGFloat = 0) -> [NSLayoutConstraint] {
        return [self.subject.centerXAnchor.constraint(equalTo: anchor.subject.centerXAnchor, constant: offsetX),
                self.subject.centerYAnchor.constraint(equalTo: anchor.subject.centerYAnchor, constant: offsetY)]
    }
    
    fileprivate init(of object: CenterAnchorable) {
        self.subject = object
    }
}

@available(iOS 11.0, *)
public extension UIView {
    /// A layout anchor representing both the centerXAnchor and centerYAnchor.
    var centerAnchor: LayoutCenterAnchor {
        return LayoutCenterAnchor(of: self)
    }
}

@available(iOS 11.0, *)
public extension UILayoutGuide {
    /// A layout anchor representing both the centerXAnchor and centerYAnchor.
    var centerAnchor: LayoutCenterAnchor {
        return LayoutCenterAnchor(of: self)
    }
}

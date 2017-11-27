//
//  LayoutEdgesAnchor.swift
//  ExtendedUIKit iOS
//
//  Created by Daniel Barros López on 11/23/17.
//  Copyright © 2017 Daniel Barros. All rights reserved.
//

import UIKit

protocol EdgeAnchorable {
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
}

extension UIView: EdgeAnchorable {}
extension UILayoutGuide: EdgeAnchorable {}

@available(iOS 11.0, *)
public extension UIView {
    /// A layout anchor representing the top, leading, bottom and trailing edges of the view's frame.
    var edgesAnchor: LayoutEdgesAnchor {
        return LayoutEdgesAnchor(of: self)
    }
}

@available(iOS 11.0, *)
public extension UILayoutGuide {
    /// A layout anchor representing the top, leading, bottom and trailing edges of the layout guide's frame.
    var edgesAnchor: LayoutEdgesAnchor {
        return LayoutEdgesAnchor(of: self)
    }
}

/// A class for creating mutliple edge-based layout constraint objects in one line.
///
/// Example:
///
///     NSLayoutConstraint.activate(view.edgesAnchor.constraint(equalTo: view.safeAreaLayoutGuide.edgesAnchor))
@available(iOS 11.0, *)
open class LayoutEdgesAnchor {
    
    private let subject: EdgeAnchorable
    
    /// Returns an array of constraints that define all the edges anchors position equal to another with an inset (a positive inset will put the receiver inside the other edges).
    /// - returns: Array containing constraints in this order: top, leading, bottom, trailing.
    open func constraint(equalTo anchor: LayoutEdgesAnchor, insets: NSDirectionalEdgeInsets = .zero) -> [NSLayoutConstraint] {
        let horizontal = constraint(horizontalEdgesEqualTo: anchor, insets: insets)
        let vertical = constraint(verticalEdgesEqualTo: anchor, insets: insets)
        return [vertical[0], horizontal[0], vertical[1], horizontal[1]]
    }
    
    /// Returns an array of constraints that define the top and bottom anchors position equal to another ones with an inset (a positive inset will put the receiver inside the other edges).
    /// - returns: Array containing constraints in this order: top, bottom.
    open func constraint(verticalEdgesEqualTo anchor: LayoutEdgesAnchor, insets: NSDirectionalEdgeInsets = .zero) -> [NSLayoutConstraint] {
        return [self.subject.topAnchor.constraint(equalTo: anchor.subject.topAnchor, constant: insets.top),
                self.subject.bottomAnchor.constraint(equalTo: anchor.subject.bottomAnchor, constant: insets.bottom)]
    }
    
    /// Returns an array of constraints that define the leading and trailing anchors position equal to another ones with an inset (a positive inset will put the receiver inside the other edges).
    /// - returns: Array containing constraints in this order: leading, trailing.
    open func constraint(horizontalEdgesEqualTo anchor: LayoutEdgesAnchor, insets: NSDirectionalEdgeInsets = .zero) -> [NSLayoutConstraint] {
        return [self.subject.leadingAnchor.constraint(equalTo: anchor.subject.leadingAnchor, constant: insets.leading),
                anchor.subject.trailingAnchor.constraint(equalTo: self.subject.trailingAnchor, constant: insets.trailing)]
    }
    
    fileprivate init(of object: EdgeAnchorable) {
        self.subject = object
    }
}

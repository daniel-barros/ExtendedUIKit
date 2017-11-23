//
//  LayoutEdges.swift
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

/// A factory class for creating edge-based layout constraint objects.
///
/// Example:
///
///     NSLayoutConstraint.activate(view.edgesAnchor.constraint(equalTo: view.safeAreaLayoutGuide.edgesAnchor))
open class LayoutEdges {
    
    private let subject: EdgeAnchorable
    
    /// Returns an array of constraints that define the edges anchor position equal to another.
    /// The array contains constraints in this order: top, leading, bottom and trailing.
    open func constraint(equalTo anchor: LayoutEdges) -> [NSLayoutConstraint] {
        return constraint(equalTo: anchor, insets: .zero)
    }
    
    /// Returns an array of constraints that define the edges anchor position equal to another with an inset (a positive inset will put the receiver inside the other edges).
    /// The array contains constraints in this order: top, leading, bottom and trailing.
    open func constraint(equalTo anchor: LayoutEdges, insets: NSDirectionalEdgeInsets) -> [NSLayoutConstraint] {
        return [self.subject.topAnchor.constraint(equalTo: anchor.subject.topAnchor, constant: insets.top),
                self.subject.leadingAnchor.constraint(equalTo: anchor.subject.leadingAnchor, constant: insets.leading),
                self.subject.bottomAnchor.constraint(equalTo: anchor.subject.bottomAnchor, constant: insets.bottom),
                anchor.subject.trailingAnchor.constraint(equalTo: self.subject.trailingAnchor, constant: insets.trailing)]
    }
    
    fileprivate init(of object: EdgeAnchorable) {
        self.subject = object
    }
}

public extension UIView {
    /// A layout anchor representing the top, leading, bottom and trailing edges of the view's frame.
    var edgesAnchor: LayoutEdges {
        return LayoutEdges(of: self)
    }
}

public extension UILayoutGuide {
    /// A layout anchor representing the top, leading, bottom and trailing edges of the layout guide's frame.
    var edgesAnchor: LayoutEdges {
        return LayoutEdges(of: self)
    }
}

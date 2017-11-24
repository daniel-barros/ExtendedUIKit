//
//  UIView.swift
//  ExtendedUIKit iOS
//
//  Created by Daniel Barros López on 11/24/17.
//  Copyright © 2017 Daniel Barros. All rights reserved.
//

import UIKit

public extension UIView {
    /// Same as animate(withDuration:animations:) but taking a first parameter `animated`. If true the animations closure is performed animated, otherwise it is performed without animation.
    class func animate(_ animated: Bool, duration: TimeInterval, animations: @escaping () -> Swift.Void) {
        if animated {
            animate(withDuration: duration, animations: animations)
        } else {
            animations()
        }
    }
    
    /// Same as animate(withDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:) but taking a first parameter `animated`. If true the animations closure is performed animated, otherwise it is performed without animation.
    class func animate(_ animated: Bool, duration: TimeInterval, delay: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat, options: UIViewAnimationOptions = [], animations: @escaping () -> Swift.Void) {
        if animated {
            animate(withDuration: duration, delay: delay, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity, options: options, animations: animations, completion: nil)
        } else {
            animations()
        }

    }
}

//
//  UIView+Extensions.swift
//  LeadLinkApp
//
//  Created by Marko Dimitrijevic on 11/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

extension UIView {
    static func closestParentObject<T: UIView, U: UIView>(for object: T, ofType type: U.Type) -> U? {
        guard let parent = object.superview else {
            return nil
        }
        if let parent = parent as? U {
            return parent
        } else {
            return closestParentObject(for: parent, ofType: type)
        }
    }
}

extension UIView {
    func removeAllSubviews() {
        _ = subviews.map {$0.removeFromSuperview()}
    }
    // increse or decrease just
    func resizeHeight(by amount: CGFloat) {
        let actualFrame = self.frame
        let new = CGRect.init(origin: actualFrame.origin, size: CGSize.init(width: actualFrame.width, height: actualFrame.height + amount))
        self.frame = new
    }
//    func resizeWidth(by amount: CGFloat) {
//        let actualFrame = self.frame
//        let new = CGRect.init(origin: actualFrame.origin, size: CGSize.init(width: actualFrame.width + amount, height: actualFrame.height))
//        self.frame = new
//    }
//    func resize(byWidth width: CGFloat, byHeight height: CGFloat) {
//        self.resizeWidth(by: width)
//        self.resizeHeight(by: height)
//    }
}

extension UIView {
    func locateClosestChild<T: UITextInput>(ofType objectType: T.Type) -> T? {
        
//        if type(of: self) is UITextField || type(of: self) is UITextView {
//            return self as! T
//        }
        
        if self.subviews.count == 0 {
            return nil
        } else {
            let matchedTypeSubviews = self.subviews.compactMap { subview -> T? in
                if type(of: subview) is T.Type {
                    return subview as! T
                } else {
                    return subview.locateClosestChild(ofType: objectType)
                }
            }
            return matchedTypeSubviews.first
        }
    }
}

extension UIView {
    func findViews<T: UIView>(subclassOf: T.Type) -> [T] {
        return recursiveSubviews.compactMap { $0 as? T }
    }
    
    var recursiveSubviews: [UIView] {
        return subviews + subviews.flatMap { $0.recursiveSubviews }
    }
    
    func firstSubview<T: UIView>() -> T? {
        return subviews.compactMap { $0 as? T ?? $0.firstSubview() as? T }.first
    }
    
}

extension UIView {
    
    func superview<T>(of type: T.Type) -> T? {
        return superview as? T ?? superview?.superview(of: type)
    }
    
}

extension UIView {
    func makeRoundedBorder(color: UIColor, cornerRadius: CGFloat) {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = cornerRadius
    }
}

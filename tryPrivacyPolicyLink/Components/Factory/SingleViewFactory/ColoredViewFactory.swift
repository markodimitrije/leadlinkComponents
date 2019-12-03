//
//  ColoredViewFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 03/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class ColoredViewFactory: GetViewProtocol {
    
    private var myView: UIView!
    func getView() -> UIView {
        return self.myView
    }
    
    init(width: CGFloat = 300.0, height: CGFloat = 100.0, color: UIColor = .red) {
        let size = CGSize(width: width, height: height)
        let view = IntrinsicContentSizeView.init(frame: CGRect.init(origin: .zero, size: size))
        view.backgroundColor = color
        self.myView = view
    }
    
}

class IntrinsicContentSizeView: UIView {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: self.bounds.width, height: self.bounds.height)
    }
}

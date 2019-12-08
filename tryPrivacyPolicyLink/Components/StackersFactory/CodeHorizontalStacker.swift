//
//  CodeHorizontalStacker.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 22/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class AxisStackView: UIStackView {
    init(axis: NSLayoutConstraint.Axis, spacing: CGFloat, views: [UIView]) {
        super.init(frame: CGRect.zero)
        self.axis = axis
        self.spacing = spacing
        _ = views.map {self.addArrangedSubview($0)}
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}

class CodeHorizontalStacker: GetViewProtocol {
    
    var myView: UIView
    
    func getView() -> UIView {
        return myView
    }
    
    init(views: [UIView], distribution: UIStackView.Distribution) {

        //Stack View
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = distribution
        stackView.alignment = .center
        stackView.spacing = 8.0

        stackView.translatesAutoresizingMaskIntoConstraints = false;

        _ = views.map { subview -> () in
            stackView.addArrangedSubview(subview)
        }
        
        myView = stackView

    }
    
}

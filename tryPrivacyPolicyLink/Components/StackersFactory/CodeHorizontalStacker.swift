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
    
    init(views: [UIView], width: CGFloat) {

        //Stack View
        let stackView   = UIStackView()
        stackView.axis  = .horizontal
        stackView.distribution  = .fill
        stackView.alignment = .center
        stackView.spacing   = 8.0

        stackView.translatesAutoresizingMaskIntoConstraints = false;

        _ = views.map { subview -> () in
            stackView.addArrangedSubview(subview)
        }

//        stackView.widthAnchor.constraint(equalToConstant: width).isActive = true
        myView = stackView
        //myView = LabelAndTextField(frame: stackView.bounds) // pukne layout, i nema nicega...
    }
    
}

class CodeHorizontalEqualComponentWidthStacker: GetViewProtocol {
    
    var myView: UIView
    
    func getView() -> UIView {
        return myView
    }
    
    init(views: [UIView], width: CGFloat) {

        let numOfViews = CGFloat(views.count)
        let singleViewWidth = width/numOfViews

        //Stack View
        let stackView   = UIStackView()
        stackView.axis  = .horizontal
        stackView.distribution  = .fill
        stackView.alignment = .center
        stackView.spacing   = 8.0

        stackView.widthAnchor.constraint(equalToConstant: width).isActive = true

        stackView.translatesAutoresizingMaskIntoConstraints = false;

        _ = views.map { subview -> () in
            let recalcView = subview
            recalcView.widthAnchor.constraint(equalToConstant: singleViewWidth).isActive = true
            stackView.addArrangedSubview(recalcView)
        }

        myView = stackView
        //myView = LabelAndTextField(frame: stackView.bounds) // pukne layout, i nema nicega...
    }
    
}

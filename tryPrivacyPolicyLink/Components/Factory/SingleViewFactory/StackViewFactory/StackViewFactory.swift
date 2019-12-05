//
//  StackViewFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 05/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class StackViewFactory: GetViewProtocol {
    fileprivate let myView: UIView!
    init(views: [UIView], stackInfo: StackInfoProtocol) {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = stackInfo.axis
        stackView.distribution = stackInfo.distribution
        stackView.alignment = stackInfo.alignment
        stackView.spacing = stackInfo.spacing
        self.myView = stackView
    }
    func getView() -> UIView {
        return self.myView
    }
}

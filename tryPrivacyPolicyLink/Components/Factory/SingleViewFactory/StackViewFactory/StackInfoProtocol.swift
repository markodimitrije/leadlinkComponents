//
//  StackViewInfo.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 05/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

protocol StackInfoProtocol {
    var axis: NSLayoutConstraint.Axis {get}
    var distribution: UIStackView.Distribution {get}
    var alignment: UIStackView.Alignment {get}
    var spacing: CGFloat {get}
}

//
//  LabelAndTextViewCellDropdownFactory.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 06/12/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class LabelAndTextViewCellDropdownFactory: DropdownFactoryProtocol {
    private let myView: UIView
    func getView() -> UIView {
        return myView
    }
    init(cell: LabelWithTextFieldCell) {
        self.myView = cell
    }
}

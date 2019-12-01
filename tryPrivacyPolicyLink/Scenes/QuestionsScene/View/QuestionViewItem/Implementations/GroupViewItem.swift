//
//  GroupViewItem.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class GroupViewItem: QuestionPageViewProtocol {

    private var view: UIView

    init() {
        let groupView = CodeLabelFactory(text: longTitle, width: 414.0).getView()
        self.view = groupView
    }

    func getView() -> UIView {
        return view
    }
}


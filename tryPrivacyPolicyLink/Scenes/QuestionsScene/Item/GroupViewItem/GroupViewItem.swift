//
//  GroupViewItem.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

protocol GroupViewFactoryProtocol: QuestionPageGetViewProtocol {}

class GroupViewItem: GroupViewFactoryProtocol {

    private let viewFactory: GroupViewFactoryProtocol
    private var view: UIView

    init(viewFactory: GroupViewFactoryProtocol) {
        self.viewFactory = viewFactory
        let groupView = viewFactory.getView()
        self.view = groupView
    }

    func getView() -> UIView {
        return view
    }
}

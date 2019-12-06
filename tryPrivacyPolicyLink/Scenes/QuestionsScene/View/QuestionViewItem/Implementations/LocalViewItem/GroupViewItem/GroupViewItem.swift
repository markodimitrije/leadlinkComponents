//
//  GroupViewItem.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

//class GroupViewItem: QuestionPageGetViewProtocol {
//
//    private var view: UIView
//
//    init() {
//        let groupView = CodeLabelFactory(text: longTitle).getView()
//        self.view = groupView
//    }
//
//    func getView() -> UIView {
//        return view
//    }
//}

class GroupViewItem: QuestionPageGetViewProtocol {

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

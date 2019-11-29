//
//  SaveBtnViewItem.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class SaveBtnViewItem: QuestionViewItem {
    func getView() -> UIView {
        let saveBtnView = CodeButtonFactory(title: "Save", width: 414.0).getView()
        return saveBtnView
    }
}

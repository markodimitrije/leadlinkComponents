//
//  SaveBtnViewItem.swift
//  tryPrivacyPolicyLink
//
//  Created by Marko Dimitrijevic on 29/11/2019.
//  Copyright © 2019 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class SaveBtnViewItem: QuestionViewItem {
    
    private var view: UIView
    
    init() {
        let saveBtnView = CodeButtonFactory(title: "Save", width: 414.0).getView()
        self.view = saveBtnView
    }
    
    func getView() -> UIView {
        return self.view
    }
}
